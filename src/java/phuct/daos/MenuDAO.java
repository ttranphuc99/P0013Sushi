/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phuct.daos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import phuctt.db.DBConnection;
import phuctt.dtos.MenuDTO;
import phuctt.dtos.ProductDTO;

/**
 *
 * @author Thien Phuc
 */
public class MenuDAO {
    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;
    
    private void closeConnection() throws Exception {
        if (rs != null) rs.close();
        if (ps != null) ps.close();
        if (conn != null) conn.close();
    }
    
    public List<MenuDTO> getList() throws Exception {
        List<MenuDTO> result = null;
        try {
            String sql = "SELECT ID, Name, Description, Price FROM Menu";
            conn = DBConnection.getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            
            String name, description;
            int id;
            float price;
            MenuDTO dto;
            List<ProductDTO> listProduct;
            MenuDetailDAO menuDetailDao = new MenuDetailDAO();
            
            result = new ArrayList<>();
            
            while (rs.next()) {
                name = rs.getString("Name");
                description = rs.getString("Description");
                price = rs.getFloat("Price");
                id = rs.getInt("ID");
                
                dto = new MenuDTO(id, name, description, price);
                
                listProduct = menuDetailDao.getListProductOfMenu(id);
                dto.setListProduct(listProduct);
                
                result.add(dto);
            }
           
        } finally {
            closeConnection();
        }
        return result;
    }
}
