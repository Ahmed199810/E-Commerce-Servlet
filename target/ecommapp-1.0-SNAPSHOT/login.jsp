<%-- 
    Document   : login
    Created on : Jun 28, 2022, 10:41:24 PM
    Author     : Ahmed
--%>

<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setHeader("Expires", "0");
    User userCheck = (User) session.getAttribute("user");
    if(userCheck != null){
        response.sendRedirect("home");
    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>
        <%@include file="components/navbar.jsp"%>
        
        <div class="container">
            <h1>Welcome to Login</h1>
            
            <form action="login" method="post">
                <input placeholder="Email" type="email" name="email", required="">
                <br>
                <br>
                <input placeholder="Password" type="password" name="password" required="">
                <br>
                <br>
                <input type="submit" value="Login">
                <br>
                <br>
                <a href="register">Don't Have Account ? Register Here</a>
                <br>
                <br>
                <%  
                    String failMsg = (String) session.getAttribute("fail-msg");
                    if(failMsg != null){
                        %>
                        <div class="alert alert-danger" role="alert" style="color: red;">
                            <%=failMsg %>
                        </div>
                        <%
                        session.removeAttribute("fail-msg");
                    }
                %>
            </form>
            
        </div>

        <%@include file="components/footer.jsp"%>
    </body>
</html>