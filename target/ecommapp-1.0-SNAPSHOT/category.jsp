<%-- 
    Document   : category
    Created on : Jun 28, 2022, 10:05:43 PM
    Author     : Ahmed
--%>

<%@page import="com.ecommapp.dao.CategoryDao"%>
<%@page import="com.ecommapp.database.DBConnect"%>
<%@page import="com.ecommapp.models.Category"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setHeader("Expires", "0");
    CategoryDao categories = new CategoryDao(DBConnect.getConn());
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Categories</title>
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>
        <%@include file="components/navbar.jsp"%>
        
        <div class="container">
            <h1>All Categories</h1>
            <div class="category-container">

                <%                    
                    List<Category> categs = categories.getAllCategories();
                    for (Category category : categs) {
                %>
                <a class="home-category" href="products?category=<%=category.getId()%>">
                    <div class="cat-item">
                        <img src="<%=category.getImg()%>">
                        <h5><span><%=category.getTitle()%> </span></h5>
                    </div>
                </a>
                <%
                    }
                %>

            </div>
        </div>

        <%@include file="components/footer.jsp"%>
    </body>
</html>
