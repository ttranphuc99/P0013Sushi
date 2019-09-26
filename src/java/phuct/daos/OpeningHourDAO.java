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

/**
 *
 * @author Thien Phuc
 */
public class OpeningHourDAO implements Serializable {
    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;
    
    private void closeConnection() throws Exception {
        if (rs != null) rs.close();
        if (ps != null) ps.close();
        if (conn != null) conn.close();
    }
    
    public String getOpeningHourDes(String weekDay) throws Exception {
        String description = null;
        try {
            String sql = "SELECT Description FROM OpeningHour WHERE WeekDay = ?";
            conn = DBConnection.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, weekDay);
            rs = ps.executeQuery();
            
            if (rs.next()) {
                description = rs.getString("Description");
            }
        } finally {
            closeConnection();
        }
        return description;
    }
}
