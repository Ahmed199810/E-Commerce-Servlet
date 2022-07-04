/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ecommapp.dao;

import com.ecommapp.models.Product;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

/**
 *
 * @author Ahmed
 */
public class ProductDao {
    
    Connection conn;

    public ProductDao(Connection conn){
        this.conn = conn;
    }
    
    public List<Product> getProductsByCategory(int id){
        
        List<Product> list = new ArrayList<>();
        Product product = null;
        try {
            String query = "select * from products where category_id=?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            while(rs.next()){
                product = new Product();
                product.setId(rs.getInt(1));
                product.setTitle(rs.getString(2));
                product.setDetails(rs.getString(3));
                product.setImg(rs.getString(4));
                product.setCategory_id(rs.getInt(5));
                product.setPrice(rs.getFloat(6));
                list.add(product);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;

    }
    
        public Product getProductById(int id){
        
        Product product = null;
        try {
            String query = "select * from products where id=?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                product = new Product();
                product.setId(rs.getInt(1));
                product.setTitle(rs.getString(2));
                product.setDetails(rs.getString(3));
                product.setImg(rs.getString(4));
                product.setCategory_id(rs.getInt(5));
                product.setPrice(rs.getFloat(6));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return product;

    }
    
    public List<Product> getAllProducts(){
        
        List<Product> list = new ArrayList<>();
        Product product = null;
        try {
            String query = "select * from products";
            PreparedStatement ps = conn.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                product = new Product();
                product.setId(rs.getInt(1));
                product.setTitle(rs.getString(2));
                product.setDetails(rs.getString(3));
                product.setImg(rs.getString(4));
                product.setCategory_id(rs.getInt(5));
                product.setPrice(rs.getFloat(6));
                list.add(product);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;

    }
    
    
    public boolean createProduct(String title, String details, float price, int cid, String img){
    
        try{
            String query = "insert into products (title, details, price, category_id, img) values (?, ?, ?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, title);
            ps.setString(2, details);
            ps.setFloat(3, price);
            ps.setInt(4, cid);
            ps.setString(5, img);
            int result = ps.executeUpdate();
            if(result == 1){
                return true;
            }else {
                return false;
            }
        }catch(SQLException ex){
            return false;
        }
    }
    
    public boolean updateProduct(String title, String details, float price, int cid, int pid){
        try{
            String query = "update products set title=?, details=?, price=?, category_id=? where id=?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, title);
            ps.setString(2, details);
            ps.setFloat(3, price);
            ps.setInt(4, cid);
            ps.setInt(5, pid);
            int result = ps.executeUpdate();
            if(result == 1){
                return true;
            }else {
                return false;
            }
        }catch(SQLException ex){
            return false;
        }
    }
    
    public boolean updateProductWithImg(String title, String details, float price, int cid, String img, int pid){
        try{
            String query = "update products set title=?, details=?, price=?, category_id=?, img=? where id=?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, title);
            ps.setString(2, details);
            ps.setFloat(3, price);
            ps.setInt(4, cid);
            ps.setString(5, img);
            ps.setInt(6, pid);
            int result = ps.executeUpdate();
            if(result == 1){
                return true;
            }else {
                return false;
            }
        }catch(SQLException ex){
            return false;
        }
    }
    
    public boolean deleteProduct(int pid){
        try{
            String query = "delete from products where id=?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, pid);
            int result = ps.executeUpdate();
            if(result == 1){
                return true;
            }else {
                return false;
            }
        }catch(SQLException ex){
            return false;
        }
    }
    
    
    
    
}
