<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Look At !</title>
	<link rel="stylesheet" href="../css/testCss.css">
	<style>
		div { /*레이아웃 확인하기위한 태그 추후에 삭제할 예정임  */
			border: 1px solid #ccc;
		}
		
		#header {
			padding: 20px;
			margin-bottom: 20px;
		}
		
		#container {
			margin: 0 50px;
		}
		
		/* #slideShow {
			width: 900px;
			padding: 20px;
			float: right;
			margin-bottom: 20px;
		} */
		
		#sidebar {
			width: 150px;
			padding: 20px;
			float: left;
			margin: 20px 0px;
		}
		
		#newContents {
			clear: both;
			padding: 20px;
			margin-bottom: 20px;
		}
		
		#footer {
			clear: both; /* 양쪽 플로팅 해제 */
			padding: 20px;
		}
		
		#sidebar_a {
			text-decoration: none;
			
		}
		
		/* visited link */
		#sidebar_a:visited {
		  color: black;
		}
		
		/* selected link */
		#sidebar_a:active {
		  color: black;
		}
	</style>
</head>
<body>
	<div name="container" id="container">
		<!-- 이 자리에는 사이트 공통 네비게이션 바가 들어가면 될 것같다. -->
		<div id="header">
			<h1>Look At !</h1>
		</div> 
		
		<!-- 사이드 바 -->
		<div name="sidebar" id="sidebar">
			<span><a name="sidebar_a" id="sidebar_a" href="#" target="_self">LOGIN</a></span><br/>		
			<span><a name="sidebar_a" id="sidebar_a" href="#" target="_self">SEARCH</a></span><br/>		
			<span><a name="sidebar_a" id="sidebar_a" href="#" target="_self">MEET OTHERS</a></span><br/>		
			<span><a name="sidebar_a" id="sidebar_a" href="#" target="_self">MY EXHIBITION</a></span><br/>		
			<br/><br/><br/>
			<span><a name="sidebar_a" id="sidebar_a" href="#" target="_self">MY PAGE</a></span><br/>		
			<span><a name="sidebar_a" id="sidebar_a" href="#" target="_self">Q & A</a></span><br/>		
			<span><a name="sidebar_a" id="sidebar_a" href="#" target="_self">NOTICE</a></span><br/>		
		</div>
		
		<!-- 인기 전시회 포스터  -->
		<div name="slideShow" id="slideShow">
			    <ul class="slides">
				      <li><img src="../img/test/flower.jpg" alt=""></li>
			          <li><img src="../img/test/fox.jpg" alt=""></li>
			          <li><img src="../img/test/lightning.jpg" alt=""></li>
			          <li><img src="../img/test/moon.jpg" alt=""></li>
			          <li><img src="../img/test/nature.jpg" alt=""></li>
			          <li><img src="../img/test/space.jpg" alt=""></li>
			    </ul>  
	   			
	   			<p class="controller">
				      <!-- &lang: 왼쪽 방향 화살표
				      &rang: 오른쪽 방향 화살표 -->
				      <span class="prev">&lang;</span>  
				      <span class="next">&rang;</span>
			    </p>
		 </div>
		
		<!-- 전시회 게시글 등록순 ASC -->
		<div name="newContents" id="newContents">
			<h2>New contents</h2>
		</div>
		
		<!-- 이 자리에는 사이트 공통 푸터가 들어가면 될 것같다. -->
		<div name="footer" id="footer">
			<h2>footer</h2>
		</div>
	</div>
	<script src="testJS.js"></script>	
</body>
</html>