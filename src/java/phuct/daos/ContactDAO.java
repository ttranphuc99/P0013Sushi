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
import phuctt.db.DBConnection;
import phuctt.dtos.ContactDTO;

/**
 *
 * @author Thien Phuc
 */
public class ContactDAO implements Serializable {
    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;
    
    private void closeConnection() throws Exception {
        if (rs != null) rs.close();
        if (ps != null) ps.close();
        if (conn != null) conn.close();
    }
    
    public ContactDTO getContact() throws Exception {
        ContactDTO dto = null;
        try {
            String sql = "SELECT Address, Tel, Email, Image FROM Contact";
            conn = DBConnection.getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            
            if (rs.next()) {
                String address = rs.getString("Address");
                String tel = rs.getString("Tel");
                String email = rs.getString("Email");
                String image = rs.getString("Image");
                
                dto = new ContactDTO(address, tel, email, image, 0);
            }
        } finally {
            closeConnection();
        }
        return dto;
    }
}
