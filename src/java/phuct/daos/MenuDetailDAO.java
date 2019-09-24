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
import phuctt.dtos.ProductDTO;

/**
 *
 * @author Thien Phuc
 */
public class MenuDetailDAO {
    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;
    
    private void closeConnection() throws Exception {
        if (rs != null) rs.close();
        if (ps != null) ps.close();
        if (conn != null) conn.close();
    }
    
    public List<ProductDTO> getListProductOfMenu(int menuId) throws Exception {
        List<ProductDTO> result = null;
        try {
            String sql = "SELECT ProductID FROM MenuDetail WHERE MenuID = ?";
            conn = DBConnection.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, menuId);
            rs = ps.executeQuery();
            
            int productID;
            ProductDTO product;
            
            ProductDAO productDao = new ProductDAO();
            
            result = new ArrayList<>();
            
            while (rs.next()) {
                productID = rs.getInt("ProductID");
                product = productDao.getProductById(productID);
                result.add(product);
            }
        } finally {
            closeConnection();
        }
        return result;
    }
}
