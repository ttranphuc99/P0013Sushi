/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phuctt.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import phuct.daos.ContactDAO;
import phuct.daos.OpeningHourDAO;
import phuctt.dtos.ContactDTO;

/**
 *
 * @author Thien Phuc
 */
public class ContactController extends HttpServlet {
    public static final String ERROR = "error.jsp";
    public static final String CONTACT = "contact.jsp";
    
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            ContactDTO contact = (new ContactDAO()).getContact();
            request.setAttribute("CONTACT", contact);
            
            OpeningHourDAO openingHourDao = new OpeningHourDAO();
            request.setAttribute("MONDAY", openingHourDao.getOpeningHourDes("Monday"));
            request.setAttribute("TUESDAY", openingHourDao.getOpeningHourDes("Tuesday"));
            request.setAttribute("WEDNESDAY", openingHourDao.getOpeningHourDes("Wednesday"));
            request.setAttribute("THURSDAY", openingHourDao.getOpeningHourDes("Thursday"));
            request.setAttribute("FRIDAY", openingHourDao.getOpeningHourDes("Friday"));
            request.setAttribute("SATURDAY", openingHourDao.getOpeningHourDes("Saturday"));
            request.setAttribute("SUNDAY", openingHourDao.getOpeningHourDes("Sunday"));
            
            url = CONTACT;
        } catch (Exception e) {
            log("Error at ContactController: " + e.getMessage());
        }
        request.getRequestDispatcher(url).forward(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
