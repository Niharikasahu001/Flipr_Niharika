<%@page import="com.hibernate.ecommerce1.entities.User"%>
<%
    User user1 = (User) session.getAttribute("current-user");
%>    


<nav class="navbar navbar-expand-lg navbar-dark custom-bg">
    <div class="container">
        <a class="navbar-brand" href="index.jsp">Flipr AI</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="index.jsp">Home</a>
                </li>
                <%
                    if (user1 == null) {
                %>
                
                <li class="nav-item">
                    <a class="nav-link" href="customers.jsp">Customer</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="purchase.jsp">Purchase Order</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="shipping.jsp">Shipping Details</a>
                </li>
                <%}%>
            </ul>
            <ul class="navbar-nav ml-auto">
            
                <%
                    if (user1 == null) {
                %>
                <li class="nav-item active">
                    <a class="nav-link"  href="login.jsp">Login</a>
                </li> 
                <li class="nav-item active">
                    <a class="nav-link"  href="register.jsp">Register</a>
                </li>
                <%
                } else {

                %>
                <li class="nav-item active">
                    <a class="nav-link"  href="login.jsp"><%=user1.getUserName()%></a>
                </li> 
                <li class="nav-item active">
                    <a class="nav-link"  href="LogoutServlet">Logout</a>
                </li>
                <%}%>
            </ul>
<!--            <form class="d-flex">
                <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-success" type="submit">Search</button>
            </form>-->
        </div>
    </div>
</nav>
