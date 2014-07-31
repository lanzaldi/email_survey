    $(document).ready(function(){		
		if($('input[name="survey_user[person_type]"]')[0].checked) {
                $(".caregiver").hide();
                $(".ms").show();
            }
		if($('input[name="survey_user[person_type]"]')[1].checked) {
                $(".ms").hide();
                $(".caregiver").show();
            }

        $('input[name="survey_user[person_type]"]').click(function(){
            if($(this).attr("value")=="ms"){
                $(".caregiver").hide();
                $(".ms").show();
            }
            if($(this).attr("value")=="caregiver"){
                $(".ms").hide();
                $(".caregiver").show();
            }
        });
    });

