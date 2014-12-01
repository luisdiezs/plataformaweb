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
import java.util.LinkedList;
import org.json.simple.JSONObject;

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
    
    public static LinkedList<Paqtur> getPaqtur()
    {
        Connection cn;
        Statement st;
        ResultSet rs;    
        LinkedList<Paqtur> listPaqtur = new LinkedList<>();
        
        try
        {
            cn = getConnection();
            st = cn.createStatement();
            
            rs = st.executeQuery("select * from tbl_paqtur");
            while(rs.next())
            {
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
        catch (Exception ex)
        {
            Logger.getLogger(login.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listPaqtur;
    }
    
    public void setTurista(HttpServletRequest request)
    {
        Connection cn;
        Statement st;
        ResultSet rs;
        PreparedStatement ps_turista;
        try {
            cn = getConnection(); 
            st = cn.createStatement();
            
            Reservas reservas = (Reservas) request.getAttribute("reservas");
            
            rs = st.executeQuery("select turista_id, nro_documento from tbl_turista where tipo_documento = '" + reservas.getTipodoc() + "' and nro_documento = '" + reservas.getNrodoc() + "' limit 1");
            int turista_id = 0;
            
            if(!rs.first())
            {
                Date dNow = new Date();
                SimpleDateFormat ft = new SimpleDateFormat ("dd-MM-yyyy HH:mm:ss");
                String currentDate = ft.format(dNow);

                String queryTurista = "insert into tbl_turista (tipo_documento, nro_documento, nombre, apellido, edad, nacionalidad, fecha_registro) values(?, ?, ?, ?, ?, ?, ?)";

                ps_turista = cn.prepareStatement(queryTurista, PreparedStatement.RETURN_GENERATED_KEYS);
                ps_turista.setString(1, reservas.getTipodoc());
                ps_turista.setString(2, reservas.getNrodoc());
                ps_turista.setString(3, reservas.getNombres());
                ps_turista.setString(4, reservas.getApellidos());
                ps_turista.setInt(5, reservas.getEdad());
                ps_turista.setString(6, reservas.getNacionalidad());
                ps_turista.setString(7, currentDate);
                ps_turista.executeUpdate();
                
                ResultSet keyResultSet = ps_turista.getGeneratedKeys();
                if (keyResultSet.next()) {
                    turista_id = (int) keyResultSet.getInt(1);
                }
                ps_turista.close();
                
            } else {
                turista_id = (int) rs.getInt("turista_id");
            }
            
            reservas.setTuristaid(turista_id);
            request.setAttribute("reservas", reservas);
            
            st.close();
            cn.close();
            
        } catch (Exception ex) {
            Logger.getLogger(login.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void setReserva(HttpServletRequest request)
    {
        Connection cn;
        Statement st;
        PreparedStatement ps_reserva;
        try {
            cn = getConnection(); 
            st = cn.createStatement();
            
            Reservas reservas = (Reservas) request.getAttribute("reservas");
          
            String queryReserva = "insert into tbl_reserva (paqtur_id, turista_id, fecha_reserva) values(?, ?, ?)";

            ps_reserva = cn.prepareStatement(queryReserva, PreparedStatement.RETURN_GENERATED_KEYS);
            ps_reserva.setInt(1, reservas.getPaqtur());
            ps_reserva.setInt(2, reservas.getTuristaid());
            ps_reserva.setString(3, reservas.getFecha());
            ps_reserva.executeUpdate();
            
            ResultSet keyResultSet = ps_reserva.getGeneratedKeys();
            int reserva_id = 0;
            if (keyResultSet.next()) {
                reserva_id = (int) keyResultSet.getInt(1);
                reservas.setReservaid(reserva_id);
                request.setAttribute("reservas", reservas);
            }
            
            ps_reserva.close();
            st.close();
            cn.close();
            
        } catch (Exception ex) {
            Logger.getLogger(login.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void setBoleto(HttpServletRequest request)
    {
        Connection cn;
        Statement st;
        ResultSet rs;
        PreparedStatement ps_reserva;
        try {
            cn = getConnection(); 
            st = cn.createStatement();
            
            Reservas reservas = (Reservas) request.getAttribute("reservas");
          
            Date dNow = new Date();
            SimpleDateFormat ft = new SimpleDateFormat ("dd-MM-yyyy HH:mm:ss");
            String fechaRegistro = ft.format(dNow);
            
            String descripcion = "";
            double precio_total = 0;
            rs = st.executeQuery("select nombre, precio from tbl_paqtur where paqtur_id = '" + reservas.getPaqtur() + "'");
            if(rs.first())
            {
                descripcion = rs.getString("nombre");
                precio_total = rs.getDouble("precio");
            }

            String queryBoleto = "insert into tbl_boleto (reserva_id, turista_id, descripcion, acuenta, saldo, precio_total, fecha_registro) values(?, ?, ?, ?, ?, ?, ?)";

            ps_reserva = cn.prepareStatement(queryBoleto, PreparedStatement.RETURN_GENERATED_KEYS);
            ps_reserva.setInt(1, reservas.getReservaid());
            ps_reserva.setInt(2, reservas.getTuristaid());
            ps_reserva.setString(3, descripcion);
            ps_reserva.setDouble(4, reservas.getAcuenta());
            ps_reserva.setDouble(5, reservas.getSaldo());
            ps_reserva.setDouble(6, precio_total);
            ps_reserva.setString(7, fechaRegistro);
            ps_reserva.executeUpdate();
            
            ResultSet keyResultSet = ps_reserva.getGeneratedKeys();
            int boleto_id = 0;
            if (keyResultSet.next()) {
                boleto_id = (int) keyResultSet.getInt(1);
                request.setAttribute("boleto_id", boleto_id);
            }
            
            ps_reserva.close();
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
        
        JSONObject turista_json = new JSONObject();
        turista_json.put("nombres", "");
        turista_json.put("apellidos", "");
        turista_json.put("nacionalidad", "");
        turista_json.put("edad", "");
        
        try {
            cn = getConnection();
            st = cn.createStatement();
            
            rs = st.executeQuery("select nombre, apellido, nacionalidad, edad from tbl_turista where tipo_documento = '" + request.getAttribute("tipo_doc") + "' and nro_documento = '" + request.getAttribute("nro_doc") + "' limit 1");
            rs.first();
            
            turista_json.put("nombres", rs.getString("nombre"));
            turista_json.put("apellidos", rs.getString("apellido"));
            turista_json.put("nacionalidad", rs.getString("nacionalidad"));
            turista_json.put("edad", rs.getInt("edad"));
            
            rs.close();
            st.close();
            cn.close();
        
        } catch(Exception ex) {
            Logger.getLogger(login.class.getName()).log(Level.SEVERE, null, ex);
            response = "-1";
        }
        request.setAttribute("turista", turista_json);
    }
}