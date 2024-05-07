<%-- 
    Document   : customers
    Created on : 07-May-2024, 3:22:06 pm
    Author     : 91898
--%>




<%@page import="com.hibernate.ecommerce1.entities.Category"%>
<%@page import="com.hibernate.ecommerce1.helper.FactoryProvider"%>
<%@page import="com.hibernate.ecommerce1.dao.UserDAO"%>
<%@page import="com.hibernate.ecommerce1.entities.User"%>
<%@page import="com.hibernate.ecommerce1.entities.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.hibernate.ecommerce1.dao.ProductDao"%>
<%@page import="com.hibernate.ecommerce1.dao.CategoryDao"%>
<%
//                    List<Product> list = dao.getAllProducts();
                    UserDAO udao = new UserDAO(FactoryProvider.getFactory());
                    List<User> ulist = udao.getAllUsers();
                    
                %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Customer Information</title>
  <!-- Bootstrap CSS -->
  <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<div class="container mt-5">
  <h2>Customer Information</h2>
  <div class="table-responsive">
    <table class="table table-striped">
      <thead>
        <tr>
          <!--<th><%= // ulist.getUserName(); %></th>-->
          <th>Customer Name</th>
          <th>Email</th>
          <th>Mobile Number</th>
          <th>City</th>
        </tr>
      </thead>
      <tbody>
        <tr>
        <%
            for(User user : ulist)
            {
        %> 
          <td><%= user.getUserName()%></td>
          <td>John Doe</td>
          <td>john@example.com</td>
          <td>1234567890</td>
          <td>New York</td>
        </tr>
        <%}%>
        <!-- Add more rows as needed -->
      </tbody>
    </table>
  </div>
</div>

<!-- Bootstrap JS and dependencies -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>

