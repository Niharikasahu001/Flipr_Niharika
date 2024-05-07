<%@page import="com.hibernate.ecommerce1.helper.Helper"%>
<%@page import="com.hibernate.ecommerce1.entities.Category"%>
<%@page import="com.hibernate.ecommerce1.dao.CategoryDao"%>
<%@page import="com.hibernate.ecommerce1.entities.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.hibernate.ecommerce1.dao.ProductDao"%>
<%@include file="./components/common_css_js.jsp" %>
<%@page import="com.hibernate.ecommerce1.helper.FactoryProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> Page</title>
    </head>
    <body>
        <%@include file="components/navbar.jsp"%>
        <div class="container-fluid">
            <div class="row mt-3 mx-2">

                <%
                    String cat = request.getParameter("category");
//                    out.println(cat);
                    ProductDao dao = new ProductDao(FactoryProvider.getFactory());
                    List<Product> list = null;

                    if (cat == null || cat.trim().equals("all")) {
                        list = dao.getAllProducts();
                    } else {
                        int cid = Integer.parseInt(cat.trim());
                        list = dao.getAllProductsById(cid);
                    }

                    //List<Product> list = dao.getAllProducts();
                    CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
                    List<Category> clist = cdao.getCategories();
                %>
                <!--show categories-->
                <div class="col-md-3">
                    <!--<h1>Number of Categories is <%= clist.size()%></h1>-->
                    <div class="list-group mt-4">
                        <a href="index.jsp?category=all" class="list-group-item list-group-item-action active" aria-current="true">
                            Categories
                        </a>
                        <%
                            for (Category c : clist) {
                        %>
                        <a href="index.jsp?category=<%= c.getCategoryId()%>" class="list-group-item list-group-item-action"><%= c.getCategoryTitle()%></a>
                        <%
                                //out.println(c.getCategoryTitle() + "<br>");
                            }
                        %>

                    </div>
                </div>

                <!--show products-->
                <div class="col-md-9">
                    <h1>Number of products is <%= list.size()%></h1>
                    <div class="row mt-3">
                        
                    
                        <%
                            for (Product product : list) {

                        %>

                            <div class="col-md-3">

                            <div class="card-columns">
                                <!--product card-->
                                <div class="card product-card mt-3">
                                    <div class="container text-center">
                                        <img class="card-img-top mt-2" src="img/product/<%= product.getpPhoto()%>" style="max-height:270px; max-width:100%; width:auto; " alt="Card image cap">

                                    </div>
                                    <div class="card-body">
                                        <h5 class="card-title"><%= product.getpTitle()%></h5>
                                        <p class="card-text">
                                            <%= Helper.get10Words(product.getpDesc())%>
                                        </p>
                                    </div>
                                    <div class="card-footer">
                                        <button class="btn custom-bg text-white" onclick="add_to_cart(<%= product.getpId()%>, '<%= product.getpTitle()%>', '<%= product.getPriceAfterDiscount()%>')">Add to Cart</button>
                                        <button class="btn btn-outline-success">&#8377;<%= product.getPriceAfterDiscount()%>/- <span class="text-secondary discount-label"> &#8377; <%=product.getpPrice()%> <%= product.getpDiscount()%>% off</span></button>
                                    </div>    
                                </div>
                            </div>
                         
                            </div>  

                                <%
                                        //out.println(product.getpTitle() + "<br>");
                                    }
                                    if (list.size() == 0) {
                                        out.println("No items in this Category!!");
                                    }
                                %>
                        
                    </div>              
                       
                </div>
            </div>
        </div>


        <%@include file="components/common_modals.jsp" %>
    </body>
</html>
