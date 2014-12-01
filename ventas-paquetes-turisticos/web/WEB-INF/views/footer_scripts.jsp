<script>
    $(document).ready(function(){
        
        $(".bt-menu-trigger").toggle(
            function(){
                $('.bt-menu').addClass('bt-menu-open');
            },
            function(){
                $('.bt-menu').removeClass('bt-menu-open');
            }
        );

        $().UItoTop({ easingType: 'easeOutQuart' });
        
        $( "#datepicker" ).datepicker();

        var _i;
        var _precio = 0;
        var _saldo = 0;
        var _open_ul = '<ul><li><strong>Saldo: </strong>S/.';
        var _close_ul = '</li></ul>';
        $("#select_paqtur").change(function(){
            var desc_paqtur;
            var selected = $(this).find('option:selected');
            var _acuenta = $("#acuenta").val();
            _i = selected.data('i');
            _precio = paqtur[_i]["Precio"];
            desc_paqtur = '<div><ul><li><strong>Código: </strong>' + $(this).val() + '</li>';
            desc_paqtur += '<li><strong>Descripción: </strong>' + paqtur[_i]["Descripcion"] + '</li>';
            desc_paqtur += '<li><strong>Horario: </strong>' + paqtur[_i]["Horario"] + '</li>';
            desc_paqtur += '<li><strong>Precio:</strong>' + paqtur[_i]["Precio"] + '</li></ul></div>';
            $("#desc_paqtur").html(desc_paqtur);
            
            _saldo = (_precio - _acuenta);
            $("#saldo").html(_open_ul + _saldo + _close_ul);
        });

        $("#nrodoc").change(function(){
            var tipodoc = $("#tipodoc").val();
            var nrodoc = $(this).val();
            $.get("ConsultaTurista", { tipo_doc: tipodoc, nro_doc: nrodoc }, function(data){
                $('#nombres').val(data.nombres);
                $('#apellidos').val(data.apellidos);
                $('#nacionalidad').val(data.nacionalidad);
                $('#edad').val(data.edad);
            }, "json");
        });

        $("#form_reservas").validate({
            rules:{
                tipo_doc:{required:true},
                nro_doc:{required:true, minlength:4, maxlength:32},
                nombres:{required:true, minlength:2, maxlength:64},
                apellidos:{required:true, minlength:2, maxlength:64},
                nacionalidad:{required:true},
                edad:{required:true, minlength:1},
                paq_tur:{required:true},
                fecha:{required:true}
            }
            /*submitHandler: function (form) {
                alert('valid form submitted');
                return false;
            }*/
        });
        
        $("#acuenta").keyup(function(){
            var _acuenta = $("#acuenta").val();
            _saldo = (_precio - _acuenta);
            $("#saldo").html(_open_ul + _saldo + _close_ul);
            $("#input_saldo").val(_saldo);
        });
    });
</script>