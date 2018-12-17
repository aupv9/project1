/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.UsersDAO;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Users;


@WebServlet("/UsersServlet")
public class UsersServlet extends HttpServlet {

    UsersDAO usersDAO = new UsersDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String command = request.getParameter("command");
        String url = "";
        Users users = new Users();
        HttpSession session = request.getSession();
        switch (command) {
            case "insert":
                users.setUserID(new java.util.Date().getTime());
                users.setUserEmail(request.getParameter("email"));
                users.setUserPass(request.getParameter("pass"));
                users.setUserRole(false);
                usersDAO.insertUser(users);
                session.setAttribute("user", users);
                url = "/index.jsp";
                break;
            case "login":
                users = usersDAO.login(request.getParameter("email"), request.getParameter("pass"));
                if (users != null) {
                    session.setAttribute("user", users);
                    url = "/index.jsp";
                }else{
                    request.setAttribute("error", "Error email or password!");
                    url = "/login.jsp";
                }
                break;
            case "logout":
            	session.invalidate();
            	 url = "/index.jsp";
        }
        RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
        rd.forward(request, response);

    }

}
