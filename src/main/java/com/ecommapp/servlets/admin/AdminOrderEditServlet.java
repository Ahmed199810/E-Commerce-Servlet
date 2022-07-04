/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ecommapp.servlets.admin;

import com.ecommapp.dao.OrderDao;
import com.ecommapp.database.DBConnect;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Ahmed
 */
@WebServlet(name = "AdminOrderEditServlet", urlPatterns = {"/edit_order"})
public class AdminOrderEditServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int state = Integer.parseInt(req.getParameter("state"));
        int oid = Integer.parseInt(req.getParameter("oid"));
        OrderDao oDao = new OrderDao(DBConnect.getConn());
        oDao.updateOrderState(oid, state);
        resp.sendRedirect("admin_orders");
    }

}
