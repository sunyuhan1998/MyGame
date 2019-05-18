window.onload = autoPlay();
function autoPlay(){
	//启动轮播图
    var t1=window.setInterval(rightClick, 3000);
    //初始化头部游戏列表
    getGameList();
    //初始化中部游戏列表
    getCheapGames();
    //初始化尾部游戏列表
    currentPage = 1;
    initGamePage();
    //初始化分类列表
    getTypeList();
 }; 
/* 轮播图右击*/
function rightClick(){
	var banner01Index = document.getElementById("center_banner01").style.zIndex;
	var banner02Index = document.getElementById("center_banner02").style.zIndex;
	var banner03Index = document.getElementById("center_banner03").style.zIndex;
	if(banner01Index>banner02Index){
		if(banner01Index>banner03Index){
			document.getElementById("center_banner02").style.zIndex=3;
			document.getElementById("center_banner03").style.zIndex=2;
			document.getElementById("center_banner01").style.zIndex=1;
		}
	}
	if(banner02Index>banner01Index){
		if(banner02Index>banner03Index){
			document.getElementById("center_banner03").style.zIndex=3;
			document.getElementById("center_banner01").style.zIndex=2;
			document.getElementById("center_banner02").style.zIndex=1;
		}
	}
	if(banner03Index>banner01Index){
		if(banner03Index>banner02Index){
			document.getElementById("center_banner01").style.zIndex=3;
			document.getElementById("center_banner02").style.zIndex=2;
			document.getElementById("center_banner03").style.zIndex=1;
		}
	}
	/* 首次进入网页判断 */
	if(banner01Index == banner02Index){
		if(banner01Index == banner03Index){
			document.getElementById("center_banner01").style.zIndex=2;
			document.getElementById("center_banner02").style.zIndex=3;
			document.getElementById("center_banner03").style.zIndex=1;
		}
	}
}
/* 轮播图左击*/
function leftClick(){
	var banner01Index = document.getElementById("center_banner01").style.zIndex;
	var banner02Index = document.getElementById("center_banner02").style.zIndex;
	var banner03Index = document.getElementById("center_banner03").style.zIndex;
	if(banner01Index>banner02Index){
		if(banner01Index>banner03Index){
			document.getElementById("center_banner03").style.zIndex=3;
			document.getElementById("center_banner02").style.zIndex=2;
			document.getElementById("center_banner01").style.zIndex=1;
		}
	}
	if(banner02Index>banner01Index){
		if(banner02Index>banner03Index){
			document.getElementById("center_banner01").style.zIndex=3;
			document.getElementById("center_banner03").style.zIndex=2;
			document.getElementById("center_banner02").style.zIndex=1;
		}
	}
	if(banner03Index>banner01Index){
		if(banner03Index>banner02Index){
			document.getElementById("center_banner02").style.zIndex=3;
			document.getElementById("center_banner01").style.zIndex=2;
			document.getElementById("center_banner03").style.zIndex=1;
		}
	}
	/* 首次进入网页判断 */
	if(banner01Index == banner02Index){
		if(banner01Index == banner03Index){
			document.getElementById("center_banner01").style.zIndex=1;
			document.getElementById("center_banner02").style.zIndex=2;
			document.getElementById("center_banner03").style.zIndex=3;
		}
	}
}
/*用于保存首部列表游戏id*/
var gameid = new Array(5);
/*动态添加首部游戏列表*/
function getGameList(){
	$.ajax({
		url:"game/getGameList.action",
		method:"post",
		dataType : "json",
		success:function(data){
			var gameList = data;
			$.each(gameList,function(i,game){
				gameid[i] = game.id;
				$("#adspic"+i).attr("src","/pic/"+game.cover);
				$("#gametitle"+i).text(game.gamename);
				$("#bottom_gamename02")
				if(i == 4) return false;
			});
		}
	})
}
function toGame(i) {
	window.location.href="game/toGame"+gameid[i]+".action";
}
/*用于保存中部列表游戏id*/
var gameid3 = new Array(2);
/*动态添加中部游戏列表*/
function getCheapGames(){
	$.ajax({
		url:"game/getCheapGame.action",
		method:"post",
		dataType : "json",
		success:function(data){
			var gameList = data;
			$.each(gameList,function(i,game){
				gameid3[i] = game.id;
				$("#bottom_gameimg"+i).attr("src","/pic/"+game.cover);
				$("#bottom_gamename"+i).text(game.gamename);
				$("#bottom_gameprice"+i).text("￥"+game.price+".00");
				if(i == 1) return false;
			});
		}
	})
}
function toGame3(j) {
	window.location.href="game/toGame"+gameid3[j]+".action";
}

/*用于保存尾部列表游戏id*/
var gameid2 = new Array(4);
/*初始化尾部列表*/
function initGamePage() {
	$("#currentPageNum").text("第"+currentPage+"页");
	getGamePage(currentPage);
	getEndPage();
}
/*获得总页数*/
function getEndPage() {
	$.ajax({
		url:"game/getEndPage.action",
		method:"post",
		success:function(data){
			endPage = data;
		}
	})
}
/*获取游戏分页列表*/
function getGamePage(k) {
	$.ajax({
		url:"game/getGamePage.action",
		data: {"currentPage":k},
		method:"post",
		dataType : "json",
		success:function(data){
			var lists = data;
			$.each(lists,function(i,game){
				gameid2[i] = game.id;
				$("#foot_gameimgid"+i).attr("src","/pic/"+game.adspic);
				$("#footgamename"+i).text(game.gamename);
				$("#footgametype"+i).text(game.type);
				$("#footgameprice"+i).text("￥"+game.price);
			});
		}
	})
}
function toGame2(k) {
	window.location.href="game/toGame"+gameid2[k]+".action";
}
/*上一页*/
function prePage() {
	if (currentPage == 1) {
		alert("已经是第一页！");
	}else{
		currentPage = currentPage-1;
		initGamePage();
	}
}
/*下一页*/
function nextPage() {
	if (currentPage == endPage) {
		alert("抱歉，已经是最后一页");
	}else {
		currentPage = currentPage+1;
		initGamePage();
	}
}
/*提交搜索表单*/
function doSubmitForm() {
	var form = document.getElementById('search');
	form.submit();
}
/*获取游戏分类列表*/
function  getTypeList() {
	$.ajax({
		url:"game/getTypeList.action",
		method:"post",
		success:function(data){
			
		}
	})
}
