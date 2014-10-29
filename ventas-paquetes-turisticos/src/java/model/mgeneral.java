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
    
    public boolean login(String user, String pass)
    {
        try { 
            rs = st.executeQuery("select * from usuarios where usuario = '" + user + "' limit 1");
            rs.first();
            String id_db = rs.getString(1);
            String usr_db = rs.getString(2);
            String pwd_db = rs.getString(3);
            
            return pwd_db.equals(pass);
        
        } catch(SQLException ex) {
            Logger.getLogger(login.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }
    
}