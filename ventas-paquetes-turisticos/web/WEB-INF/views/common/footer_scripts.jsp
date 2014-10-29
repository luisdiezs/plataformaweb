<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script src="/<% out.print(config_motor.getString("base_path")); %>/assets/js/jquery.dlmenu.js"></script>
<script>
    $(function() {
        $( '#dl-menu' ).dlmenu({
            animationClasses : { classin : 'dl-animate-in-2', classout : 'dl-animate-out-2' }
        });
    });
</script>