<%-- 
    Document   : login
    Created on : 16/10/2014, 10:34:19 AM
    Author     : ldiez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login | SVPT</title>
    </head>
    <body>
        <h1>Login</h1>
        
        <%
            String usr_form = "", psw_form = "", usr_ok = "ldiez", psw_ok = "ldiez";
            if(request.getParameter("signin") != null)
            {
                usr_form = request.getParameter("user");
                psw_form = request.getParameter("pass");
                
                out.print(usr_form == usr_ok);
                if(usr_ok == usr_form && psw_form == psw_ok)
                {
                    out.print("Usuario y clave correctos!!!");
                }
                else
                {
                    out.print("Usuario o Clave incorrecta!");
                }
            }
        %>
        
        <form name="login" action="login.jsp" method="POST">
            Usuario: &nbsp;<input type="text" name="user" value="<% out.print(usr_form); %>" /><br />
            Contraseña: &nbsp;<input type="password" name="pass" value="<% out.print(psw_form); %>" /><br />
            <input type="submit" name="signin" value="Ingresar" />
        </form>
    </body>
</html>
