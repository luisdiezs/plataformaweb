/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import classes.Paqtur;
import controller.login;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.LinkedList;
import java.util.ResourceBundle;

/**
 *
 * @author ldiez
 */
public class ConsultasDB {
    
    public static LinkedList<Paqtur> getPaqtur()
    {
        Connection cn;
        Statement st;
        ResultSet rs;
    
        LinkedList<Paqtur> listPaqtur = new LinkedList<>();
        try
        {
            ResourceBundle configDB = ResourceBundle.getBundle("configDB");
            String str_cn = "jdbc:mysql://" + configDB.getString("hostname");
            str_cn += ":" + configDB.getString("port");
            str_cn += "/" + configDB.getString("database");
            String username = configDB.getString("username");
            String password = configDB.getString("password");

            DriverManager.registerDriver(new com.mysql.jdbc.Driver());
            cn = DriverManager.getConnection(str_cn, username, password);
            st = cn.createStatement();
            
            rs = st.executeQuery("select * from tbl_paqtur");
            while(rs.next())
            {
                String nombre = rs.getString("nombre");
                Paqtur paqtur = new Paqtur();
                paqtur.setCodigo(rs.getInt("paqtur_id"));
                paqtur.setNombre(rs.getString("nombre"));
                paqtur.setDescripcion(rs.getString("descripcion"));
                paqtur.setHorario(rs.getString("hora_inicio") + "hrs - " + rs.getString("hora_fin") + "hrs");
                paqtur.setPrecio(rs.getInt("precio"));
                listPaqtur.add(paqtur);
            }
            
            rs.close();
            st.close();
            cn.close();
        }
        catch (SQLException ex)
        {
            Logger.getLogger(login.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listPaqtur;
    }
}
