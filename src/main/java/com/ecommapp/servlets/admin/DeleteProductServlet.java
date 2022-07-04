/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ecommapp.servlets.admin;

import com.ecommapp.dao.ProductDao;
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
@WebServlet(name = "DeleteProductServlet", urlPatterns = {"/delete_product"})
public class DeleteProductServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String proId = req.getParameter("product");
        ProductDao dao = new ProductDao(DBConnect.getConn());
        boolean b = dao.deleteProduct(Integer.parseInt(proId));
        if (b) {
            resp.sendRedirect("admin_products");
        } else {

        }
    }

}
