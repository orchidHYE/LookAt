<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="../css/testCss.css">
	<style>
		body {
			background-image : url('img/layout/main.png');
		}
		img {
		  width: 300px;
		  height: 150px;
		  object-fit: cover;
		  float:left;
		}
	</style>
</head>
<body>
	 <div id="slideShow">
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
  <script src="testJS.js"></script>
</body>
</html>