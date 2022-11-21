/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.shopping;

import java.time.LocalDate;

/**
 *
 * @author Admin
 */
public class Order {

    private String userID;

    private String total;
    private LocalDate date;

    public Order() {
        this.userID = "";
        this.total = "";
        this.date = date;
    }

    public Order(String userID, String total, LocalDate date) {
        this.userID = userID;
        this.total = total;
        this.date = date;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getTotal() {
        return total;
    }

    public void setTotal(String total) {
        this.total = total;
    }

    public LocalDate getDate() {
        return date;
    }

    public void setDate(LocalDate date) {
        this.date = date;
    }

}
