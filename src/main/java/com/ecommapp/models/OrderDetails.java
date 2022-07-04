/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ecommapp.models;

import java.sql.Date;

/**
 *
 * @author Ahmed
 */
public class OrderDetails {
    
    private int id;
    private int order_id;
    private Product product;
    private int quantity;
    private String address;
    private Date date_time;
    private User user;
    private int state;
    
    public OrderDetails() {
        
    }

    public OrderDetails(int id, int order_id, Product product, int quantity, String address, Date date_time, User user, int state) {
        this.id = id;
        this.order_id = order_id;
        this.product = product;
        this.quantity = quantity;
        this.address = address;
        this.date_time = date_time;
        this.user = user;
        this.state = state;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Date getDate_time() {
        return date_time;
    }

    public void setDate_time(Date date_time) {
        this.date_time = date_time;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }

    

    
    
}
