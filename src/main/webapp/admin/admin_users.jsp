<%-- 
    Document   : admin_products
    Created on : Jun 29, 2022, 11:55:56 PM
    Author     : Ahmed
--%>

<%@page import="com.ecommapp.dao.UserDao"%>
<%@page import="com.ecommapp.models.User"%>
<%@page import="com.ecommapp.models.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.ecommapp.dao.ProductDao"%>
<%@page import="com.ecommapp.database.DBConnect"%>
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
    
    UserDao uDao = new UserDao(DBConnect.getConn());

%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Users</title>
        <link rel="stylesheet" href="../ecommapp/css/style.css">
    </head>
    <body>
        <%@include file="../components/navbar.jsp"%>
        
        <div class="container">
            <h1>Welcome to Users</h1>
            <div>
                <table>
                    <tr>
                        <th>#</th>
                        <th>First Name</th>
                        <th>Last Name</th>
                        <th>Email</th>
                        <th>Password</th>
                    </tr>
                    
                    <%
                    List<User> users = uDao.getAllUsers();
                    
                    for(User u : users){
                        %>
                        
                        <tr>
                            <th><%=u.getId()%></th>
                            <th><%=u.getFirstName()%></th>
                            <th><%=u.getLastName()%></th>
                            <th><%=u.getEmail()%></th>
                            <th><%=u.getPassword()%></th>
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
