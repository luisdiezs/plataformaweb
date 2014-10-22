<%-- 
    Document   : index
    Created on : 16/10/2014, 10:33:04 AM
    Author     : ldiez
--%>

<%@page import="packageClass.functionsDB" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sistema de ventas de paquetes turísticos</title>
    </head>
    <body>
        
        <%
            functionsDB db = new functionsDB();
            db.connect();
            String usuario = db.get_usuarios();
            out.print(usuario);
        %>
        
        <h1>Hello World!</h1>
        <% /* <jsp:include page="login.jsp" flush="true" /> */ %>
    </body>
</html>
