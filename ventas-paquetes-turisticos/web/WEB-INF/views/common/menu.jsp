<div class="main clearfix">
    <div id="dl-menu" class="dl-menuwrapper">
        <button class="dl-trigger">Open Menu</button>
        <ul class="dl-menu">
            <li>
                <a href="/<% out.print(config_motor.getString("base_path")); %>"><i class="inicio"></i><span>Inicio</span></a>
            </li>
            <li>
                <a href="/<% out.print(config_motor.getString("base_path")); %>/reservas.jsp"><i class="reservas"></i><span>Reservas</span></a>
            </li>
            <li>
                <a href="/<% out.print(config_motor.getString("base_path")); %>/paquetes-turisticos.jsp"><i class="paq-tur"></i><span>Paquetes Turísticos</span></a>
            </li>
            <li>
                <a href="/<% out.print(config_motor.getString("base_path")); %>/destinos.jsp"><i class="destinos"></i><span>Destinos</span></a>
            </li>
            <li>
                <a href="/<% out.print(config_motor.getString("base_path")); %>/usuarios.jsp"><i class="usuarios"></i><span>Usuarios</span></a>
                <%/*<ul class="dl-submenu">
                    <li>
                        <a href="#">Usuario</a>
                        <ul class="dl-submenu">
                            <li><a href="#">Jackets</a></li>
                        </ul>
                    </li>
                </ul>*/%>
            </li>
        </ul>
    </div><!-- /dl-menuwrapper -->
</div>
