/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phuctt.dtos;

import java.io.Serializable;

/**
 *
 * @author Thien Phuc
 */
public class MenuDetailDTO implements Serializable {
    private ProductDTO product;
    private MenuDTO menu;

    public MenuDetailDTO() {
    }

    public MenuDetailDTO(ProductDTO product, MenuDTO menu) {
        this.product = product;
        this.menu = menu;
    }

    public ProductDTO getProduct() {
        return product;
    }

    public void setProduct(ProductDTO product) {
        this.product = product;
    }

    public MenuDTO getMenu() {
        return menu;
    }

    public void setMenu(MenuDTO menu) {
        this.menu = menu;
    }
    
    
}
