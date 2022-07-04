<%-- 
    Document   : products
    Created on : Jun 28, 2022, 10:01:44 PM
    Author     : Ahmed
--%>
<%@page import="com.ecommapp.models.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.ecommapp.dao.ProductDao"%>
<%@page import="com.ecommapp.database.DBConnect"%>
<%
    ProductDao proDao = new ProductDao(DBConnect.getConn());
    
    Integer categoryId = 0;
    if(request.getParameter("category") != null){
        categoryId = Integer.parseInt(request.getParameter("category"));
    }

%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Products</title>
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <body>
        <%@include file="components/navbar.jsp"%>
        
        <div class="container">
            <h2>All Products</h2>
            <div class="search-container">
                <form action="search_products">
                    <input type="text" placeholder="Search.." name="search">
                    <button type="submit"><i class="fa fa-search"></i></button>
                </form>
            </div>
            <br>
            <br>
            <%
                List<Product> products;
                if (categoryId == 0){
                    products = proDao.getAllProducts();
                }else {
                    products = proDao.getProductsByCategory(categoryId);
                }
                for(Product product : products){
                    %>
                    <a class="pro-card" href="product_preview?product=<%=product.getId()%>">
                        <div class="pro-card-item">
                            <img src="<%=product.getImg()%>" width="150">
                            <h5><span><%=product.getTitle()%> </span></h5>
                            <p><%=product.getPrice()%> USD</p>
                        </div>
                    </a>
                    <%
                }
            %>
        </div>

        <%@include file="components/footer.jsp"%>
    </body>
</html>
