/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Comment;

/**
 *
 * @author Admin
 */
public class CommentDB {
    public static List<Comment> getIdProduct(String id){
        List<Comment> cm = new ArrayList<>();
        Connection connection = Util.getConnection();
        String sql = "SELECT * FROM `comment` WHERE idProduct = '" +id+ "'";
        System.out.println(sql);
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                Comment com = new Comment();
                com.setId(rs.getInt("id"));
                com.setUsername(rs.getString("username"));
                com.setIdProduct(rs.getString("idProduct"));
                com.setContent(rs.getString("content"));
                com.setCreateBy(rs.getString("createBy"));
                com.setCreateDate(rs.getString("createDate"));
                com.setImgUser(rs.getString("imgUser"));
                cm.add(com);                
            }
            ps.close();
        } catch (SQLException ex) {            
        }
        return cm;
    }
    
    public void insertCM(String name, String idPro, String content, String createBy, String createDate, String imgUser){
        Connection connection = Util.getConnection();
        String sql = "INSERT INTO `comment`(username, idProduct, content, createBy, createDate, imgUser) VALUES (?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, idPro);
            ps.setString(3, content);
            ps.setString(4, createBy);
            ps.setString(5, createDate);
            ps.setString(6, imgUser);
            ps.executeUpdate();
            ps.close();
        } catch (SQLException ex) {            
        }
    }
}
