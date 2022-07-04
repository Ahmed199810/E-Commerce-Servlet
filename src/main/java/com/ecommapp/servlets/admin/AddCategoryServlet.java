/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ecommapp.servlets.admin;

import com.ecommapp.dao.CategoryDao;
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
@WebServlet(name = "AddCategoryServlet", urlPatterns = {"/add_category"})
public class AddCategoryServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher rd = req.getRequestDispatcher("admin/add_category.jsp");
        rd.forward(req, resp); 
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        String categoryName = req.getParameter("category_name");
        Part filePart = req.getPart("file");
        String fileName = filePart.getSubmittedFileName();
        CategoryDao dao = new CategoryDao(DBConnect.getConn());
        for (Part part : req.getParts()) {
            String path = System.getProperty("user.dir");
            System.out.println("PPPPPPPPPPPPPPPP : " + path);
            String uploadPath = path + "\\uploads\\" + fileName;
            part.write(uploadPath);
            dao.createCategory(categoryName, uploadPath);
        }
        resp.sendRedirect("admin_category");
    }
    
}