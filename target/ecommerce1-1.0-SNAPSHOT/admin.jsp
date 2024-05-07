<%-- 
    Document   : admin
    Created on : 09-Mar-2024, 11:42:59 am
    Author     : 91898
--%>

<%@page import="com.hibernate.ecommerce1.dao.UserDAO"%>
<%@page import="com.hibernate.ecommerce1.dao.ProductDao"%>
<%@page import="java.util.List"%>
<%@page import="com.hibernate.ecommerce1.entities.Category"%>
<%@page import="com.hibernate.ecommerce1.dao.CategoryDao"%>
<%@page import="com.hibernate.ecommerce1.helper.FactoryProvider"%>
<%@page import="com.hibernate.ecommerce1.entities.User"%>
<%@page import="com.hibernate.ecommerce1.entities.Product"%>
<%--<%
    User user = (User)session.getAttribute("current-user");
    if(user==null)
    {
        session.setAttribute("message", "You have been logged out!! Login first");
        response.sendRedirect("login.jsp");
        return;
    }
    else
    {
        if(user.getUserType().equals("normal"))
        {
            session.setAttribute("message","You are not admin ! Do not access this page");
            response.sendRedirect("login.jsp");
            return;
        }
    }
%>--%>

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

//                    List<Product> list = dao.getAllProducts();
                    UserDAO udao = new UserDAO(FactoryProvider.getFactory());
                    List<User> ulist = udao.getAllUsers();
                    
                    CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
                    List<Category> clist = cdao.getCategories();
                %>

<%@include file="./components/common_css_js.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Panel</title>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <div class="container admin">
            <div class="container-fluid mt-3">
                <%@include file="components/message.jsp" %>
            </div>

            <div class="row mt-4">
                <!--first col-->
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 125px" src="./img/team.png" alt="alt" class="image-fluid rounded-circle"/>
                            </div>
                            <h1><%= ulist.size()%></h1>
                            <h1 class="text-uppercase text-muted">User</h1>
                        </div>
                    </div>
                </div>
                <!--second col-->
                <div class="col-md-4">
                    <div class="card text-center">
                        <div class="card-body">
                            <div class="container">
                                <img style="max-width: 125px" src="./img/checklist.png" alt="alt" class="image-fluid rounded-circle"/>
                            </div>
                            <h1><%= clist.size()%></h1>
                            <h1 class="text-uppercase text-muted">Categories</h1>
                        </div>
                    </div>
                </div>
                <!--third col-->
                <div class="col-md-4">
                    <div class="card ">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 125px" src="./img/new-product.png" alt="alt" class="image-fluid rounded-circle"/>
                            </div>
                            <h1><%= list.size()%></h1>
                            <h1 class="text-uppercase text-muted">Products</h1>
                        </div>
                    </div>
                </div>
            </div>
            <!--second row-->
            <div class="row mt-4">
                <div class="col-md-6">
                    <div class="card" data-bs-toggle="modal" data-bs-target="#add-category-modal">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 125px" src="./img/add.png" alt="alt" class="image-fluid rounded-circle"/>
                            </div>
                            <p class="mt-2">Click here to add more categories</p>
                            <h1 class="text-uppercase text-muted">Add Categories</h1>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="card" data-bs-toggle="modal" data-bs-target="#add-product-modal">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 125px" src="./img/add-product.png" alt="alt" class="image-fluid rounded-circle"/>
                            </div>
                            <p class="mt-2">Click here to add products</p>
                            <h1 class="text-uppercase text-muted">Add Products</h1>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <!--Add category modal-->
        <!-- Modal -->
        <div class="modal fade" id="add-category-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header custom-bg text-white">
                        <h5 class="modal-title" id="exampleModalLabel">Fill Category details!!</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form action="ProductOperationServlet" method="post">

                            <input type="hidden" name="operation" value="addcategory"/>

                            <div class="mb-3 form-group">
                                <input type="text" name="cattitle" class="form-control" placeholder="Enter Category title" required/>
                            </div>
                            <div class="mb-3 form-group">
                                <textarea style="height: 350px;" name="catdes" class="form-control" placeholder="Enter Category Details" required></textarea>
                            </div>
                            <div class="container text-center">

                                <button type="submit" class="btn btn-outline-success">Add Category</button>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>

                    </div>
                </div>
            </div>
        </div>
        <!--End Category modal-->

        <!--Add Product Modal-->

        <!-- Modal -->
        <div class="modal fade" id="add-product-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header custom-bg text-white">
                        <h5 class="modal-title" id="exampleModalLabel">Fill Product Details</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form action="ProductOperationServlet" method="post" enctype="multipart/form-data">
                            
                            <input type="hidden" name="operation" value="addproduct">
                            
                            <div class="mb-3 form-group">
                                <input type="text" name="ptitle" class="form-control" placeholder="Enter Product title" required/>
                            </div>
                            <div class="mb-3 form-group">
                                <textarea style="height: 150px;" name="pdes" class="form-control" placeholder="Enter Product Details" required></textarea>
                            </div>
                            <div class="mb-3 form-group">
                                <input type="number" name="pPrice" class="form-control" placeholder="Enter price of product" required/>
                            </div>
                            <div class="mb-3 form-group">
                                <input type="number" name="pDiscount" class="form-control" placeholder="Enter product discount" required/>
                            </div>
                            <div class="mb-3 form-group">
                                <input type="number" name="pQuantity" class="form-control" placeholder="Enter product quantity" required/>
                            </div>

                            <!--product category-->


                            <div class="mb-3 form-group">
                                <select name="catId" class="form-control">

                                    <%                                        
                                        for (Category c : clist) {
                                    %>

                                    <option value="<%=c.getCategoryId()%>"><%= c.getCategoryTitle()%></option>
                                    <% }%>
                                </select>
                            </div>

                            <!--product file-->
                            <div class="form-group">
                                <label for="pPic">Select picture of product</label>
                                <br>
                                <input type="file" id="pPic" name="pPic" required/>
                            </div>


                            <div class="container text-center">

                                <button type="submit" class="btn btn-outline-success">Add Product</button>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>

        <!--End Product Modal-->
    </body>
</html>

