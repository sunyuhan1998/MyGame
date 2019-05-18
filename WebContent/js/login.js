function login(){
	$("#cover").toggle();
}
function closeWind(){
	$("#cover").toggle();
}
function center() {
	var username = $('#username').val();
	window.location.href="user/to"+username+"Center.action";
}