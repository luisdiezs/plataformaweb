<%-- 
    Document   : index
    Created on : 16/10/2014, 10:33:04 AM
    Author     : ldiez
--%>

<%@page import="java.util.ResourceBundle" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% ResourceBundle config_motor = ResourceBundle.getBundle("config_motor"); %>

<!DOCTYPE html>
<html lang="en" class="no-js">
    <%@ include file="/WEB-INF/views/common/head.jsp" %>
    <body>
        <%@ include file="/WEB-INF/views/common/menu.jsp" %>
        <div class="container demo-2">
            <header class="clearfix">
                <h1>Responsive Multi-Level Menu <span>Space-saving drop-down menu with subtle effects</span></h1>
                <form name="login" action="login" method="POST">
                    Usuario: &nbsp;<input type="text" name="user" value="" /><br />
                    Contraseña: &nbsp;<input type="password" name="pass" value="" /><br />
                    <input type="submit" name="signin" value="Ingresar" />
                </form>
            </header>
        </div><!-- /container -->
        <%@ include file="/WEB-INF/views/common/footer_scripts.jsp" %>
    </body>
</html>
