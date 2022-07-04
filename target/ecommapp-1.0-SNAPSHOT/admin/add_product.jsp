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
    
    if (userAdmin.getId() != 1){
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
    </head>
    <body>
        <%@include file="../components/navbar.jsp" %>
        
        <div class="container">
            
            <h1>Welcome to Add Product</h1>
            
            <form method="post" enctype="multipart/form-data" action="add_product">
                <input type="text" placeholder="Product Name" name="product_name" required="">
                <br>
                <br>
                <input type="text" placeholder="Product Details" name="product_details" required="">
                <br>
                <br>
                <input type="number" placeholder="Product Price" name="product_price" required="">
                <br>
                <br>
                <h3>Select Category</h3>
                <select name="cid" required="">
                    <%
                        for(int i = 0; i < cats.size(); i++){
                            Category cat = cats.get(i);
                            %>
                                <option value="<%=cat.getId()%>"><%=cat.getTitle()%></option>
                            <%
                        }
                    %>
                </select>
                <br>
                <br>
                <h3>Select Product Image</h3>
                <input type="file" name="file" value="Select Photo" required=""/>
                <br>
                <br>
                <input type="submit" value="Save">
            </form>
            
        </div>
        
        
        <%@include file="../components/footer.jsp" %>
    </body>
</html>
