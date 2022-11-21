/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sample.shopping.Product;
import sample.shopping.ProductDAO;
import sample.shopping.ProductError;

/**
 *
 * @author Admin
 */
@WebServlet(name = "AddProductController", urlPatterns = {"/AddProductController"})
public class AddProductController extends HttpServlet {

    private static final String ERROR = "createProduct.jsp";
    private static final String SUCCESS = "MainController?action=All+Product";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String productID = request.getParameter("productID");
            String productName = request.getParameter("productName");
            String productImg = request.getParameter("productImg");
            int productPrice = Integer.parseInt(request.getParameter("productPrice"));
            boolean check = true;
            ProductError productError = new ProductError();
            if (productID.length() > 10 || productID.length() < 2) {
                productError.setProductID("ProductID must between [2-10]");
                check = false;
            }
            if (productName.length() > 50 || productName.length() < 5) {
                productError.setProductName("ProductName must between [1-50]");
                check = false;
            }
            if (productImg.length() < 0) {
                productError.setProductImg("Please add image");
                check = false;
            }
            if (productPrice < 0) {
                productError.setProductPrice("Product Price must greater than 0$");
                check = false;
            }

            if (check) {
                ProductDAO dao = new ProductDAO();
                Product product = new Product(productID, productName, productImg, productPrice);
                boolean checkDuplicate = dao.checkDuplicate(productID);
                if (checkDuplicate) {
                    productError.setProductID("Duplicate ProductID");
                    request.setAttribute("PRODUCT_ERROR", productError);
                } else {
                    boolean checkInsert = dao.insert(product);
                    if (checkInsert) {
                        url = SUCCESS;
                    } else {
                        productError.setErrorMsg("Error");
                        request.setAttribute("PRODUCT_ERROR", productError);
                    }
                }
            } else {
                request.setAttribute("PRODUCT_ERROR", productError);
            }
        } catch (Exception e) {
            log("Error at AddProductController: " + e.toString());
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
