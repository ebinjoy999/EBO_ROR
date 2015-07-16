
$(document).ready(function(){
	$("input:checkbox[name='user[lock]']").change(function(){ 
   // alert('entered'); 
         
    if(this.checked){
    	// alert('oookss');
        $(".hide_when_not_locked").show();
    }else{
        $(".hide_when_not_locked").hide();
    }

    });

});