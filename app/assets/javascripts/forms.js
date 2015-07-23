
function readURL(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();

        reader.onload = function (e) {
            $('.image_visual_show').attr('src', e.target.result);
        }

        reader.readAsDataURL(input.files[0]);
    }
}



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


    $("input:checkbox[name='remove_profile_picture']").change(function(){
         //alert('entered');

        if(this.checked){
            // alert('oookss');
            $(".hide_when_no_profile_picture_need").hide();
            document.getElementById('profile_picture').value= null;
            document.getElementById('image_visual_show').value= null;
        }else{
            $(".hide_when_no_profile_picture_need").show();
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


