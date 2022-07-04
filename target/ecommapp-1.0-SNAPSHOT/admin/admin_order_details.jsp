<%-- 
    Document   : order_details
    Created on : Jun 29, 2022, 12:40:01 PM
    Author     : Ahmed
--%>

<%@page import="com.ecommapp.models.OrderDetails"%>
<%@page import="com.ecommapp.dao.OrderDao"%>
<%@page import="com.ecommapp.models.Cart"%>
<%@page import="java.util.List"%>
<%@page import="com.ecommapp.dao.CartDao"%>
<%@page import="com.ecommapp.database.DBConnect"%>
<%@page import="com.ecommapp.models.User"%>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setHeader("Expires", "0");
    User userOD = (User) session.getAttribute("user");
    if (userOD == null) {
        response.sendRedirect("login");
        return;
    }
    Integer orderId = Integer.parseInt(request.getParameter("order"));
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Order Details</title>
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>
        <%@include file="../components/navbar.jsp"%>

        <div class="container">
            <h1>Welcome to Order Details</h1>

            <%                OrderDao oDao = new OrderDao(DBConnect.getConn());
                List<OrderDetails> details = oDao.getOrderDetails(orderId);
            %>

            <h3>Address : <%=details.get(0).getAddress()%></h3>
            <h3>Date : <%=details.get(0).getDate_time()%></h3>
            <h3>First Name : <%=details.get(0).getUser().getFirstName()%></h3>
            <h3>Last Name : <%=details.get(0).getUser().getLastName()%></h3>
            <h3>Email : <%=details.get(0).getUser().getEmail()%></h3>
            <h3>Phone : <%=details.get(0).getUser().getPhone()%></h3>
            <h3>Order State : <%=details.get(0).getState() == 0 ? "Pending" : details.get(0).getState() == 1 ? "Shipped" : "Deliverd"%></h3>
            
            <form method="post" action="edit_order">
                <select name="state">
                    <option value="0">Pending</option>
                    <option value="1">Shipped</option>
                    <option value="2">Delivered</option>
                </select>
                <input type="hidden" name="oid" value="<%=details.get(0).getOrder_id()%>">
                <input type="submit" value="Update State">
                <br>
                <br>
            </form>
            
            <table>
                <tr>
                    <th>#</th>
                    <th>Title</th>
                    <th>Image</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Sub Total</th>
                </tr>

                <%
                    float total = 0;
                    for (int i = 0; i < details.size(); i++) {
                        OrderDetails item = details.get(i);
                        total += item.getQuantity() * item.getProduct().getPrice();
                %>
                <tr>
                    <td><%=i + 1%></td>
                    <td><%=item.getProduct().getTitle()%></td>
                    <td><img src="<%=item.getProduct().getImg()%>" width="150"></td>
                    <td><%=item.getProduct().getPrice()%></td>
                    <td><%=item.getQuantity()%></td>
                    <td><%=item.getQuantity() * item.getProduct().getPrice()%> USD</td>
                </tr>
                <%
                    }
                %>

                <tr>
                    <th>#</th>
                    <th></th>
                    <th></th>
                    <th></th>
                    <th>Total</th>
                    <th><%=total%> USD</th>
                </tr>

            </table>

        </div>

        <%@include file="../components/footer.jsp"%>
    </body>

</html>
