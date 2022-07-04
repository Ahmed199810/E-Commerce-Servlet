<%-- 
    Document   : cart
    Created on : Jun 29, 2022, 12:28:45 AM
    Author     : Ahmed
--%>

<%@page import="com.ecommapp.models.Cart"%>
<%@page import="java.util.List"%>
<%@page import="com.ecommapp.database.DBConnect"%>
<%@page import="com.ecommapp.dao.CartDao"%>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setHeader("Expires", "0");
    User userCart = (User) session.getAttribute("user");
    if (userCart == null) {
        response.sendRedirect("login");
        return;
    }
    CartDao cartDao = new CartDao(DBConnect.getConn());
    List<Cart> cartItems = cartDao.getCartProducts(userCart.getId());
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cart</title>
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>
        <%@include file="components/navbar.jsp"%>

        <div class="container">
            <h1>Welcome to CART</h1>
            <%
                if(cartItems.size() == 0){
                    %>
                        <h3>No Items in Cart</h3>
                    <%
                } else {
                    %>
                    <table>
                        <tr>
                            <th>#</th>
                            <th>Title</th>
                            <th>Image</th>
                            <th>Price</th>
                            <th>Quantity</th>
                            <th>Sub Total</th>
                            <th>Actions</th>
                        </tr>

                        <%
                            float total = 0;
                            for (int i = 0; i < cartItems.size(); i++) {
                                Cart item = cartItems.get(i);
                                total += item.getQuantity() * item.getProduct().getPrice();
                        %>
                        <tr>
                            <td><%=i + 1%></td>
                            <td><%=item.getProduct().getTitle()%></td>
                            <td><img src="<%=item.getProduct().getImg()%>" width="150"></td>
                            <td><%=item.getProduct().getPrice()%></td>
                            <td><%=item.getQuantity()%></td>
                            <td><%=item.getQuantity() * item.getProduct().getPrice()%> USD</td>
                            <td><form method="post" action="cart_remove"><input type="hidden" name="pid" value="<%=item.getProduct().getId()%>"><input type="submit" value="Remove"></form></td>
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
                            <th><a href="delivery">Complete Order</a></th>
                        </tr>

                    </table>

                    <%
                }
            %>
            <%  
                String cartMsg = (String) session.getAttribute("cart-msg");
                if(cartMsg != null){
                    %>
                    <div class="alert alert-danger" role="alert" style="color: blue;">
                        <%=cartMsg %>
                    </div>
                    <%
                    session.removeAttribute("cart-msg");
                }
            %>

        </div>

        <%@include file="components/footer.jsp"%>
    </body>
</html>
