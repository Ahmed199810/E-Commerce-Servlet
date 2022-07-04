<%-- 
    Document   : admin_products
    Created on : Jun 29, 2022, 11:55:56 PM
    Author     : Ahmed
--%>

<%@page import="com.ecommapp.models.Category"%>
<%@page import="com.ecommapp.dao.CategoryDao"%>
<%@page import="com.ecommapp.models.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.ecommapp.dao.ProductDao"%>
<%@page import="com.ecommapp.database.DBConnect"%>
<%
    CategoryDao catDao = new CategoryDao(DBConnect.getConn());
    User userAdmin = (User) session.getAttribute("user");
    if (userAdmin == null) {
        response.sendRedirect("login");
        return;
    }
    
    if (userAdmin.getId() != 1){
        response.sendRedirect("home");
        return;
    }
    
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Products</title>
        <link rel="stylesheet" href="../ecommapp/css/style.css">
    </head>
    <body>
        <%@include file="../components/navbar.jsp"%>
        
        <div class="container">
            <h1>Welcome to Products</h1>
            <div>
                <table>
                    <tr>
                        <th>#</th>
                        <th>Title</th>
                        <th>Image</th>
                        <th>Actions</th>
                    </tr>
                    
                    <%
                    List<Category> categories;
                    categories = catDao.getAllCategories();
                    
                    for(Category cat : categories){
                        %>
                        
                        <tr>
                            <th><%=cat.getId()%></th>
                            <th><%=cat.getTitle()%></th>
                            <th><img src="<%=cat.getImg()%>" width="80"></th>
                            <th>
                                <div>
                                    <a href="admin_products?category=<%=cat.getId()%>">View Products</a>
                                </div>
                            </th>
                        </tr>
                            
                        <%
                    }
                %>
                
                </table>
            </div>
        </div>

        <%@include file="../components/footer.jsp"%>
    </body>
</html>
