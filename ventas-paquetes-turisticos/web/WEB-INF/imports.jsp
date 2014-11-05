<%@page import="java.util.ResourceBundle" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    ResourceBundle config_motor = ResourceBundle.getBundle("config_motor");
    
    HttpSession current_session = request.getSession(true);
    String usuario = (String)current_session.getAttribute("usuario");
    String uri = request.getRequestURI().toString();

    if(usuario == null && !uri.equals("/" + config_motor.getString("base_path") + "/index.jsp") && !uri.equals("/" + config_motor.getString("base_path") + "/"))
        response.sendRedirect("");
    
    else if(usuario != null && (uri.equals("/" + config_motor.getString("base_path") + "/index.jsp") || uri.equals("/" + config_motor.getString("base_path") + "/")))
        response.sendRedirect("reservas.jsp");
%>