<%-- 
    Document   : reservas
    Created on : 26/10/2014, 06:15:16 PM
    Author     : ldiez
--%>

<%@ include file="/WEB-INF/imports.jsp" %>
<%@ page import = "classes.*"%>

<!DOCTYPE html>
<html lang="en" class="no-js">
    <head>
    <%@ include file="/WEB-INF/views/head.jsp" %>
    <!-- datepicker -->
    <script src="/<% out.print(config_motor.getString("base_path")); %>/assets/js/jquery-ui.js"></script>
    </head>
    <body id="reservas" class="pt0">
        <%@ include file="/WEB-INF/views/header.jsp" %>
        
        <div class="content">
			<form action="reservas" method="POST" class="sky-form">
				<!-- <header>Checkout form</header> -->
				
                                <fieldset>
                                    <div class="row">
                                        <section class="col col-6">
                                            <label class="select">
                                                <select id="tipodoc" name="tipo_doc">
                                                    <option value="dni" selected="">DNI</option>
                                                    <option value="cex">CEX</option>
                                                </select>
                                                <i></i>
                                            </label>
                                        </section>
                                        <section class="col col-6">
                                            <label class="input">
                                                <i class="icon-prepend icon-ndoc"></i>
                                                <i class="icon-append icon-asterisk"></i>
                                                <input id="nrodoc" type="text" name="nro_doc" placeholder="Número de documento">
                                            </label>
                                        </section>
                                    </div>
                                    <div class="row">
                                        <section class="col col-6">
                                            <label class="input">
                                                <i class="icon-prepend icon-user"></i>
                                                <i class="icon-append icon-asterisk"></i>
                                                <input type="text" name="nombres" placeholder="Nombres">
                                            </label>
                                        </section>
                                        <section class="col col-6">
                                            <label class="input">
                                                <i class="icon-prepend icon-user"></i>
                                                <i class="icon-append icon-asterisk"></i>
                                                <input type="text" name="apellidos" placeholder="Apellidos">
                                            </label>
                                        </section>
                                    </div>
				</fieldset>
				
				<fieldset>
                                    <div class="row">
                                        <section class="col col-6">
                                            <label class="select">
                                                <select name="nacionalidad">
                                                    <option value="0" selected="" disabled="">Nacionalidad</option>
                                                    <option value="algeria">Algeria</option>
                                                    <option value="argentina">Argentina</option>
                                                    <option value="australia">Australia</option>
                                                    <option value="bolivia">Bolivia</option>
                                                    <option value="brasil">Brasil</option>
                                                    <option value="canada">Canada</option>
                                                    <option value="chile">Chile</option>
                                                    <option value="china">China</option>
                                                    <option value="colombia">Colombia</option>
                                                    <option value="costa-rica">Costa Rica</option>
                                                    <option value="cuba">Cuba</option>
                                                    <option value="ecuador">Ecuador</option>
                                                    <option value="francia">Francia</option>
                                                    <option value="alemania">Alemania</option>
                                                    <option value="guatemala">Guatemala</option>
                                                    <option value="india">India</option>
                                                    <option value="indonesia">Indonesia</option>
                                                    <option value="italia">Italia</option>
                                                    <option value="jamaica">Jamaica</option>
                                                    <option value="japón">Japón</option>
                                                    <option value="méxico">México</option>
                                                    <option value="holanda">Holanda</option>
                                                    <option value="nigeria">Nigeria</option>
                                                    <option value="panama">Panama</option>
                                                    <option value="paraguay">Paraguay</option>
                                                    <option value="perú">Perú</option>
                                                    <option value="estados-unidos">Estados Unidos</option>
                                                    <option value="uruguay">Uruguay</option>
                                                </select>
                                                    <i></i>
                                            </label>
                                        </section>

                                        <section class="col col-4">
                                            <label class="input">
                                                <i class="icon-prepend icon-edad"></i>
                                                <i class="icon-append icon-asterisk"></i>
                                                <input type="number" name="edad" placeholder="Edad">
                                            </label>
                                        </section>
                                    </div>
					
				</fieldset>
				
				<fieldset>
					<div class="row">
                                            <section class="col col-6">
                                                <label class="select paqtur">
                                                    <%@ page import = "model.getPaqtur"%> 
                                                    <%@ page import = "java.util.LinkedList"%>
                                                    <% LinkedList<Paqtur> listPaqtur = getPaqtur.getPaqtur(); %>
                                                    <select id="select_paqtur" name="paq_tur" size="5">
                                                        <option value="0" disabled="">Paquete Turístico</option>
                                                        <script>var paqtur = new Array(<%= listPaqtur.size() %>);</script>
                                                        <%
                                                        for(int i = 0; i < listPaqtur.size(); i++)
                                                        {
                                                            out.println("<script>"
                                                                + "paqtur[" + i + "] = {"
                                                                + "Descripcion: \"" + listPaqtur.get(i).getDescripcion() + "\","
                                                                + "Horario: \"" + listPaqtur.get(i).getHorario() + "\","
                                                                + "Precio: \"" + listPaqtur.get(i).getPrecio() + "\","
                                                                + "};</script>");
                                                            out.println("<option data-i='" + i + "' value='" + listPaqtur.get(i).getCodigo() + "'>" + listPaqtur.get(i).getNombre() + "</option>");
                                                        }
                                                        %>
                                                    </select>
                                                </label>
                                            </section>
                                            <section class="col col-6">
                                                    <label class="select paqtur">
                                                            <div id="desc_paqtur"></div>
                                                    </label>
                                            </section>
					</div>

					<div class="row">
						<section class="col col-6">
							<label class="input">
								<i class="icon-append fa fa-calendar"></i>
								<input type="text" name="fecha" id="datepicker" placeholder="Fecha">
							</label>
						</section>
					</div>
				</fieldset>
				
				<footer>
					<button type="submit" name="registrar_reserva" class="button">Continue</button>
				</footer>
			</form>
		</div>
        
                <script>
                    $(function() {
                        $( "#datepicker" ).datepicker();
                    });

                    $("#select_paqtur").change(function(){
                        var desc_paqtur;
                        var selected = $(this).find('option:selected');
                        var _i = selected.data('i');
                        desc_paqtur = '<div><ul><li><strong>Código: </strong>' + $(this).val() + '</li>';
                        desc_paqtur += '<li><strong>Descripción: </strong>' + paqtur[_i]["Descripcion"] + '</li>';
                        desc_paqtur += '<li><strong>Horario: </strong>' + paqtur[_i]["Horario"] + '</li>';
                        desc_paqtur += '<li><strong>Precio:</strong>' + paqtur[_i]["Precio"] + '</li></ul></div>';
                        $("#desc_paqtur").html(desc_paqtur);
                    });
                    
                    $("#nrodoc").change(function () {
                        //alert($("#tipodoc").val());
                        var tipodoc = $("#tipodoc").val();
                        var nrodoc = $(this).val();
                        <%
                            request.setAttribute("tur_tipodoc", );
                        %>
                    });
                </script>
        <%@ include file="/WEB-INF/views/footer_scripts.jsp" %>

    </body>
</html>