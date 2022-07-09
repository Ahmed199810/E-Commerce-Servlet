<%-- 
    Document   : add_category
    Created on : Jul 4, 2022, 4:22:14 PM
    Author     : Ahmed
--%>

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

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Category</title>
        <link rel="stylesheet" href="../ecommapp/css/style.css">
    </head>
    <body>
        <%@include file="../components/navbar.jsp" %>

        <div class="container">

            <h1>Welcome to Add Category</h1>

            <div class="login-form">
                <form method="post" enctype="multipart/form-data" action="add_category">
                    <label for="uname"><b>Category Name</b></label>
                    <input type="text" placeholder="Category Name" name="category_name" required="">
                    <br>
                    <br>
                    <label for="uname"><b>Select Image</b></label>
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
