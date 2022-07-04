/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ecommapp.servlets;

import com.ecommapp.dao.CartDao;
import com.ecommapp.dao.OrderDao;
import com.ecommapp.database.DBConnect;
import com.ecommapp.models.Cart;
import com.ecommapp.models.User;
import java.io.IOException;
import java.util.List;
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
@WebServlet(name = "DeliveryServlet", urlPatterns = {"/delivery"})
public class DeliveryServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher rd = req.getRequestDispatcher("delivery.jsp");
        rd.forward(req, resp);
    }
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");
        String address = req.getParameter("address");
        
        CartDao cartDao = new CartDao(DBConnect.getConn());
        List<Cart> items = cartDao.getCartProducts(user.getId());
        OrderDao orderDao = new OrderDao(DBConnect.getConn());
        boolean b = orderDao.completeOrder(user.getId(), address, items);
        if(b){
            session.setAttribute("delivery-msg", "Order Completed");
            resp.sendRedirect("delivery");
        } else {
            session.setAttribute("delivery-msg", "Can't Complete Order");
            resp.sendRedirect("delivery");
        }
        
    }
}
