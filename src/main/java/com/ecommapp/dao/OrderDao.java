/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ecommapp.dao;

import com.ecommapp.models.Cart;
import com.ecommapp.models.Order;
import com.ecommapp.models.OrderDetails;
import com.ecommapp.models.Product;
import com.ecommapp.models.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Ahmed
 */
public class OrderDao {
    Connection conn;

    public OrderDao(Connection conn){
        this.conn = conn;
    }
    
    public boolean completeOrder(int user_id, String address, List<Cart> cartItems){
    
        try{
            String query = "insert into orders (user_id, address) values (?, ?)";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, user_id);
            ps.setString(2, address);
            int result = ps.executeUpdate();
            
            if (result == 1){
                query = "SELECT LAST_INSERT_ID()";
                ps = conn.prepareStatement(query);
                ResultSet rs = ps.executeQuery();
                rs.next();
                int oid = rs.getInt(1);
                return addOrderProducts(user_id, oid, cartItems);
            }else{
                return false;
            }
        }catch(SQLException ex){
            return false;
        }
    }
    
    public boolean updateOrderState(int oid, int state){
        try{
            String query = "update orders set state=? where id=?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, state);
            ps.setInt(2, oid);
            int result = ps.executeUpdate();
            if (result == 1){
                return true;
            }else{
                return false;
            }
        }catch(SQLException ex){
            return false;
        }
    }
    
    private boolean addOrderProducts(int user_id, int order_id, List<Cart> cartItems){
        for(int i = 0; i < cartItems.size(); i++){
            try {
                String query = "insert into order_products (order_id, product_id, quantity) values (?, ?, ?)";
                PreparedStatement ps = conn.prepareStatement(query);
                ps.setInt(1, order_id);
                ps.setInt(2, cartItems.get(i).getProduct().getId());
                ps.setInt(3, cartItems.get(i).getQuantity());
                ps.executeUpdate();
            } catch (SQLException e) {
                return false;
            }
        }
        // remove user cart data
        try {
            String query = "delete from cart where user_id=?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, user_id);
            int result = ps.executeUpdate();
            if(result == 1){
                return true;
            }else {
                return false;
            }
        } catch (SQLException e) {
            return false;
        }
    }
    
    public List<Order> getOrders(int user_id){
        List<Order> list = new ArrayList<>();
        Order order = null;
        try {
            String query = "select * from orders where user_id=?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, user_id);
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                order = new Order(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getDate(4)
                );
                order.setState(rs.getInt(5));
                list.add(order);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
    
    public List<Order> getAllOrders(){
        List<Order> list = new ArrayList<>();
        Order order = null;
        try {
            String query = "select * from orders";
            PreparedStatement ps = conn.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                order = new Order(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getDate(4)
                );
                order.setState(rs.getInt(5));
                list.add(order);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
    
    public List<OrderDetails> getOrderDetails(int order_id){
        List<OrderDetails> list = new ArrayList<>();
        OrderDetails order = null;
        try {
            String query = "SELECT * FROM order_products JOIN products JOIN orders JOIN users WHERE order_products.product_id = products.id AND order_id=? AND orders.id =? AND orders.user_id = users.id;";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, order_id);
            ps.setInt(2, order_id);
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                Product product = new Product(
                        rs.getInt(5),
                        rs.getString(6),
                        rs.getString(8),
                        rs.getString(7),
                        rs.getInt(9),
                        rs.getFloat(10)
                );
                User user = new User();
                user.setId(rs.getInt(16));
                user.setFirstName(rs.getString(17));
                user.setLastName(rs.getString(18));
                user.setEmail(rs.getString(19));
                user.setPhone(rs.getString(20));
                user.setImg(rs.getString(22));
                
                order = new OrderDetails(
                        rs.getInt(1),
                        rs.getInt(2),
                        product,
                        rs.getInt(4),
                        rs.getString(13),
                        rs.getDate(14),
                        user,
                        rs.getInt(15)
                );
                list.add(order);
            }
        } catch (Exception e) {
        }
        
        return list;
    }
    
}
