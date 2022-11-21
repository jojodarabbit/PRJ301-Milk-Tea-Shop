<%-- 
    Document   : checkOut
    Created on : Jul 5, 2022, 8:34:02 PM
    Author     : Admin
--%>

<%@page import="sample.shopping.OrderDetail"%>
<%@page import="sample.user.UserDTO"%>
<%@page import="sample.shopping.Cart"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Check Out</title>
        <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
        <link href="https://netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    </head>
    <body>
        <%
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            if (loginUser == null || !"US".equals(loginUser.getRoleID())) {
                response.sendRedirect("login.jsp");
                return;
            }
        %>
        <%
            Cart cart = (Cart) session.getAttribute("CART");
            if (cart == null) {
        %>
        <div class="container-fluid  mt-100">
            <div class="row">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-body cart">
                            <div class="col-sm-12 empty-cart-cls text-center">
                                <img src="https://i.imgur.com/dCdflKN.png" width="130" height="130" class="img-fluid mb-4 mr-3">
                                <h3><strong>Your Cart is Empty</strong></h3>
                                <h4>Add something to make me happy :)</h4>
                                <a href="MainController?action=Menu" class="btn btn-primary cart-btn-transform m-3" data-abc="true">continue shopping</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <style>
            .mt-100{
                margin-top:100px;
            }
            .card {
                margin-bottom: 30px;
                border: 0;
                -webkit-transition: all .3s ease;
                transition: all .3s ease;
                letter-spacing: .5px;
                border-radius: 8px;
                -webkit-box-shadow: 1px 5px 24px 0 rgba(68,102,242,.05);
                box-shadow: 1px 5px 24px 0 rgba(68,102,242,.05);
            }
            .card .card-header {
                background-color: #fff;
                border-bottom: none;
                padding: 24px;
                border-bottom: 1px solid #f6f7fb;
                border-top-left-radius: 8px;
                border-top-right-radius: 8px;
            }
            .card-header:first-child {
                border-radius: calc(.25rem - 1px) calc(.25rem - 1px) 0 0;
            }
            .card .card-body {
                padding: 30px;
                background-color: transparent;
            }
            .btn-primary, .btn-primary.disabled, .btn-primary:disabled {
                background-color: #4466f2!important;
                border-color: #4466f2!important;
            }
        </style>
        <%
        } else {
        %>
        <link rel="stylesheet" type="text/css" href="//netdna.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css">
        <div class="container bootstrap snippets bootdey">
            <div class="col-md-12 col-sm-8 content">
                <div class="row">
                    <div class="col-md-12">
                        <ol class="breadcrumb">
                        </ol>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="panel panel-info panel-shadow">
                            <div class="panel-heading">
                                <h3>
                                    <img class="img-circle img-thumbnail" src="https://bootdey.com/img/Content/user_3.jpg">
                                    <%= loginUser.getName()%>
                                </h3>
                            </div>
                            <div class="panel-body"> 
                                <div class="table-responsive">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th>Product</th>
                                                <th>Product ID</th>
                                                <th>Quantity</th>
                                                <th>Price</th>
                                                <th>Total</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                                int total = 0;
                                                for (OrderDetail order : cart.getCart().values()) {
                                                    total += order.getQuantity() * order.getProductPrice();
                                            %>
                                        <form action="MainController" method="POST">
                                            <tr>
                                                <td><img src="<%= order.getProductImg()%>" class="img-cart"></td>
                                                <td><strong><%= order.getProductID()%></strong></td>
                                                <td><%= order.getQuantity()%></td>
                                                <td><%= order.getProductPrice()%> $</td>
                                                <td><%= order.getProductPrice() * order.getQuantity()%> $</td>
                                            </tr>
                                            <tr>
                                                <td colspan="6">&nbsp;</td>
                                            </tr>
                                            <%
                                                }
                                            %>
                                            <tr>
                                                <td colspan="4" class="text-right"><strong style="color: red;">Total</strong></td>
                                                <td style="color: red;"><strong><%= total%> $</strong></td>
                                            </tr
                                            </tbody>
                                    </table>
                                    <div class="col-md-12">
                                        <div style="color: #e72734; font-size: 120%; text-align: center"><strong>The bill detail will send to your email <%= loginUser.getEmail()%></strong></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <a href="MainController?action=ViewCart" class="btn btn-success"><span class="glyphicon glyphicon-arrow-left"></span>&nbsp;Edit Cart</a>
                        <input type="hidden" name="userID" value="<%= loginUser.getUserID()%>"/>
                        <input type="hidden" name="total" value="<%= total%>"/>
                        <div class="col-md-12" style="text-align: center">
                            <input type="submit" name="action" value="Confirm & Exit" class="btn btn-primary" class="glyphicon"/>
                        </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <%            }
        %>
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
        <script type="text/javascript">
        </script>
    </body>
</html>
