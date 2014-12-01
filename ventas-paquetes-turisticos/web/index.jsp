<%-- 
    Document   : index
    Created on : 16/10/2014, 10:33:04 AM
    Author     : ldiez
--%>

<%@ include file="/WEB-INF/imports.jsp" %>

<!DOCTYPE html>
<html lang="en" class="no-js">
    <%@ include file="/WEB-INF/views/head.jsp" %>
    <body id="home">
        <%@ include file="/WEB-INF/views/header.jsp" %>
                    
        <% 
        String msg_error_usr = (String)request.getAttribute("msg_error_usr");
        String msg_error_pwd = (String)request.getAttribute("msg_error_pwd");
        %>
        
        <div class="content">
			<form action="login" method="POST" class="sky-form">
				<!-- <header>Login form</header> -->
				
				<fieldset>					
					<section>
						<div class="row">
							<label class="label col col-4">Usuario</label>
							<div class="col col-8">
								<label class="input">
									<i class="icon-append icon-user"></i>
									<input type="text" name="user" />
								</label>
							</div>
						</div>
					</section>
					
					<section>
						<div class="row">
							<label class="label col col-4">Clave</label>
							<div class="col col-8">
								<label class="input">
									<i class="icon-append icon-lock"></i>
									<input type="password" name="pass" />
								</label>
							</div>
						</div>
					</section>
				</fieldset>
				<footer>
                    <input class="button" type="submit" name="signin" value="Ingresar" />
				</footer>
			</form>
		</div>
        <%@ include file="/WEB-INF/views/footer_scripts.jsp" %>
    </body>
</html>
