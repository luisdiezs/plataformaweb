/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package packageClass;

/**
 *
 * @author ldiez
 */

import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.ResourceBundle;

public class functionsDB
{
    Statement st;
    ResultSet rs;
    public void connect()
    {
        try {
            ResourceBundle configdb = ResourceBundle.getBundle("configDB");
            String hostname = configdb.getString("hostname");
            String database = configdb.getString("database");
            String username = configdb.getString("username");
            String password = configdb.getString("password");
            String port = configdb.getString("port");
            DriverManager.registerDriver(new com.mysql.jdbc.Driver());
            Connection cn = DriverManager.getConnection("jdbc:mysql://"+hostname+":"+port+"/"+database, username, password);
            
            if(!cn.isClosed())
            {
                st = cn.createStatement();
                rs = st.executeQuery("select * from usuarios");
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(functionsDB.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public String get_usuarios()
    {
        try{
            rs.first();
            return rs.getString(2);
        } catch (SQLException ex) {
            Logger.getLogger(functionsDB.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }
}
