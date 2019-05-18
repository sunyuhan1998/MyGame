window.onload = autoCheck();
function autoCheck(){
    var t1=window.setInterval(confirm, 1);
 }; 
/* 用户注册校验 */
function confirm(){
	var username =  $("#reg_username").val();
	var first = $("#reg_password").val();
	var second = $("#reg_repassword").val();
	
	if(username != null && username != '' && first != null && first != '' && second != null && second != ''){
		/* 三个input都有值 */
		$("#confirm").attr('disabled',false);
		$("#null").css('display','none');
		if(first == second){
			$("#error").css('display','none');
		}else{
			$("#error").css('display','block');
		}
	}else{
		$("#confirm").attr('disabled',true);
		$("#null").css('display','block');
	}

	
}