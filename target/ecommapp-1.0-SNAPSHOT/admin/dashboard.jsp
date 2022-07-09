<%-- 
    Document   : dashboard
    Created on : Jun 29, 2022, 11:38:36 PM
    Author     : Ahmed
--%>

<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setHeader("Expires", "0");
    User userAdmin = (User) session.getAttribute("user");
    if (userAdmin == null) {
        response.sendRedirect("login");
        return;
    }
    if (userAdmin.getId() != 1) {
        response.sendRedirect("home");
        return;
    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Dashboard</title>
        <link rel="stylesheet" href="../ecommapp/css/style.css">
    </head>
    <body>
        <%@include file="../components/navbar.jsp" %>

        <div class="container">
            <h1>Welcome to Dashboard</h1>

            <div class="dashboard">
                <a href="admin_products">Products</a>
                <br>
                <br>
                <br>
                <a href="add_product">Add New Product</a>
                <br>
                <br>
                <br>
                <a href="admin_category">Categories</a>
                <br>
                <br>
                <br>
                <a href="add_category">Add New Category</a>
                <br>
                <br>
                <br>
                <a href="admin_users">Users</a>
                <br>
                <br>
                <br>
                <a href="admin_orders">Orders</a>
                <br>
                <br>
                <br>
            </div>

        </div>

        <%@include file="../components/footer.jsp" %>
    </body>
</html>