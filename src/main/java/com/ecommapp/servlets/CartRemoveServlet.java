/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ecommapp.servlets;

import com.ecommapp.dao.CartDao;
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
@WebServlet(name = "CartRemoveServlet", urlPatterns = {"/cart_remove"})
public class CartRemoveServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher rd = req.getRequestDispatcher("cart.jsp");
        rd.forward(req, resp);
    }
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");
        Integer pid = Integer.parseInt(req.getParameter("pid"));
        
        CartDao dao = new CartDao(DBConnect.getConn());
        boolean b = dao.removeFromCart(user.getId(), pid);
        
        if(b){
            session.setAttribute("cart-msg", "Removed From Cart");
            resp.sendRedirect("cart");
        } else {
            session.setAttribute("cart-msg", "Can't Removed From Cart");
            resp.sendRedirect("cart");
        }
        
    }

}
