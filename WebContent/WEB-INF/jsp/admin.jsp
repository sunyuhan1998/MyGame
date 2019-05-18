<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>网站后台</title>
	</head>
	<style>
		*{
			margin: 0;
			padding: 0;
		}
		#head{
			width: 100%;
			height: 70px;
			text-align: center;
			background-color: black;
			box-shadow: 0px 10px 10px gray;
		}
		#head p{
			font-family: "楷体";
			font-size: 50px;
			color: white;
		}
		#head a{
			position: absolute;
			left: 50px;
			top: 20px;
			float: left;
			text-decoration: none;
			font-size: 20px;
			color: white;
		}
		#head a:hover{
			color: red;
		}
		#ginfo{
			margin-left: 370px;
			margin-top: 50px;
			width: 600px;
			height: 400px;
			border-radius: 10px ;
			box-shadow: 0px 20px 20px gray;
		}
		#ginfo input{
			width: 300px;
			height: 40px;
			padding-left: 20px;
			font-size: 20px;
			border: 2px solid #ccc;
		}
		#ginfo td{
			width: 190px;
			padding-left: 20px;
			font-size: 25px;
			color: white;
			border-radius: 10px ;
			background-color: gray;
		}
	</style>
	<body>
		<div id="head">
			<p>MyGame后台管理系统</p>
			<a href="/MyGame/index.action">返回首页</a>
		</div>
		<form action="${pageContext.request.contextPath}/game/gameInput.action" method="post" enctype="multipart/form-data">
			<table id="ginfo">
				<tr>
					<td>游戏名</td>
					<td>
						<input type="text" name="gamename" />
					</td>
				</tr>
				<tr>
					<td>价格</td>
					<td>
						<input type="text" name="price" />
					</td>
				</tr>
				<tr>
					<td>简介</td>
					<td>
						<input type="text" name="Info" />
					</td>
				</tr>
				<tr>
					<td>开发商</td>
					<td>
						<input type="text" name="author" />
					</td>
				</tr>
				<tr>
					<td>海报</td>
					<td>
						<input type="file" name="files" />
					</td>
				</tr>
				<tr>
					<td>封面</td>
					<td>
						<input type="file" name="files" />
					</td>
				</tr>
				<tr>
					<td>广告图</td>
					<td>
						<input type="file" name="files" />
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="提交" style="width: 540px;" />
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>