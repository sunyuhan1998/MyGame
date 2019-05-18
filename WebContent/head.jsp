<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set value="${pageContext.request.contextPath}" var="path" scope="page"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id = "top_menu" class="top_menu">
	<img src="${path}/img/Logo02.png" />
	
	<div id="top_menu_center01" class="top_menu_center">
		<a href="${path}/index.action">主页</a>
	</div>
	<div id="top_menu_center02" class="top_menu_center">
		<a href="#">移动端</a>
	</div>
	<div id="top_menu_center03" class="top_menu_center">
		<a href="#">排行</a>
	</div>
	<div id="top_menu_center04" class="top_menu_center">
		<a href="#">开发者</a>
	</div>
	<div id="top_menu_center05" class="top_menu_center">
		<a href="#">帮助反馈</a>
	</div>
	<div id="top_menu_right" class="top_menu_right">
		<c:if test="${sessionScope.username == null}" >
		<div id="loginAndReg" class="loginAndReg" onclick="login()">
			<p>用户登录</p>
		</div>
		</c:if>
		<c:if test="${sessionScope.username != null}" >
		<div id="loginAndReg" class="loginAndReg" onclick="center()">
			<input id="username" type="hidden" value="${sessionScope.username}" >
			<p>${sessionScope.username}&nbsp;<a href="${path}/user/userOff.action">[退出]</a></p>
		</div>
		</c:if>
	</div>
</div>
<!-- 网站登录遮罩 -->
<div id="cover" class="cover">
	<form action="${pageContext.request.contextPath}/user/userLogin.action" method="post">
		<span id="loginWind" class="loginWind">
			<div id="title">
				<p>登录&nbsp;MyGame</p>
				<div id="closeWind" onclick="closeWind()"><h>×</h></div>
			</div>
			<input type="text" id="username" name="username" placeholder="用户名"/>
			<input type="password" id="password" name="password" placeholder="密码"/>
			<input type="submit" id="sub" name="sub" value="登录" />
			<p id="reg">没有账号？<a href="${path}/reg.action">注册一个</a></p>
		</span>
	</form>
</div>
<!-- 网站登录遮罩结束 -->
</body>
</html>