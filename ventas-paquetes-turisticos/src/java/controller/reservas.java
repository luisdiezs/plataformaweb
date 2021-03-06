/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.ConsultasDB;

import classes.Reservas;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author ldiez
 */
public class reservas extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            
            Reservas reservas = new Reservas();
            reservas.setNombres(request.getParameter("nombres"));
            reservas.setApellidos(request.getParameter("apellidos"));
            reservas.setTipodoc(request.getParameter("tipo_doc"));
            reservas.setNrodoc(request.getParameter("nro_doc"));
            reservas.setNacionalidad(request.getParameter("nacionalidad"));
            reservas.setFecha(request.getParameter("fecha"));
            reservas.setAcuenta(Double.parseDouble(request.getParameter("acuenta")));
            reservas.setSaldo(Double.parseDouble(request.getParameter("saldo")));
            reservas.setEdad(Integer.parseInt(request.getParameter("edad")));
            reservas.setPaqtur(Integer.parseInt(request.getParameter("paq_tur")));
            
            request.setAttribute("reservas", reservas);
            ConsultasDB db = new ConsultasDB();
            db.setTurista(request);
            db.setReserva(request);
            db.setBoleto(request);
            response.sendRedirect("reservas.jsp");
        } catch (Exception ex) {
            Logger.getLogger(login.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("Hubo un error al procesar tus datos. \npor favor vuelve a intentarlo");
        }
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
