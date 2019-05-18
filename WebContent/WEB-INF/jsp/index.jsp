<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set value="${pageContext.request.contextPath}" var="path" scope="page"></c:set>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title>MyGame游戏商城-更懂你的游戏世界</title>
		<link rel="shortcut icon"  href="${path}/img/LogoMini.jpg" >
		<link rel="stylesheet" type="text/css" href="${path}/css/index_style.css" />
		<script type="text/javascript" src="${path}/js/jquery-1.11.3.min.js"></script>
		<script type="text/javascript" src="${path}/js/login.js"></script>
		<script type="text/javascript" src="${path}/js/index.js"></script>
	</head>
	<body>
		<!-- 网站头 -->
		<%@include file="/head.jsp" %>
		<!-- 网站头结束 -->
		<!-- 顶部导航条 -->
		<div id="top_menu2" class="top_menu2">
			<div id="top_menu2_me1" class="top_menu2_me">
				<a href="#">推荐</a>
			</div>
			<div id="top_menu2_me2" class="top_menu2_me">
				<a href="#">更多游戏</a>
			</div>
			<div id="top_menu_rightul" class="top_menu_rightul">
				<ul id="top_menu2_ul" class="top_menu2_ul">
					<li id="top_menu2_li1" class="top_menu2_li"><a href="#">网络游戏</a></li>
					<li id="top_menu2_li2" class="top_menu2_li"><a href="#">单机游戏</a></li>
					<li id="top_menu2_li3" class="top_menu2_li"><a href="#">英雄联盟</a></li>
					<li id="top_menu2_li4" class="top_menu2_li"><a href="#">极品飞车</a></li>
				</ul>
			</div>
			<form id="search" action="game/searchGame.action" method="post">
			<div id="top_menu_rightip" class="top_menu_rightip">
			
				<input id="keyWords" name="keyWords" placeholder="搜索游戏" />
				<span onclick="doSubmitForm()">
					<img src="${path}/img/search.png" />
				</span>
			</div>
			</form>
		</div>
		<!-- 顶部导航条结束 -->

		<div id="center_game" class="center_game">
			<!-- 中部 -->
			<div id="center_banner01" class="center_banner">
				<!-- 轮播 -->
				<div id="center_info01" class="center_info">
					<p id="title">⌈星际战甲⌋</p>
					<p id="slogan">超级英雄集结</p>
					<a href="#">立刻加入 &gt;&gt; </a>
				</div>
			</div>
			<div id="center_banner02" class="center_banner">
				<div id="center_info01" class="center_info">
					<p id="title">⌈初音未来⌋</p>
					<p id="slogan">新春版本</p>
					<a href="#">立刻加入 &gt;&gt; </a>
				</div>
			</div>
			<div id="center_banner03" class="center_banner">
				<div id="center_info01" class="center_info">
					<p id="title">⌈吞食孔明传⌋</p>
					<p id="slogan">RPG诚意之作</p>
					<a href="#">立刻加入 &gt;&gt; </a>
				</div>
			</div>
			<div id="pre" class="pre" onclick="leftClick()">&lt; </div>
			<div id="suf" class="suf" onclick="rightClick()">&gt; </div>
			<!-- 中部列表 -->
			<div id="center_gamelist" class="center_gamelist">
				<hr id="hr01" /><br />
				<p id="gamelist_title">精选游戏</p>
				<ul id="ajaxGameList">
				<c:forEach begin="0" end="4" var="i">
					<li>
						<div id="cenetr_allgame${i }" class="cenetr_allgame" onclick="toGame(${i})">
							<img id="adspic${i }" src="" />
							<div id="center_game_inc${i }" class="center_game_inc">
								<p id="gametitle${i }"></p>
							</div>
						</div>
					</li>
				</c:forEach>
				</ul>
			</div>
			<!-- 底部推荐 -->
			<div id="bottom_reco" class="bottom_reco">
				<p id="reco_title">限时特价</p>
				<div id="bottom_left" class="bottom_game">
					<img src="${path}/img/bottom01.jpg" />
					<div id="bottom_gameinc01" class="bottom_gameinc">
						<p id="bottom_gamename01" class="bottom_gameprice">河洛群侠传</p>
						<p id="bottom_gameprice01" class="bottom_gamename">￥59.00</p>
					</div>
				</div>
				<c:forEach begin="0" end="1" var="j">
				<div id="bottom_center" class="bottom_game" onclick="toGame3(${j})">
					<img id="bottom_gameimg${j }" src="" />
					<div id="bottom_gameinc${j }" class="bottom_gameinc">
						<p id="bottom_gamename${j }" class="bottom_gameprice"></p>
						<p id="bottom_gameprice${j }" class="bottom_gamename"></p>
					</div>
				</div>
				</c:forEach>
			</div>
			<!-- 尾部列表 -->
			<div id="foot_list" class="foot_list">
				<p id="foot_title">更多游戏</p>
				<ul>
				<c:forEach begin="0" end="3" var="k">
					<li>
						<div id="foot_game${k }" class="foot_game" onclick="toGame2(${k })">
							<div id="foot_gameimg${k }" class="foot_gameimg">
								<img id="foot_gameimgid${k }" src="" />
							</div>
							<div id="foot_gameinfo${k }" class="foot_gameinfo">
								<p id="footgamename${k }" class="footgamename"></p>
								<p id="footgametype${k }" class="footgametype"></p>
							</div>
							<div id="foot_gameprice${k }" class="foot_gameprice">
								<p id="footgameprice${k }" class="footgameprice"></p>
							</div>
						</div>
					</li>
				</c:forEach>
					<li>
						<div id="foot_gamepage" class="foot_gamepage">
							<div id="prePage" onclick="prePage()">上一页</div>
							<div id="currentPage"><p id="currentPageNum">第1页</p></div>
							<div id="nextPage" onclick="nextPage()">下一页</div>
						</div>
					</li>
				</ul>
			</div>
			<!-- 二维码与分类 -->
			<div id="appAndSort" class="appAndSort">
				<div id="app">
					<img src="${path}/img/app.jpg"/>
					<p>下载掌上</p>
					<p>MyGame</p>
				</div>
				<div id="sort" class="sort">
					<p>热门分类</p>
					<hr />
					<ul>
					<c:forEach items="${sessionScope.typeList }" var="type" varStatus="i">
						<li><a href="#" id="type${i }" class="type" onclick="">${type }</a></li>
					</c:forEach>
					</ul>
				</div>
			</div>
		</div>
		<!-- 网站尾巴 -->
		<%@include file="/foot.jsp" %>
		<!-- 网站尾巴结束 -->
	</body>
	
</html>
