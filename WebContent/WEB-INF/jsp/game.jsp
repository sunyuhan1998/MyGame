<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set value="${pageContext.request.contextPath}" var="path" scope="page"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${game.gamename }-MyGame游戏商城</title>
<link rel="shortcut icon"  href="${path}/img/LogoMini.jpg" >
<link rel="stylesheet" type="text/css" href="${path}/css/index_style.css" />
<link rel="stylesheet" type="text/css" href="${path}/css/game_style.css" />
<script type="text/javascript" src="${path}/js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="${path}/js/login.js"></script>
</head>
<body>
	<!-- 网站头 -->
	<%@include file="/head.jsp" %>
	<!-- 网站头结束 -->
	<!-- 游戏头 -->
	<div id="game_banner" class="game_banner">
		<p>${game.gamename }</p>
		<div id="game_head" class="game_head">
			<img src="/pic/${game.cover }" />
		</div>
	</div>
	<div id="game_menu">
		<p>游戏详情</p>
	</div>
	<div id="game" class="game">
		<div id="gameInfo" class="gameInfo">
			<div id="gamePic" class="gamePic">
				<img src="/pic/${game.poster }" />
			</div>
			<div id="gameAll" class="gameAll">
				<table>
					<tr>
						<td class="title"><p>游戏名称</p></td>
						<td class="cont"><h>${game.gamename }</h></td>
					</tr>
					<tr>
						<td class="title"><p>发行日期</p></td>
						<td class="cont"><h>${sessionScope.createtime }</h></td>
					</tr>
					<tr>
						<td class="title"><p>开发商</p></td>
						<td class="cont"><h>${game.author }</h></td>
					</tr>
					<tr>
						<td class="title"><p>发行平台</p></td>
						<td class="cont"><h>MyGame</h></td>
					</tr>
					<tr>
						<td class="title"><p>游戏分类</p></td>
						<td class="cont"><h>${game.type }</h></td>
					</tr>
				</table>
				<p id="price">￥${game.price }</p>
				<input type="submit" value="立即购买"></input>
			</div>
		</div>
		<div id="gameIns" class="gameIns">
			<p>游戏简介</p>
			<div id="gameInsCont" class="gameInsCont">
				<span>${game.info }</span>
			</div>
		</div>
		<div id="sort" class="sort">
			<p>热门分类</p>
			<hr />
			<ul>
				<li><a href="#">冒险</a></li>
				<li><a href="#">射击</a></li>
				<li><a href="#">大型网游</a></li>
				<li><a href="#">玄幻</a></li>
				<li><a href="#">赛车竞速</a></li>
				<li><a href="#">仙侠</a></li>
			</ul>
		</div>
	</div>
	<!-- 网站尾巴 -->
	<%@include file="/foot.jsp" %>
	<!-- 网站尾巴结束 -->
</body>
</html>