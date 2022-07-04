/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ecommapp.dao;

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
public class UserDao {
    
    Connection conn;

    public UserDao(Connection conn){
        this.conn = conn;
    }
    
    public User loginUser(String email, String pass){
        User user = null;
        
        try {
            String query = "select * from users where email=? and password=?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, email);
            ps.setString(2, pass);
            
            ResultSet rs = ps.executeQuery();
            
            if(rs.next()){
                user = new User(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7)
                );
            }
            
        } catch (SQLException ex) {
            
        }
        
        return user;
    }
    
    public User getUserById(int userId){
        User user = null;
        
        try {
            String query = "select * from users where id=?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, userId);
            
            ResultSet rs = ps.executeQuery();
            
            if(rs.next()){
                user = new User(
                    rs.getInt(1),
                    rs.getString(2),
                    rs.getString(3),
                    rs.getString(4),
                    rs.getString(5),
                    rs.getString(6),
                    rs.getString(7)
                );
            }
            
        } catch (SQLException ex) {
            
        }
        
        return user;
    }
    
    public List<User> getAllUsers(){
        
        List<User> list = new ArrayList<>();
        User user = null;
        try {
            String query = "select * from users";
            PreparedStatement ps = conn.prepareStatement(query);
            ResultSet rs = ps.executeQuery();

            while(rs.next()){
                user = new User(
                    rs.getInt(1),
                    rs.getString(2),
                    rs.getString(3),
                    rs.getString(4),
                    rs.getString(5),
                    rs.getString(6),
                    rs.getString(7)
                );
                list.add(user);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;

    }
    
    public boolean createUser(User user){
    
        try{
            String query = "insert into users (firstName, lastName, email, phone, password) values (?, ?, ?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, user.getFirstName());
            ps.setString(2, user.getLastName());
            ps.setString(3, user.getEmail());
            ps.setString(4, user.getPhone());
            ps.setString(5, user.getPassword());
            
            int result = ps.executeUpdate();
            if (result == 1){
                return true;
            }else{
                return false;
            }
            
        }catch(Exception ex){
            return false;
        }
    }
    
    public boolean uploadUserImage(int userId, String imgPath){
    
        try{
            String query = "update users set img=? where id=?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, imgPath);
            ps.setInt(2, userId);
            
            int result = ps.executeUpdate();
            if (result == 1){
                return true;
            }else{
                return false;
            }
            
        }catch(Exception ex){
            return false;
        }
    }
    
    public boolean deleteUser(int id){

        try{
            String query = "delete from users where id=?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            
            int result = ps.executeUpdate();
            if (result == 1){
                return true;
            }else{
                return false;
            }
            
        }catch(Exception ex){
            return false;
        }
        
    }
    
}
