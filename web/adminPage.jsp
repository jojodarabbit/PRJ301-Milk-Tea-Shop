<%-- 
    Document   : adminPage
    Created on : Jul 1, 2022, 1:14:52 AM
    Author     : Admin
--%>

<%@page import="java.util.List"%>
<%@page import="sample.shopping.Product"%>
<%@page import="sample.user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Page</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
        <link href="https://netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
        <link href='https://unpkg.com/boxicons@2.1.2/css/boxicons.min.css' rel='stylesheet'>
    </head>
    <body>
        <%
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            if (loginUser == null || !"AD".equals(loginUser.getRoleID())) {
                response.sendRedirect("login.jsp");
                return;
            }
        %>
        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-info panel-shadow">
                    <div class="panel-heading">
                        <h3>
                            <img class="img-circle img-thumbnail" src="https://bootdey.com/img/Content/user_3.jpg">
                            <%= loginUser.getName()%>
                        </h3>
                        <a href="MainController?action=Logout" style="margin-left: 29px; border: solid 1px; padding: 5px; border-radius: 3px; text-decoration: none">Logout</a>
                    </div>
                    <div style="display: inline-block">
                        <form action="MainController">
                            <input type="submit" name="action" value="All Product" />
                        </form>
                    </div>
                    <div style="display: inline-block">
                        <form action="createProduct.jsp" >
                            <input type="submit" name="action" value="Add Product" />
                        </form>
                    </div>
                    <%
                        List<Product> listProduct = (List<Product>) request.getAttribute("LIST_PRODUCT");
                        if (listProduct != null && listProduct.size() > 0) {
                    %>
                    <div class="panel-body"> 
                        <div class="table-responsive">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>Product ID</th>
                                        <th>Product Image</th>
                                        <th></th>
                                        <th>Name</th>
                                        <th>Price</th>
                                        <th>Update</th>
                                        <th>Delete</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        for (Product product : listProduct) {
                                    %>
                                <form action="MainController" class="form-inline">
                                    <tr>
                                        <td><%= product.getProductID()%></td>
                                        <td><img src="<%= product.getProductImg()%>" class="img-cart"></td>
                                        <td><input class="col-sm-8 btn btn-default" type="text" name="productImg" value="<%= product.getProductImg()%>"></td>
                                        <td><input type="text" name="productName" value="<%= product.getProductName()%>"></td>
                                        <td><input class="col-sm-8 btn btn-default" type="text" name="productPrice" value="<%= product.getProductPrice()%>"></td>
                                        <td>
                                            <button rel="tooltip" class="btn btn-default" type="submit" name="action" value="UpdateProduct"><i class='bx bxs-edit-alt'></i></button>
                                            <input type="hidden" name="productID" value="<%= product.getProductID()%>"/>
                                        </td>
                                        <td>
                                            <button class="btn btn-primary" type="submit" name="action" value="DeleteProduct"><i class='bx bxs-trash' ></i></i></button>
                                        </td>
                                    </tr>
                                </form>
                                <%
                                    }
                                %>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <%
                        }
                    %>
                </div>
            </div>
        </div>
        <style type="text/css">
            .img-cart {
                display: block;
                max-width: 50px;
                height: auto;
                margin-left: auto;
                margin-right: auto;
            }
            table tr td{
                border:1px solid #FFFFFF;    
            }

            table tr th {
                background:#eee;    
            }

            .panel-shadow {
                box-shadow: rgba(0, 0, 0, 0.3) 7px 7px 7px;
            }
        </style>
    </body>
</html>
