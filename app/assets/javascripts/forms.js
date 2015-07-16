
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


      $( "input[type='text']" ).change(function() {

         commentVal = $(".previous_experience").val()
         pExperience = parseFloat(commentVal)
         var actualDate = new Date($(".doj").val());
         var curDate = new Date()
         msDate = curDate - actualDate; 
         days = msDate / 1000 / 60 / 60 / 24; // 2 days
         years = days/365
         total_exp = years + pExperience
         total_exp = total_exp.toFixed(1)
          $(".total_experience").val(total_exp + " years");
     //alert('entered');
});

});


