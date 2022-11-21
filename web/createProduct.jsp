<%-- 
    Document   : createProduct
    Created on : Jul 5, 2022, 3:46:09 PM
    Author     : Admin
--%>

<%@page import="sample.user.UserDTO"%>
<%@page import="sample.shopping.ProductError"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Product</title>
        <!-- Font Icon -->
        <link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">
        <!-- Main css -->
        <link rel="stylesheet" href="css/style.css">
        <link href='https://unpkg.com/boxicons@2.1.2/css/boxicons.min.css' rel='stylesheet'>
    </head>
    <body>
        <%
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            if (loginUser == null || !"AD".equals(loginUser.getRoleID())) {
                response.sendRedirect("login.jsp");
                return;
            }
            ProductError productError = (ProductError) request.getAttribute("PRODUCT_ERROR");
            if (productError == null) {
                productError = new ProductError();
            }
        %>
        <!-- Sign up form -->
        <section class="signup">
            <div class="container">
                <div class="signup-content">
                    <div class="signup-form">
                        <h2 class="form-title">Add Product</h2>
                        <form action="MainController" method="POST" class="register-form" id="register-form">
                            <input type="hidden" name="roleID" value="US"/>
                            <div class="form-group">
                                <label for="name"><i class='bx bxs-pencil'></i></label>
                                <input type="text" name="productID" id="name" placeholder="Product ID"/><%= productError.getProductID()%>
                            </div>
                            <div class="form-group">
                                <label for="name"><i class='bx bxs-pencil'></i></label>
                                <input type="text" name="productName" id="name" placeholder="Product Name"/><%= productError.getProductName()%>
                            </div>
                            <div class="form-group">
                                <label for="name"><i class='bx bxs-pencil'></i></label>
                                <input type="text" name="productImg" id="name" placeholder="Product Image"/><%= productError.getProductName()%>
                            </div>
                            <div class="form-group">
                                <label for="email"><i class='bx bxs-pencil'></i></label>
                                <input type="text" name="productPrice" id="email" placeholder="Product Price"/><%= productError.getProductPrice()%>
                            </div>
                            <div class="form-group form-button">
                                <input type="submit" name="action" id="signup" class="form-submit" value="Add Product"/><%= productError.getErrorMsg()%>
                            </div>
                        </form>
                    </div>
                    <div class="signup-image">
                        <figure><img src="images/signup-image.jpg" alt="sing up image"></figure>
                        <a href="MainController?action=All+Product" class="signup-image-link">Back</a>
                    </div>
                </div>
            </div>
        </section>
    </body>
</html>
