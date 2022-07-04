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
    </head>
    <body>
        <%@include file="components/navbar.jsp"%>
        
        <div class="container">
            <h1>Welcome to Products</h1>
            <div>
                
                <%
                    List<Product> products;
                    if (categoryId == 0){
                        products = proDao.getAllProducts();
                    }else {
                        products = proDao.getProductsByCategory(categoryId);
                    }
                    for(Product product : products){
                        %>
                            <div>
                                <div>
                                    <img src="<%=product.getImg()%>" width="150">
                                    <div>
                                        <h5><%=product.getTitle()%></h5>
                                        <p><%=product.getPrice()%> USD</p>
                                        <a href="product_preview?product=<%=product.getId()%>">Preview</a>
                                    </div>
                                </div>
                            </div>
                        <%
                    }
                %>
            
            </div>
        </div>

        <%@include file="components/footer.jsp"%>
    </body>
</html>
