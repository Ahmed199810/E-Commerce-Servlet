<%-- 
    Document   : category
    Created on : Jun 28, 2022, 10:05:43 PM
    Author     : Ahmed
--%>

<%@page import="com.ecommapp.dao.CategoryDao"%>
<%@page import="com.ecommapp.database.DBConnect"%>
<%@page import="com.ecommapp.models.Category"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setHeader("Expires", "0");
    CategoryDao categories = new CategoryDao(DBConnect.getConn());
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Categories</title>
    </head>
    <body>
        <%@include file="components/navbar.jsp"%>
        
        <div class="container">
            <h1>Welcome to Categories</h1>
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
