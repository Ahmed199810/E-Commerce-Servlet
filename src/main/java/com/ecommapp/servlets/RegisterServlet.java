/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ecommapp.servlets;

import com.ecommapp.dao.UserDao;
import com.ecommapp.database.DBConnect;
import com.ecommapp.models.User;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Ahmed
 */
@WebServlet(name = "RegisterServlet", urlPatterns = {"/register"})
public class RegisterServlet extends HttpServlet {

     @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher rd = req.getRequestDispatcher("register.jsp");
        rd.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String userPass = request.getParameter("password");
        
        HttpSession session = request.getSession();
        
        if(firstName.equals("") || lastName.equals("") || email.equals("") || phone.equals("") || userPass.equals("")) {
            session.setAttribute("fail-msg", "Please Enter All Required Fields");
            RequestDispatcher dispatcher = request.getRequestDispatcher("register");
            dispatcher.forward(request, response);
            return;
        }
        
        UserDao userDao = new UserDao(DBConnect.getConn());
        
        User user = new User();
        user.setFirstName(firstName);
        user.setLastName(lastName);
        user.setEmail(email);
        user.setPhone(phone);
        user.setPassword(userPass);
        
        boolean b = userDao.createUser(user);

        if(b) {
            session.setAttribute("user", user);
            response.sendRedirect("home");
        } else {
            session.setAttribute("fail-msg", "Invalid Email or Password");
            response.sendRedirect("register");
        }
        
    }
}
