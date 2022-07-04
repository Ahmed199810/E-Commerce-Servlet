<%-- 
    Document   : product_preview
    Created on : Jun 29, 2022, 12:55:25 AM
    Author     : Ahmed
--%>

<%@page import="com.ecommapp.models.Product"%>
<%@page import="com.ecommapp.dao.ProductDao"%>
<%@page import="com.ecommapp.database.DBConnect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product Details</title>
    </head>
    <body>
        <%@include file="components/navbar.jsp"%>

        <div class="container">
            <h1>Welcome to Product Preview</h1>
            <div>

                <%                    
                    Integer productId = Integer.parseInt(request.getParameter("product"));
                    ProductDao proDao = new ProductDao(DBConnect.getConn());
                    Product product = proDao.getProductById(productId);
                %>

                <div>
                    <div>
                        <img src="<%=product.getImg()%>" width="300">
                        <div>
                            <h3><%=product.getTitle()%></h3>
                            <h4><%=product.getDetails()%></h4>
                            <p><%=product.getPrice()%> USD</p>
                            <form action="cart" method="post">
                                <input type="hidden" name="product_id" value="<%=product.getId()%>">
                                <input type="submit" value="Add To Cart">
                            </form>
                            
                            <%  
                                String cartMsg = (String) session.getAttribute("cart-msg");
                                if(cartMsg != null){
                                    %>
                                    <div class="alert alert-danger" role="alert" style="color: blue;">
                                        <%=cartMsg %>
                                    </div>
                                    <%
                                    session.removeAttribute("cart-msg");
                                }
                            %>
                            
                        </div>
                    </div>
                </div>

            </div>
        </div>

        <%@include file="components/footer.jsp"%>
    </body>
</html>
