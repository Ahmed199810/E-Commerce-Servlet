/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ecommapp.models;

import java.sql.Date;
import java.util.List;

/**
 *
 * @author Ahmed
 */
public class Order {
    
    private int id;
    private int user_id;
    private String address;
    private Date date_time;
    private List<OrderDetails> orderProducts;
    private int state;
    
    
    public Order(){
    }

    public Order(int id, int user_id, String address, Date date_time) {
        this.id = id;
        this.user_id = user_id;
        this.address = address;
        this.date_time = date_time;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
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

    public List<OrderDetails> getProducts() {
        return orderProducts;
    }

    public void setProducts(List<OrderDetails> orderProducts) {
        this.orderProducts = orderProducts;
    }

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }
    
    
}
