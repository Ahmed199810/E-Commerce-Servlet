<%-- 
    Document   : index
    Created on : Jun 28, 2022, 7:50:28 PM
    Author     : Ahmed
--%>


<%@page import="com.ecommapp.dao.CategoryDao"%>
<%@page import="com.ecommapp.models.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.ecommapp.dao.ProductDao"%>
<%@page import="com.ecommapp.database.DBConnect"%>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setHeader("Expires", "0");
    CategoryDao categories = new CategoryDao(DBConnect.getConn());
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
    </head>
    <body>
        <%@include file="components/navbar.jsp"%>
        
        <div class="container">
            <h1>Welcome to E-commerce</h1>
            <div>
                
                <%
                    List<Category> categs = categories.getAllCategories();
                    for(Category category : categs){
                        %>
                            <div>
                                <div>
                                    <img src="<%=category.getImg()%>" width="150">
                                    <div>
                                        <h5><%=category.getTitle()%></h5>
                                        <a href="products?category=<%=category.getId()%>">Open</a>
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