/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ecommapp.servlets.admin;

import com.ecommapp.dao.ProductDao;
import com.ecommapp.database.DBConnect;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author Ahmed
 */
@MultipartConfig(
  fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
  maxFileSize = 1024 * 1024 * 10,      // 10 MB
  maxRequestSize = 1024 * 1024 * 100   // 100 MB
)
@WebServlet(name = "EditProductServlet", urlPatterns = {"/edit_product"})
public class EditProductServlet extends HttpServlet {
    
     @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher rd = req.getRequestDispatcher("admin/edit_product.jsp");
        rd.forward(req, resp); 
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String proName = req.getParameter("product_name");
        String proDetails = req.getParameter("product_details");
        String proPrice = req.getParameter("product_price");
        String proCat = req.getParameter("cid");
        String proId = req.getParameter("pid");
        Part filePart = req.getPart("file");
        if(filePart.getSubmittedFileName().equals("")){
            ProductDao dao = new ProductDao(DBConnect.getConn());
            dao.updateProduct(proName, proDetails, Float.parseFloat(proPrice), Integer.parseInt(proCat), Integer.parseInt(proId));
            resp.sendRedirect("admin_products");
        }else {
            String fileName = filePart.getSubmittedFileName();
            ProductDao dao = new ProductDao(DBConnect.getConn());
            String path = System.getProperty("user.dir");
            System.out.println("PPPPPPPPPPPPPPPP : " + path + " NNNNNNNNN :" + fileName);
            String uploadPath = path + "\\uploads\\" + fileName;
            filePart.write(uploadPath);
            dao.updateProductWithImg(proName, proDetails, Float.parseFloat(proPrice), Integer.parseInt(proCat), path, Integer.parseInt(proId));
            resp.sendRedirect("admin_products");
        }
    }
    
}
