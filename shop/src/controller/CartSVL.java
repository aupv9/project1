package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ProductDAO;
import model.Cart;
import model.Item;
import model.Product;

/**
 * Servlet implementation class CartSVL
 */
@WebServlet("/CartSVL")
public class CartSVL extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	ProductDAO productDAO=new ProductDAO();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CartSVL() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 HttpSession session = request.getSession();
	        String command = request.getParameter("command");
	        String productID = request.getParameter("productID");
	        Cart cart = (Cart) session.getAttribute("cart");
	        
	        try {
	            Long idProduct = Long.parseLong(productID);
	            Product product = productDAO.getProduct(idProduct);
	            switch (command) {
	                case "plus":
	                    if (cart.getCartItems().containsKey(idProduct)) {
	                        cart.plusToCart(idProduct, new Item(product,
	                                cart.getCartItems().get(idProduct).getQuantity()));
	                    } else {
	                        cart.plusToCart(idProduct, new Item(product, 1));
	                    }
	                    break;
	                case "remove":
	                    cart.removeToCart(idProduct);
	                    break;
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	            RequestDispatcher  rd=request.getRequestDispatcher("/shop/index.jsp");
	            
	            rd.forward(request, response);
	        }
	        session.setAttribute("cart", cart);
	        RequestDispatcher  rd=request.getRequestDispatcher("/index.jsp");
	        
	        rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
