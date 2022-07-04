<%-- 
    Document   : register
    Created on : Jun 28, 2022, 10:41:58 PM
    Author     : Ahmed
--%>

<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setHeader("Expires", "0");
    User userCheckReg = (User) session.getAttribute("user");
    if(userCheckReg != null){
        response.sendRedirect("home");
    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>
    </head>
    <%@include file="components/navbar.jsp"%>
        
        <div class="container">
            <h1>Welcome to Register</h1>
            
            <form action="register" method="post">
                <input placeholder="First Name" type="text" name="firstName" required="">
                <br>
                <br>
                <input placeholder="Last Name" type="text" name="lastName" required="">
                <br>
                <br>
                <input placeholder="Email" type="email" name="email" required="">
                <br>
                <br>
                <input placeholder="Phone" type="text" name="phone" required="">
                <br>
                <br>
                <input placeholder="Password" type="password" name="password" required="">
                <br>
                <br>
                <input type="submit" value="Register">
                <br>
                <br>
                <a href="login">Already Have Account ? Login Here</a>
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
</html>
