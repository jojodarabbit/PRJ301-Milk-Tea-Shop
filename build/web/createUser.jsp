<%-- 
    Document   : createUser
    Created on : Jun 30, 2022, 12:29:22 PM
    Author     : Admin
--%>

<%@page import="sample.user.UserError"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign Up</title>
        <!-- Font Icon -->
        <link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">
        <!-- Main css -->
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>
        <%
            UserError userError = (UserError) request.getAttribute("USER_ERROR");
            if (userError == null) {
                userError = new UserError();
            }
        %>
        <!-- Sign up form -->
        <section class="signup">
            <div class="container">
                <div class="signup-content">
                    <div class="signup-form">
                        <h2 class="form-title">Sign up</h2>
                        <form action="MainController" method="POST" class="register-form" id="register-form">
                            <input type="hidden" name="roleID" value="US"/>
                            <div class="form-group">
                                <label for="name"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                <input type="text" name="userID" id="name" placeholder="User ID"/>
                                <%= userError.getUserID()%>
                            </div>
                            <div class="form-group">
                                <label for="pass"><i class="zmdi zmdi-lock"></i></label>
                                <input type="password" name="password" id="pass" placeholder="Password"/>
                                <%= userError.getPassword()%>
                            </div>
                            <div class="form-group">
                                <label for="re-pass"><i class="zmdi zmdi-lock-outline"></i></label>
                                <input type="password" name="confirm" id="re_pass" placeholder="Confirm your password"/>
                                <%= userError.getConfirm()%>
                            </div>
                            <div class="form-group">
                                <label for="name"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                <input type="text" name="name" id="name" placeholder="Your Name"/>
                                <%= userError.getName()%>
                            </div>
                            <div class="form-group">
                                <label for="email"><i class="zmdi zmdi-email"></i></label>
                                <input type="email" name="email" id="email" placeholder="Your Email"/>
                                <%= userError.getEmail()%>
                            </div>
                            <div class="form-group">
                                <label for="email"><i class="zmdi zmdi-email"></i></label>
                                <input type="text" name="phone" id="email" placeholder="Your Phone"/>
                                <%= userError.getPhone()%>
                            </div>
                            <div class="form-group">
                                <label for="email"><i class="zmdi zmdi-email"></i></label>
                                <input type="text" name="address" id="email" placeholder="Your Address"/>
                                <%= userError.getAddress()%>
                            </div>
                            <div class="form-group">
                                <input type="checkbox" name="agree-term" id="agree-term" class="agree-term" />
                                <label for="agree-term" class="label-agree-term"><span><span></span></span>I agree all statements in  <a href="#" class="term-service">Terms of service</a></label>
                            </div>
                            <div class="g-recaptcha" data-sitekey="6LdrA8cgAAAAAFLVSWCgxb-NUDXLrVw6G9M6LW0F"></div>
                            <div id="errorReCaptcha" style="color: red"></div>
                            <div class="form-group form-button">
                                <input name="action"  value="Sign Up" type="hidden"/>
                                <input value="Sign Up" type="submit" id="signup" class="form-submit"/><%= userError.getErrorMsg()%>
                            </div>
                        </form>
                    </div>
                    <div class="signup-image">
                        <figure><img src="images/signup-image.jpg" alt="sing up image"></figure>
                        <a href="login.jsp" class="signup-image-link">I am already member</a>
                    </div>
                </div>
            </div>
        </section>
        <script src="https://www.google.com/recaptcha/api.js" async defer></script>
        <script>
            window.onload = function () {
            let isVail = false;
            const form = document.getElementById("register-form");
            const error = document.getElementById("errorReCaptcha");
            form.addEventListener("submit", function(event){
            event.preventDefault();
            const response = grecaptcha.getResponse();
            if (response){
            form.submit();
            } else {
            error.innerHTML("Check reCaptcha")
            }
            });
            }
        </script>
    </body>
</html>
