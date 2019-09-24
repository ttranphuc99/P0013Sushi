/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phuct.daos;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import phuctt.db.DBConnection;
import phuctt.dtos.ProductDTO;

/**
 *
 * @author Thien Phuc
 */
public class ProductDAO implements Serializable {
    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;
    
    private void closeConnection() throws Exception {
        if (rs != null) rs.close();
        if (ps != null) ps.close();
        if (conn != null) conn.close();
    }
    
    public List<ProductDTO> getList() throws Exception {
        List<ProductDTO> result = null;
        try {
            String sql = "SELECT Name, Description, Image FROM Product ORDER BY ID DESC";
            conn = DBConnection.getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            
            String name, description, image;
            ProductDTO dto;
            
            result = new ArrayList<>();
            
            while (rs.next()) {
                name = rs.getString("Name");
                description = rs.getString("Description");
                image = rs.getString("Image");
                
                dto = new ProductDTO(0, name, image, description);
                result.add(dto);
            }
        } finally {
            closeConnection();
        }
        return result;
    }
    
    public ProductDTO getProductById(int id) throws Exception {
        ProductDTO result = null;
        try {
            String sql = "SELECT Name, Description, Image FROM Product WHERE ID = ?";
            conn = DBConnection.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            
            if (rs.next()) {
                String name = rs.getString("Name");
                String description = rs.getString("Description");
                String image = rs.getString("Image");
                
                result = new ProductDTO(id, name, image, description);
            }
        } finally {
            closeConnection();
        }
        return result;
    }
}
