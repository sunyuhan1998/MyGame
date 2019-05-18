<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set value="${pageContext.request.contextPath}" var="path" scope="page"></c:set>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>提示信息-MyGame游戏商城</title>
	<link rel="shortcut icon"  href="${path}/img/LogoMini.jpg" >
	<link rel="stylesheet" type="text/css" href="${path}/css/index_style.css" />
	<link rel="stylesheet" type="text/css" href="${path}/css/msg_style.css" />
	<script type="text/javascript" src="${path}/js/jquery-1.11.3.min.js"></script>
	<script type="text/javascript" src="${path}/js/login.js"></script>
</head>
<body>
	<!-- 网站头 -->
	<%@include file="/head.jsp" %>
	<!-- 网站头结束 -->
	<div id="msgBg" class="msgBg">
		<div id="msg_Info" class="msg_Info">
			<p>${msg }返回<a href="${path}/index.action">首页</a></p>
		</div>
	</div>
	<!-- 网站尾巴 -->
	<%@include file="/foot.jsp" %>
	<!-- 网站尾巴结束 -->
</body>
</html>