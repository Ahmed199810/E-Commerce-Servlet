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
        <title>Add Category</title>
    </head>
    <body>
        <%@include file="../components/navbar.jsp" %>
        
        <div class="container">
            
            <h1>Welcome to Add Category</h1>
            
            <form method="post" enctype="multipart/form-data" action="add_category">
                <input type="text" placeholder="Category Name" name="category_name" required="">
                <br>
                <br>
                <input type="file" name="file" value="Select Photo" required=""/>
                <br>
                <br>
                <input type="submit" value="Save">
            </form>
            
        </div>
        
        
        <%@include file="../components/footer.jsp" %>
    </body>
</html>
