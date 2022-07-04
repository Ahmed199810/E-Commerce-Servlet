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
@WebServlet(name = "LoginServlet", urlPatterns = {"/login"})
public class LoginServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher rd = req.getRequestDispatcher("login.jsp");
        rd.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String userName = req.getParameter("email");
        String userPass = req.getParameter("password");
        
        UserDao userDao = new UserDao(DBConnect.getConn());
        
        User user = userDao.loginUser(userName, userPass);
        
        HttpSession session = req.getSession();
        
        if(user != null){
            session.setAttribute("user", user);
            resp.sendRedirect("home");
        } else{
            session.setAttribute("fail-msg", "Invalid Email or Password");
            resp.sendRedirect("login");
        }
    }
    
    
    
    
}
