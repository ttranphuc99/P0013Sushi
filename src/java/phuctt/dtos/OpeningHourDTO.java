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
public class OpeningHourDTO implements Serializable {
    private String weekDay, description;

    public OpeningHourDTO() {
    }

    public OpeningHourDTO(String weekDay, String description) {
        this.weekDay = weekDay;
        this.description = description;
    }

    public String getWeekDay() {
        return weekDay;
    }

    public void setWeekDay(String weekDay) {
        this.weekDay = weekDay;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
    
        
}
