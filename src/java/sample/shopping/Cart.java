/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.shopping;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author Admin
 */
public class Cart {

    private Map<String, OrderDetail> cart;

    public Cart() {
    }

    public Cart(Map<String, OrderDetail> cart) {
        this.cart = cart;
    }

    public Map<String, OrderDetail> getCart() {
        return cart;
    }

    public void setCart(Map<String, OrderDetail> cart) {
        this.cart = cart;
    }

    public void add(OrderDetail order) {
        if (this.cart == null) {
            this.cart = new HashMap<>();
        }
        if (this.cart.containsKey(order.getProductID())) {
            int curQty = this.cart.get(order.getProductID()).getQuantity();
            order.setQuantity(curQty + order.getQuantity());
        }
        cart.put(order.getProductID(), order);
    }

    public void delete(String id) {
        if (this.cart == null) {
            return;
        }
        if (this.cart.containsKey(id)) {
            this.cart.remove(id);
        }
    }

    public void update(String id, OrderDetail newTea) {
        if (this.cart == null) {
            return;
        }
        if (this.cart.containsKey(id)) {
            this.cart.replace(id, newTea);
        }
    }

    public void updateOrderDetail(int orderID) throws SQLException {
        for (Map.Entry<String, OrderDetail> entry : cart.entrySet()) {
            String key = entry.getKey();
            OrderDetail value = entry.getValue();
            OrderDAO dao = new OrderDAO();
            dao.insertOrderDetail(value.getProductID(), value.getProductName(), value.getProductImg(), value.getQuantity(), value.getProductPrice(), orderID);
        }
    }

    public int getTotal() {
        int x = 0;
        for (Map.Entry<String, OrderDetail> entry : cart.entrySet()) {
            String key = entry.getKey();
            OrderDetail value = entry.getValue();
            x += value.getProductPrice();
        }
        return x;
    }
}
