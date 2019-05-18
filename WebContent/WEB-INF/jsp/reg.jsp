<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set value="${pageContext.request.contextPath}" var="path" scope="page"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>用户注册-MyGame游戏商城</title>
<link rel="shortcut icon"  href="${path}/img/LogoMini.jpg" >
<link rel="stylesheet" type="text/css" href="${path}/css/index_style.css" />
<link rel="stylesheet" type="text/css" href="${path}/css/reg_style.css" />
<script type="text/javascript" src="${path}/js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="${path}/js/reg.js"></script>
<script type="text/javascript" src="${path}/js/login.js"></script>
</head>
<body>
	<!-- 网站头 -->
	<%@include file="/head.jsp" %>
	<!-- 网站头结束 -->
	<div id="regBg" class="regBg">
		<div id="reg" class="reg">
			<div id="reg_title" class="reg_title">
				<p>注册&nbsp;MyGame</p>
			</div>
			<form action="${pageContext.request.contextPath}/user/userReg.action" method="post">
			<div id="reg_con" class="reg_con">
				<input id="reg_username" class="reg_username" name="username" type="text" placeholder="用户名"/>
				<input id="reg_password" class="reg_password" name="password" type="password" placeholder="密码" />
				<input id="reg_repassword" class="reg_repassword" type="password" placeholder="确认密码"/>
				<button type="submit" id="confirm" class="confirm" value="注册" onclick="confirm()" >注册</button>
				<div id="msg" class="msg">
					<p id="error">两次输入的密码不一致！</p>
					<p id="null">用户名或密码不能为空！</p>
				</div>
			</div>
			</form>
			
		</div>
	</div>
	<!-- 网站尾巴 -->
	<%@include file="/foot.jsp" %>
	<!-- 网站尾巴结束 -->
</body>
</html>