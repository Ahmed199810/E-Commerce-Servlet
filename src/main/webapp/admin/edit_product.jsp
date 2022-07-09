<%-- 
    Document   : add_category
    Created on : Jul 4, 2022, 4:22:14 PM
    Author     : Ahmed
--%>

<%@page import="com.ecommapp.models.Product"%>
<%@page import="com.ecommapp.dao.ProductDao"%>
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
    
    Integer pid = 0;
    if(request.getParameter("pid") != null){
        pid = Integer.parseInt(request.getParameter("pid"));
    }
    
    ProductDao pDao = new ProductDao(DBConnect.getConn());
    Product pro = pDao.getProductById(pid);
    
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Product</title>
        <link rel="stylesheet" href="../ecommapp/css/style.css">
    </head>
    <body>
        <%@include file="../components/navbar.jsp" %>
        
        <div class="container">
            
            <h1>Welcome to Edit Product</h1>
            
            <form method="post" enctype="multipart/form-data" action="edit_product">
                <input type="text" placeholder="Product Name" name="product_name" required="" value="<%=pro.getTitle()%>">
                <br>
                <br>
                <input type="text" placeholder="Product Details" name="product_details" required="" value="<%=pro.getDetails()%>">
                <br>
                <br>
                <input type="number" placeholder="Product Price" name="product_price" required="" value="<%=pro.getPrice()%>">
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
                <input type="file" name="file" value="Select Photo"/>
                <br>
                <br>
                <input type="hidden" name="pid" value="<%=pro.getId()%>">
                <input type="submit" value="Save">
            </form>
            
        </div>
        
        
        <%@include file="../components/footer.jsp" %>
    </body>
</html>
