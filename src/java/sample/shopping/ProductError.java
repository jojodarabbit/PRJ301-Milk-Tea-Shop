/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.shopping;

/**
 *
 * @author Admin
 */
public class ProductError {

    private String productID;
    private String productName;
    private String productImg;
    private String productPrice;
    private String errorMsg;

    public ProductError() {

        this.productID = "";
        this.productName = "";
        this.productImg = "";
        this.productPrice = "";
        this.errorMsg = "";
    }

    public ProductError(String productID, String productName, String productImg, String productPrice, String errorMsg) {
        this.productID = productID;
        this.productName = productName;
        this.productImg = productImg;
        this.productPrice = productPrice;
        this.errorMsg = errorMsg;
    }

    public String getProductID() {
        return productID;
    }

    public void setProductID(String productID) {
        this.productID = productID;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getProductImg() {
        return productImg;
    }

    public void setProductImg(String productImg) {
        this.productImg = productImg;
    }

    public String getProductPrice() {
        return productPrice;
    }

    public void setProductPrice(String productPrice) {
        this.productPrice = productPrice;
    }

    public String getErrorMsg() {
        return errorMsg;
    }

    public void setErrorMsg(String errorMsg) {
        this.errorMsg = errorMsg;
    }

}
