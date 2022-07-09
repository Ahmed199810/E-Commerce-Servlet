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
    if (userCheckReg != null) {
        response.sendRedirect("home");
    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>
        <link rel="stylesheet" href="css/style.css">
    </head>
    <%@include file="components/navbar.jsp"%>

    <div class="container">
        <h1>Welcome to Register</h1>

        <div class="login-form">
            <form action="register" method="post">
                <div class="imgcontainer">
                    <img src="images/cs.png" alt="Avatar" class="avatar" width="200">
                </div>
                <label for="uname"><b>First Name</b></label>
                <input placeholder="First Name" type="text" name="firstName" required="">
                <br>
                <br>
                <label for="uname"><b>Last Name</b></label>
                <input placeholder="Last Name" type="text" name="lastName" required="">
                <br>
                <br>
                <label for="uname"><b>Email</b></label>
                <input placeholder="Email" type="email" name="email" required="">
                <br>
                <br>
                <label for="uname"><b>Phone</b></label>
                <input placeholder="Phone" type="text" name="phone" required="">
                <br>
                <br>
                <label for="uname"><b>Password</b></label>
                <input placeholder="Password" type="password" name="password" required="">
                <br>
                <br>
                <input type="submit" value="Register">
                <br>
                <br>
                <a href="login">Already Have Account ? Login Here</a>
                <br>
                <br>
                <%                    String failMsg = (String) session.getAttribute("fail-msg");
                    if (failMsg != null) {
                %>
                <div class="alert alert-danger" role="alert" style="color: red;">
                    <%=failMsg%>
                </div>
                <%
                        session.removeAttribute("fail-msg");
                    }
                %>
            </form>

        </div>
    </div>

    <%@include file="components/footer.jsp"%>
</html>
