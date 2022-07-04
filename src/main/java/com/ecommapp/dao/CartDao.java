/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ecommapp.dao;

import com.ecommapp.models.Cart;
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
public class CartDao {
    Connection conn;

    public CartDao(Connection conn){
        this.conn = conn;
    }
    
    public List<Cart> getCartProducts(int user_id){
        
        List<Cart> list = new ArrayList<>();
        Cart cart = null;
        try {
            String query = "SELECT product_id, title, details, img, category_id, price, cart.id, user_id, COUNT(*) as quantity FROM products JOIN cart WHERE products.id = cart.product_id AND cart.user_id=? GROUP BY products.id;";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, user_id);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                Product product = new Product();
                product.setId(rs.getInt(1));
                product.setTitle(rs.getString(2));
                product.setDetails(rs.getString(3));
                product.setImg(rs.getString(4));
                product.setCategory_id(rs.getInt(5));
                product.setPrice(rs.getFloat(6));
                cart = new Cart(
                        rs.getInt(7),
                        rs.getInt(8)
                );
                cart.setProduct(product);
                cart.setQuantity(rs.getInt(9));
                list.add(cart);
            }
            

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
    
    public boolean addToCart(int user_id, int product_id){
    
        try{
            String query = "insert into cart (user_id, product_id) values (?, ?)";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, user_id);
            ps.setInt(2, product_id);
            
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
    
    public boolean removeFromCart(int user_id, int product_id){
    
        try{
            String query = "delete from cart where user_id=? and product_id=?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, user_id);
            ps.setInt(2, product_id);
            
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
    
}
