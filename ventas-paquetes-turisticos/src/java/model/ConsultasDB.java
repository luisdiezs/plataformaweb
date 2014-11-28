/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import controller.login;
import classes.*;

import java.util.ResourceBundle;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.sql.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *
 * @author ldiez
 */
public class ConsultasDB {
    
    public static Connection getConnection() throws Exception
    {
        Connection cn;
        
        ResourceBundle configDB = ResourceBundle.getBundle("configDB");
        String str_cn = "jdbc:mysql://" + configDB.getString("hostname");
        str_cn += ":" + configDB.getString("port");
        str_cn += "/" + configDB.getString("database");
        String username = configDB.getString("username");
        String password = configDB.getString("password");
        DriverManager.registerDriver(new com.mysql.jdbc.Driver());
        cn = DriverManager.getConnection(str_cn, username, password);
        return cn;
        
    }
    
    public String login(String user, String pass, HttpServletRequest request)
    {
        Connection cn;
        Statement st;
        ResultSet rs;
        String response;
        try {
            cn = getConnection();            
            st = cn.createStatement();
            
            rs = st.executeQuery("select * from tbl_usuario where usuario = '" + user + "' limit 1");
            rs.first();
            String usuario = rs.getString("nombre") + rs.getString("apellido");
            
            HttpSession session = request.getSession(true);
            
            if(pass.equals(rs.getString("clave")))
            {
                response = "1";
                session.setAttribute("usuario", usuario);
            }
            else
                response = "0";
            
            rs.close();
            st.close();
            cn.close();
        
        } catch(Exception ex) {
            Logger.getLogger(login.class.getName()).log(Level.SEVERE, null, ex);
            response = "-1";
        }
        
        return response;
    }
    
    public void reservas(HttpServletRequest request)
    {
        Connection cn;
        Statement st;
        PreparedStatement ps;
        try {
            cn = getConnection(); 
            st = cn.createStatement();
            
            Reservas reservas = (Reservas) request.getAttribute("reservas");
            Date dNow = new Date();
            SimpleDateFormat ft = new SimpleDateFormat ("dd-MM-yyyy HH:mm:ss");
            String currentDate = ft.format(dNow);
            
            String queryTurista = "insert into tbl_turista (tipo_documento, nro_documento, nombre, apellido, edad, nacionalidad, fecha_registro) values(?, ?, ?, ?, ?, ?, ?)";

            ps = cn.prepareStatement(queryTurista);
            ps.setString(1, reservas.getTipodoc());
            ps.setString(2, reservas.getNrodoc());
            ps.setString(3, reservas.getNombres());
            ps.setString(4, reservas.getApellidos());
            ps.setInt(5, reservas.getEdad());
            ps.setString(6, reservas.getNacionalidad());
            ps.setString(7, currentDate);
            ps.executeUpdate();
            
            st.close();
            cn.close();
            
        } catch (Exception ex) {
            Logger.getLogger(login.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void getTurista(HttpServletRequest request)
    {
        Connection cn;
        Statement st;
        ResultSet rs;
        String response;
        try {
            cn = getConnection();            
            st = cn.createStatement();
            
            rs = st.executeQuery("select * from tbl_turista where tipo_documento = '" + request.getAttribute("tipo_doc") + "' and nro_documento = '" + request.getAttribute("nro_doc") + "' limit 1");
            rs.first();
            
            Turista turista = new Turista();
            turista.setNombres(rs.getString("nombre"));
            turista.setApellidos(rs.getString("apellido"));
            turista.setTipodoc(rs.getString("tipo_documento"));
            turista.setNrodoc(rs.getString("nro_documento"));
            turista.setNacionalidad(rs.getString(request.getParameter("nacionalidad")));
            turista.setEdad(rs.getInt(request.getParameter("edad")));
            request.setAttribute("turista", turista);
            
            rs.close();
            st.close();
            cn.close();
        
        } catch(Exception ex) {
            Logger.getLogger(login.class.getName()).log(Level.SEVERE, null, ex);
            response = "-1";
        }
    }    
}