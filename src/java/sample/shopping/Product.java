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
public class Product {

    private String productID;
    private String productName;
    private String productImg;
    private int productPrice;

    public Product() {
        this.productID = "";
        this.productName = "";
        this.productImg = "";
        this.productPrice = 0;
    }

    public Product(String productID, String productName, String productImg, int productPrice) {
        this.productID = productID;
        this.productName = productName;
        this.productImg = productImg;
        this.productPrice = productPrice;
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

    public int getProductPrice() {
        return productPrice;
    }

    public void setProductPrice(int productPrice) {
        this.productPrice = productPrice;
    }
}
