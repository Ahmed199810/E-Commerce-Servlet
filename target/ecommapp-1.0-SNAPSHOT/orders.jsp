<%-- 
    Document   : orders
    Created on : Jun 29, 2022, 11:32:32 AM
    Author     : Ahmed
--%>

<%@page import="com.ecommapp.models.Order"%>
<%@page import="java.util.List"%>
<%@page import="com.ecommapp.dao.OrderDao"%>
<%@page import="com.ecommapp.dao.CartDao"%>
<%@page import="com.ecommapp.database.DBConnect"%>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setHeader("Expires", "0");
    User userO = (User) session.getAttribute("user");
    if (userO == null) {
        response.sendRedirect("login");
        return;
    }
    OrderDao orderDao = new OrderDao(DBConnect.getConn());
    List<Order> userOrders = orderDao.getOrders(userO.getId());
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Orders</title>
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <div class="container">
            <h1>Welcome to Orders</h1>
            
            <table>
                <tr>
                    <th>Order Number</th>
                    <th>Address</th>
                    <th>Date</th>
                    <th>State</th>
                    <th>Actions</th>
                </tr>

                <%                    
                    for (int i = 0; i < userOrders.size(); i++) {
                        Order item = userOrders.get(i);
                %>
                <tr>
                    <td><%=item.getId()%></td>
                    <td><%=item.getAddress()%></td>
                    <td><%=item.getDate_time()%></td>
                    <td><%=item.getState() == 0 ? "Pending" : item.getState() == 1 ? "Shipped" : "Deliverd"%></td>
                    <td><a href="order_details?order=<%=item.getId()%>">Order Details</a></td>
                </tr>
                <%
                    }
                %>
            </table>

            
        </div>
        <%@include file="components/footer.jsp"%>
    </body>
</html>
