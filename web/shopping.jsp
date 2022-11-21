<%-- 
    Document   : shopping
    Created on : Jul 2, 2022, 10:14:38 AM
    Author     : Admin
--%>

<%@page import="sample.user.UserDTO"%>
<%@page import="java.util.List"%>
<%@page import="sample.shopping.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>"Phê" Tea</title>
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/shopping.css" rel="stylesheet" />
    </head>
    <body>
        <%
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            if (loginUser == null || !"US".equals(loginUser.getRoleID())) {
                response.sendRedirect("login.jsp");
                return;
            }
            String search = request.getParameter("SearchProduct");
            if (search == null) {
                search = "";
            }
        %>
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container px-6 px-lg-8">
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                        <li class="nav-item nav-link" > Wellcome <%= loginUser.getName()%></li>
                        <li class="nav-item"><a class="nav-link" href="MainController?action=Logout">Logout</a></li>
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="shopping.jsp">Home</a></li>
                        <li class="nav-item"><a class="nav-link" href="MainController?action=Menu">Menu</a></li>
                        <form action="MainController" class="d-flex">
                            <li class="nav-item"><input class="nav-link" style="margin-right: 10px; margin-left: 20px" type="search" name="SearchProduct" value="<%= search%>"/></li>
                            <button class="btn btn-outline-dark" type="submit" name="action" value="SearchProduct">
                                Search
                            </button>
                        </form>
                        <form class="d-flex" action="MainController">
                    </ul>
                    <button class="btn btn-outline-dark" type="submit" value="ViewCart" name="action">
                        <i class="bi-cart-fill me-1"></i>
                        Cart
                        <span class="badge bg-dark text-white ms-1 rounded-pill"></span>
                    </button>
                    </form>
                </div>
            </div>
        </nav>
        <!-- Header-->
        <header class="bg-dark py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="text-center text-white">
                    <h1 class="display-4 fw-bolder">"Phê" Milk Tea</h1>
                    <p class="lead fw-normal text-white-50 mb-0">Bay thấp thôi bạn êi.</p>
                </div>
            </div>
        </header>
        <!-- Section-->
        <%
            List<Product> listProduct = (List<Product>) request.getAttribute("LIST_PRODUCT");
            if (listProduct != null && listProduct.size() > 0) {
        %>
        <section class="py-5">
            <div class="container px-4 px-lg-5 mt-5">
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                    <%
                        for (Product product : listProduct) {
                    %>
                    <div class="col mb-5">
                        <div class="card h-100">
                            <form action="MainController">
                                <!-- Product image-->
                                <img class="card-img-top" src="<%= product.getProductImg()%>" alt="..." />
                                <!-- Product details-->
                                <div class="card-body p-4">
                                    <div class="text-center">
                                        <!-- Product name-->
                                        <h5 class="fw-bolder"><%= product.getProductID()%> - <%= product.getProductName()%></h5>
                                        <!-- Product price-->
                                        <%= product.getProductPrice()%> $
                                    </div>
                                </div>
                                <!-- Product actions-->
                                <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                    <form action="MainController" method="POST">
                                        <input type="hidden" name="productID" value="<%= product.getProductID()%>"/>
                                        <input type="hidden" name="productName" value="<%= product.getProductName()%>"/>
                                        <input type="hidden" name="productImg" value="<%= product.getProductImg()%>"/>
                                        <input type="hidden" name="productPrice" value="<%= product.getProductPrice()%>"/>
                                        <div class="text-center"><input type="number" name="quantity" value="1"/><br></div>
                                        <div class="text-center"><input type="submit" name="action" value="Add To Cart"/></div>
                                    </form>
                                </div>
                            </form>
                        </div>
                    </div>
                    <%
                        }
                    %>
                </div>
            </div>
        </section>
        <%
            }
        %>
        <!-- Footer-->
        <footer class="py-5 bg-dark">
            <div class="container"><p class="m-0 text-center text-white">Copyright &copy; jojotherabbit19</p></div>
        </footer>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
    </body>
</html>
