<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set value="${pageContext.request.contextPath}" var="path" scope="page"></c:set>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
		<title>游戏列表-MyGame游戏商城</title>
	<link rel="shortcut icon"  href="${path}/img/LogoMini.jpg" >
	<link rel="stylesheet" type="text/css" href="${path}/css/index_style.css" />
	<link rel="stylesheet" type="text/css" href="${path}/css/gamelist_style.css" />
	<script type="text/javascript" src="${path}/js/jquery-1.11.3.min.js"></script>
	<script type="text/javascript" src="${path}/js/login.js"></script>
	<script type="text/javascript" src="${path}/js/gamelist.js"></script>
</head>
<body>
	<!-- 网站头 -->
	<%@include file="/head.jsp" %>
	<!-- 网站头结束 -->
	<div id="gamelistBg" class="gamelistBg">
		<div id="gamelist" class="gamelist">
			<p id="listtitle" class="listtitle">${title }</p>
			
			<ul id="list" class="list">
			<c:forEach items="${gamelist }" var="game" varStatus="i">
				<li id="list01" class="listgame">
				<form action="toGame${game.id }.action" method="post" id="toGame">
					<div id="listcontext${i }" class="listcontext" onclick="subForm()">
						<div class="listcontextimg">
							<img id="contextimg${i }" class="contextimg" src="/pic/${game.adspic }" />
						</div>
						<div class="listcontextinfo">
							<p id="contextname${i }" class="contextname">${game.gamename }</p>
							<p id="contexttype${i }" class="contexttype">${game.type }</p>
						</div>
						<div class="listcontextprice">
							<p id="contextprice${i }" class="contextprice">￥${game.price }</p>
						</div>
					</div>
				</form>
				</li>
			</c:forEach>
			</ul>
			
		</div>
	</div>	
	<!-- 网站尾巴 -->
	<%@include file="/foot.jsp" %>
	<!-- 网站尾巴结束 -->
</body>
</html>