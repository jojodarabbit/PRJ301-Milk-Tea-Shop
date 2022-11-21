/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
public class MainController extends HttpServlet {

    private static final String ERROR = "error.jsp";
    private static final String LOGIN = "Login";
    private static final String LOGIN_CONTROLLER = "LoginController";
    private static final String MENU = "Menu";
    private static final String MENU_CONTROLLER = "MenuController";
    private static final String ADD_TO_CART = "Add To Cart";
    private static final String ADD_TO_CART_CONTROLLER = "AddToCartController";
    private static final String VIEW_CART = "viewCart.jsp";
    private static final String UPDATE_CART = "UpdateCart";
    private static final String UPDATE_CART_CONTROLLER = "UpdateCartController";
    private static final String REMOVE_CART = "RemoveCart";
    private static final String REMOVE_CART_CONTROLLER = "RemoveCartController";
    private static final String SEARCH_PRODUCT = "SearchProduct";
    private static final String SEARCH_PRODUCT_CONTROLLER = "SearchProductController";
    private static final String LOGOUT = "Logout";
    private static final String LOGOUT_CONTROLLER = "LogoutController";
    private static final String CREATE_USER = "Sign Up";
    private static final String CREATE_USER_CONTROLLER = "CreateUserController";
    private static final String ALL_PRODUCT = "All Product";
    private static final String ALL_PRODUCT_CONTROLLER = "AllProductViewAdmin";
    private static final String UPDATE_PRODUCT = "UpdateProduct";
    private static final String UPDATE_PRODUCT_CONTROLLER = "UpdateProductController";
    private static final String ADD_PRODUCT = "Add Product";
    private static final String ADD_PRODUCT_CONTROLLER = "AddProductController";
    private static final String DELETE_PRODUCT = "DeleteProduct";
    private static final String DELETE_PRODUCT_CONTROLLER = "DeleteProductController";
    private static final String CONFIRM_BILL_CONTROLLER = "ConfirmBillController";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String action = request.getParameter("action");
            if (LOGIN.equals(action)) {
                url = LOGIN_CONTROLLER;
            }
            if (MENU.equals(action)) {
                url = MENU_CONTROLLER;
            }
            if (ADD_TO_CART.equals(action)) {
                url = ADD_TO_CART_CONTROLLER;
            }
            if ("ViewCart".equals(action)) {
                url = VIEW_CART;
            }
            if (UPDATE_CART.equals(action)) {
                url = UPDATE_CART_CONTROLLER;
            }
            if (REMOVE_CART.equals(action)) {
                url = REMOVE_CART_CONTROLLER;
            }
            if (SEARCH_PRODUCT.equals(action)) {
                url = SEARCH_PRODUCT_CONTROLLER;
            }
            if (LOGOUT.equals(action)) {
                url = LOGOUT_CONTROLLER;
            }
            if (CREATE_USER.equals(action)) {
                url = CREATE_USER_CONTROLLER;
            }
            if (ALL_PRODUCT.equals(action)) {
                url = ALL_PRODUCT_CONTROLLER;
            }
            if (ADD_PRODUCT.equals(action)) {
                url = ADD_PRODUCT_CONTROLLER;
            }
            if (UPDATE_PRODUCT.equals(action)) {
                url = UPDATE_PRODUCT_CONTROLLER;
            }
            if (DELETE_PRODUCT.equals(action)) {
                url = DELETE_PRODUCT_CONTROLLER;
            }
            if ("Confirm & Exit".equals(action)) {
                url = CONFIRM_BILL_CONTROLLER;
            }
        } catch (Exception e) {
            log("Error at MainController: " + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
