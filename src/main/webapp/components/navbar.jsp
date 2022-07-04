<%@page import="com.ecommapp.models.User"%>
<%
    User user = (User) session.getAttribute("user");
%>
<nav>
    <ul>
        <li><a class="active" href="/ecommapp">Home</a></li>
        <li><a href="products">Products</a></li>
        <li><a href="category">Categories</a></li>

        <%
            if (user == null) {
        %>
        <li><a href="login">Login</a></li>
        <li><a href="cart">Cart</a></li>
            <%
            } else {
                if (user.getId() == 1) { // admin
            %>
        <li><a href="dashboard">Dashboard</a></li>
        <li><a href="cart">Cart</a></li>
        <li><a href="logout">Logout</a></li>
            <%
            } else {
            %>
        <li><a href="profile">Profile</a></li>
        <li><a href="cart">Cart</a></li>
        <li><a href="logout">Logout</a></li>
            <%
                }
            %>

        <%
            }
        %>
        
    </ul>
</nav>