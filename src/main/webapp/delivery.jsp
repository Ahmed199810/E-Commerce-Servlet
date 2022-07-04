<%-- 
    Document   : delivery
    Created on : Jun 29, 2022, 10:45:09 AM
    Author     : Ahmed
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delivery</title>
    </head>
    <body>
        <%@include file="components/navbar.jsp"%>

        <div class="container">
            <h1>Welcome to Delivery</h1>
            <form method="post" action="delivery">
                <input type="text" name="address" placeholder="Delivery Address" required="">
                <br>
                <br>
                <input type="submit" value="Complete">
            </form>
        </div>
        
        <%  
            String deliveryMsg = (String) session.getAttribute("delivery-msg");
            if(deliveryMsg != null){
                %>
                <div class="alert alert-danger" role="alert" style="color: blue;">
                    <%=deliveryMsg %>
                </div>
                <%
                session.removeAttribute("delivery-msg");
            }
        %>

        <%@include file="components/footer.jsp"%>
    </body>
</html>
