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
    });
</script>