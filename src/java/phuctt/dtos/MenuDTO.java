/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phuctt.dtos;

import java.io.Serializable;
import java.util.List;

/**
 *
 * @author Thien Phuc
 */
public class MenuDTO implements Serializable {
    private int id;
    private String name, description;
    private float price;
    
    private List<ProductDTO> listProduct;

    public MenuDTO() {
    }

    public MenuDTO(int id, String name, String description, float price) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.price = price;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public List<ProductDTO> getListProduct() {
        return listProduct;
    }

    public void setListProduct(List<ProductDTO> listProduct) {
        this.listProduct = listProduct;
    }
}
