<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : reservas
    Created on : 26/10/2014, 06:15:16 PM
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
                <h1>Reservas<span>Space-saving drop-down menu with subtle effects</span></h1>
            </header>
            
            <form action="reservas" method="POST">
                
                <section class="datos-turista">
                    <!-- nombre -->
                    <div class="fila">
                        <div class="texto">Nombre:</div>
                        <div class="campo">
                            <input type="text" name="nombre" value="" maxlength="128"> (*)
                        </div>
                    </div>

                    <!-- apellido -->
                    <div class="fila">
                        <div class="texto">Nombre:</div>
                        <div class="campo">
                            <input type="text" name="apellido" value="" maxlength="128"> (*)
                        </div>
                    </div>

                    <!-- tipo documento -->
                    <div class="fila">
                        <div class="texto">Tipo de documento:</div>
                        <div class="campo">
                            <select name="tipo_doc">
                                <option value="dni">DNI</option>
                                <option value="cex">CEX</option>
                            </select> (*)
                        </div>
                    </div>

                    <!-- número documento -->
                    <div class="fila">
                        <div class="texto">Número de documento</div>
                        <div class="campo">
                            <input type="text" name="num_doc" value="" maxlength="16"> (*)
                        </div>
                    </div>

                    <!-- nacionalidad -->
                    <div class="fila">
                        <div class="texto">Nacionalidad:</div>
                        <div class="campo">
                            <input type="text" name="nacionalidad" value="" maxlength="64"> (*)
                        </div>
                    </div>
                </section><!-- /datos-turista -->
                
                <section class="paq-tur">
                    <div>
                        <select id="leftValues" size="5" multiple></select>
                    </div>
                    <div>
                        <input type="button" id="btnLeft" value="&lt;&lt;" />
                        <input type="button" id="btnRight" value="&gt;&gt;" />
                    </div>
                    <div>
                        <select id="rightValues" size="4" multiple>
                            <option>1</option>
                            <option>2</option>
                            <option>3</option>
                        </select>
                        <div>
                            <input type="text" id="txtRight" />
                        </div>
                    </div>
                </section><!-- /paq-tur -->
                
            </form>
        </div><!-- /container -->
        <%@ include file="/WEB-INF/views/common/footer_scripts.jsp" %>
        
        <script>
            $("#btnLeft").click(function () {
                var selectedItem = $("#rightValues option:selected");
                $("#leftValues").append(selectedItem);
            });

            $("#btnRight").click(function () {
                var selectedItem = $("#leftValues option:selected");
                $("#rightValues").append(selectedItem);
            });

            $("#rightValues").change(function () {
                var selectedItem = $("#rightValues option:selected");
                $("#txtRight").val(selectedItem.text());
            });
        </script>

    </body>
</html>
