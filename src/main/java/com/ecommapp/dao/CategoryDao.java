/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ecommapp.dao;

import com.ecommapp.models.Category;
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
public class CategoryDao {
    
    Connection conn;
    
    
    public CategoryDao(Connection conn){
        this.conn = conn;
    }
    
    public List<Category> getAllCategories(){
        
        List<Category> list = new ArrayList<>();
        Category category = null;
        try {
            String query = "select * from category";
            PreparedStatement ps = conn.prepareStatement(query);
            ResultSet rs = ps.executeQuery();

            while(rs.next()){
                category = new Category();
                category.setId(rs.getInt(1));
                category.setTitle(rs.getString(2));
                category.setImg(rs.getString(3));
                list.add(category);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
    
    public boolean createCategory(String title, String img){
    
        try{
            String query = "insert into category (title, img) values (?, ?)";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, title);
            ps.setString(2, img);
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
