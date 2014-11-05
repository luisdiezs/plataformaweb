/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import controller.login;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ResourceBundle;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.sql.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ldiez
 */
public class mgeneral {
    
    Connection cn;
    Statement st;
    ResultSet rs;
    
    public void conectar()
    {
        try {            
            ResourceBundle configDB = ResourceBundle.getBundle("configDB");
            String str_cn = "jdbc:mysql://" + configDB.getString("hostname");
            str_cn += ":" + configDB.getString("port");
            str_cn += "/" + configDB.getString("database");
            String username = configDB.getString("username");
            String password = configDB.getString("password");

            DriverManager.registerDriver(new com.mysql.jdbc.Driver());
            cn = DriverManager.getConnection(str_cn, username, password);
            st = cn.createStatement();
            
        } catch(SQLException ex) {
            Logger.getLogger(login.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public String login(String user, String pass, HttpServletRequest request)
    {
        String response;
        try {
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
        
        } catch(SQLException ex) {
            Logger.getLogger(login.class.getName()).log(Level.SEVERE, null, ex);
            response = "-1";
        }
        
        return response;
    }
    
}