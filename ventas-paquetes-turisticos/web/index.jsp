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
                <div class="login">
                    <form name="login" action="login" method="POST">
                        <div class="avatar">
                            <img src="/<% out.print(config_motor.getString("base_path")); %>/assets/images/login-icon.png">
                        </div>
                        <input type="text" name="user" placeholder="usuario" required />
                        <div class="bar">
                        <i></i>
                        </div>
                        <input type="password" name="pass" placeholder="contraseña" required />
                        <input class="submit" type="submit" name="signin" value="Ingresar" />
                    </form>
                </div>
            </header>
        </div><!-- /container -->
        <%@ include file="/WEB-INF/views/common/footer_scripts.jsp" %>
    </body>
</html>
