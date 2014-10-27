<%-- 
    Document   : destinos
    Created on : 26/10/2014, 06:16:20 PM
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
                <h1>Destinos<span>Space-saving drop-down menu with subtle effects</span></h1>
            </header>
        </div><!-- /container -->
        <%@ include file="/WEB-INF/views/common/footer_scripts.jsp" %>
    </body>
</html>
