/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.shopping;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import sample.utils.DBUtils;

/**
 *
 * @author Admin
 */
public class OrderDAO {

    private static final String INSERT_ORDERS = "INSERT INTO tblOrders(userID, date, total) VALUES(?,?,?)";
    private static final String GET_KEY = "SELECT TOP 1 * FROM tblOrders ORDER BY orderID DESC";
    private static final String INSERT_ORDERSDETAILS = "INSERT INTO tblOrderDetails(orderID, productID, productName, productImg, quantity, productPrice) VALUES(?,?,?,?,?,?)";

    public int insert(String userID, int total) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        int key = 0;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(INSERT_ORDERS);
                ptm.setString(1, userID);
                ptm.setDate(2, java.sql.Date.valueOf(LocalDate.now()));
                ptm.setInt(3, total);
                ptm.executeUpdate();
                ptm = conn.prepareStatement(GET_KEY);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    key = rs.getInt(1);
                }
            }
        } catch (Exception e) {
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return key;
    }

    public void insertOrderDetail(String productID, String productName, String productImg, int quantity, int productPrice, int orderID) throws SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            ptm = conn.prepareStatement(INSERT_ORDERSDETAILS);
            ptm.setInt(1, orderID);
            ptm.setString(2, productID);
            ptm.setString(3, productName);
            ptm.setString(4, productImg);
            ptm.setInt(5, quantity);
            ptm.setInt(6, productPrice);
            ptm.executeUpdate();
        } catch (Exception e) {
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
    }
}
