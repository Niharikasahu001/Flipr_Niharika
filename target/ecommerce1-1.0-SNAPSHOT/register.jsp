<%-- 
    Document   : register
    Created on : 03-Mar-2024, 3:46:45 pm
    Author     : 91898
--%>
<%@include file="/components/common_css_js.jsp" %>
<%@include file="/components/navbar.jsp"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Signup Page</title>
        <link rel="stylesheet" href="./css/register.css"/>
    </head>
    <body>
        <!--    <row , col-md-6 offset-md-3>-->
        <div class="container-fluid">
            <div class="row">
                <div class=" col-md-6 offset-md-3 containers">
                    <%@include file="./components/message.jsp"%>
                    <img src="./img/s_logo.jpg" width="200px" height="200px" alt="logo" class="center"/>
                    <h3 class="center">Signup here!!</h3>
                    <form action="NewServlet" method="post">
                        <label for="name">Name:</label>
                        <input type="text" id="name" name="name" placeholder="Enter your name" required>

                        <label for="email">Email:</label>
                        <input type="email" id="email" name="email" placeholder="Enter your email" required>

                        <label for="password">Password:</label>
                        <input type="password" id="password" name="password" placeholder="Enter your password" required>

                        <label for="phone">Phone no.:</label>
                        <input type="number" id="phone" name="phone" placeholder="Enter your Phone no." required>

                        <label for="address">Address</label>
                        <textarea style="height:150px;" class="form-control" placeholder="Enter your address" name="address"></textarea>

                        <div class="container text-center">
                            <button class="btn btn-outline-success">Register</button>
                            <button class="btn btn-outline-warning">Reset</button>

                        </div>    
                        <p>Already have an account? <a href="#">Login here</a></p>
                        
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
