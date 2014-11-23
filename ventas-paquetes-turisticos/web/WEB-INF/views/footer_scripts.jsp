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

        $(function() {
            $( "#datepicker" ).datepicker();
        });

        $("#select_paqtur").change(function(){
            var desc_paqtur;
            desc_paqtur = '<div><ul><li><strong>Código: </strong>' + $(this).val() + '</li>';
            desc_paqtur += '<li><strong>Descripción: </strong>' + $(this).val() + ' bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla </li>';
            desc_paqtur += '<li><strong>Horario: </strong>08:00hrs - 21:00hrs</li>';
            desc_paqtur += '<li><strong>Precio:</strong> S/. 1,500</li></ul></div>';
            $("#desc_paqtur").html(desc_paqtur);
        });

    });
</script>