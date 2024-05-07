<%-- 
    Document   : login
    Created on : 03-Mar-2024, 1:53:46 pm
    Author     : 91898
--%>

<%@include file="components/common_css_js.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Login</title>
        <link rel="stylesheet" href="./css/register.css"/>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <div class="container">
            <div class="row">
                <div class="col-md-6 offset-md-3">
                    <div class="card d-block center mt-5">
                        <div class="card-header custom-bg text-white h-10">
                            <center>Login here!!</center>
                        </div>
                        <div class="card-body">
                            <%@include file="components/message.jsp" %>
                            <form action="LoginServlet" method="post">

                                <label for="email">Email:</label>
                                <input type="email" id="email" name="email" placeholder="Enter your email" required>

                                <label for="password">Password:</label>
                                <input type="password" id="password" name="password" placeholder="Enter your password" required>

                                <div class="container text-center">
                                    <button class="btn btn-primary custom-bg border-0">Login</button>
                                </div>    
                                <p>Don't have an account? <a href="register.jsp">Register here</a></p>

                            </form>
                        </div>
                        <!--                        <div class="card-footer"></div>-->
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
