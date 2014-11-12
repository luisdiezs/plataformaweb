<%-- 
    Document   : index
    Created on : 16/10/2014, 10:33:04 AM
    Author     : ldiez
--%>

<%@ include file="/WEB-INF/imports.jsp" %>

<!DOCTYPE html>
<html lang="en" class="no-js">
    <%@ include file="/WEB-INF/views/common/head.jsp" %>
    <body>
        <%@ include file="/WEB-INF/views/common/menu.jsp" %>
        <div class="container demo-2">
            <header class="clearfix">
                <h1>Responsive Multi-Level Menu <span>Space-saving drop-down menu with subtle effects</span></h1>
            </header>
            
            <div class="login">
                    
                <% 
                String msg_error_usr = (String)request.getAttribute("msg_error_usr");
                String msg_error_pwd = (String)request.getAttribute("msg_error_pwd");
                %>

                <form name="login" action="login" method="POST">
                    <div class="avatar">
                        <img src="/<% out.print(config_motor.getString("base_path")); %>/assets/images/login-icon.png">
                    </div>
                    <input type="text" name="user" placeholder="<%= (msg_error_usr != null) ? msg_error_usr : "usuario" %>" required <%= (msg_error_usr != null) ? "class=\"msg_error\"" : "" %>/>
                    <div class="bar">
                    <i></i>
                    </div>
                    <input type="password" name="pass" placeholder="<%= (msg_error_pwd != null) ? msg_error_pwd : "clave" %>" required <%= (msg_error_pwd != null) ? "class=\"msg_error\"" : "" %>/>
                    <input class="submit" type="submit" name="signin" value="Ingresar" />
                </form>
            </div>
                        
        </div><!-- /container -->
        <%@ include file="/WEB-INF/views/common/footer_scripts.jsp" %>
    </body>
</html>
