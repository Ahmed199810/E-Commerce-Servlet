<%-- 
    Document   : admin_products
    Created on : Jun 29, 2022, 11:55:56 PM
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
        <title>Products</title>
        <link rel="stylesheet" href="../ecommapp/css/style.css">
    </head>
    <body>
        <%@include file="../components/navbar.jsp"%>
        
        <div class="container">
            <h1>Products</h1>
            <div>
                <table>
                    <tr>
                        <th>#</th>
                        <th>Title</th>
                        <th>Image</th>
                        <th>Details</th>
                        <th>Quantity</th>
                        <th>Price</th>
                        <th>Preview</th>
                        <th>Edit</th>
                        <th>Delete</th>
                    </tr>
                    
                    <%
                    List<Product> products;
                    if (categoryId == 0){
                        products = proDao.getAllProducts();
                    }else {
                        products = proDao.getProductsByCategory(categoryId);
                    }
                    
                    for(Product product : products){
                        %>
                        
                        <tr>
                            <th><%=product.getId()%></th>
                            <th><%=product.getTitle()%></th>
                            <th><img src="<%=product.getImg()%>" width="80"></th>
                            <th><%=product.getDetails()%></th>
                            <th>5</th>
                            <th><p><%=product.getPrice()%> USD</p></th>
                            <th>
                                <div>
                                    <a href="product_preview?product=<%=product.getId()%>">Preview</a>
                                </div>
                            </th>
                            <th>
                                <div>
                                    <a href="edit_product?pid=<%=product.getId()%>">Edit</a>
                                </div>
                            </th>
                            <th>
                                <div>
                                    <form method="post" action="delete_product">
                                        <input type="hidden" name="product" value="<%=product.getId()%>">
                                        <input type="submit" value="Delete">
                                    </form>
                                </div>
                            </th>
                        </tr>
                            
                        <%
                    }
                %>
                
                </table>
            </div>
        </div>

        <%@include file="../components/footer.jsp"%>
    </body>
</html>
