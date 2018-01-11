<script>
	var notif_id = 0;
	function createMsg(txt,time_out,auto_close,notif_type){
		var color = "rgb(60, 60, 60)";
		if(notif_type == "error"){
			color = "rgb(244, 95, 66)"
		}else if(notif_type == "success"){
			color = "rgb(115, 168, 60)"
		}
		var msg_txt = txt;
		if(auto_close){
			$('.notif-panel').prepend('<div id="'+ notif_id.toString() +'"><div class="notif" style="background: '+ color.toString() +';"><p class="roboto">' + msg_txt + '</p></div></div>');
		}else{
			$('.notif-panel').prepend('<div id="'+ notif_id.toString() +'"><div class="notif" style="background: '+ color.toString() +';"><p class="roboto">' + msg_txt + '<b class="notif-link" onclick="closeMsg('+ notif_id.toString() +')">Cerrar</b></p></div></div>');
		}
		var id = notif_id;
		if(auto_close){
			setTimeout(function() {
			  $('#' + id.toString()).animate({height: "0px",opacity: "0"},200, function() {
				  $('#' + id.toString()).remove();
				});
			}, time_out);
		}
		notif_id++;
	}
	function closeMsg(id){
		$('#' + id.toString()).animate({height: "0px",opacity: "0"},200, function() {
		  $('#' + id.toString()).remove();
		});
	}
    function closeAllMsg(){
        $('.notif-panel').children('div').each(function(){
            $(this).animate({height: "0px",opacity: "0"},200, function() {
              $(this).remove();
            });
        });
		}
		
</script>
		