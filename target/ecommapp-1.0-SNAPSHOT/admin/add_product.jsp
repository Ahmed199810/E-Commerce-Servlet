<%-- 
    Document   : add_category
    Created on : Jul 4, 2022, 4:22:14 PM
    Author     : Ahmed
--%>

<%@page import="com.ecommapp.models.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.ecommapp.database.DBConnect"%>
<%@page import="com.ecommapp.dao.CategoryDao"%>
<%
    User userAdmin = (User) session.getAttribute("user");
    if (userAdmin == null) {
        response.sendRedirect("login");
        return;
    }

    if (userAdmin.getId() != 1) {
        response.sendRedirect("home");
        return;
    }

    CategoryDao cDao = new CategoryDao(DBConnect.getConn());
    List<Category> cats = cDao.getAllCategories();

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Product</title>
        <link rel="stylesheet" href="../ecommapp/css/style.css">
    </head>
    <body>
        <%@include file="../components/navbar.jsp" %>

        <div class="container">

            <h1>Welcome to Add Product</h1>

            <div class="login-form">
                <form method="post" enctype="multipart/form-data" action="add_product">
                    <label for="uname"><b>Product Name</b></label>
                    <input type="text" placeholder="Product Name" name="product_name" required="">
                    <br>
                    <br>
                    <label for="uname"><b>Product Details</b></label>
                    <input type="text" placeholder="Product Details" name="product_details" required="">
                    <br>
                    <br>
                    <label for="uname"><b>Product Price</b></label>
                    <input type="number" placeholder="Product Price" name="product_price" required="">
                    <br>
                    <br>
                    <label for="uname"><b>Select Category</b></label>
                    <h3>Select Category</h3>
                    <select name="cid" required="">
                        <%                        for (int i = 0; i < cats.size(); i++) {
                                Category cat = cats.get(i);
                        %>
                        <option value="<%=cat.getId()%>"><%=cat.getTitle()%></option>
                        <%
                            }
                        %>
                    </select>
                    <br>
                    <br>
                    <label for="uname"><b>Select Product Image</b></label>
                    <input type="file" name="file" value="Select Photo" required=""/>
                    <br>
                    <br>
                    <input type="submit" value="Save">
                </form>
            </div>

        </div>

        <%@include file="../components/footer.jsp" %>
    </body>
</html>
