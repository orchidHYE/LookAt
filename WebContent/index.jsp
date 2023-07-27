<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
			margin-left: 220px;
			margin-right: 220px;
			width: calc(100% - 440px);
		}
		
		/*  #slideShow {
			width: 900px;
			padding: 20px;
			float: right;
			margin-bottom: 20px;
		}  */
		
		#sidebar {
			left: 220px;
			width: 180px;
			min-height: 100%;
			z-index: 150;
			font-size: 10px;
			text-transform: uppercase;
			line-height: 20px;
		}
		
		#sub_content > * {
			float: right;
		}
		
		/* #newContents {
			clear: both;
			padding: 20px;
			margin-bottom: 20px;
		} */
		
		#footer {
			clear: both; /* 양쪽 플로팅 해제 */
			padding: 20px;
		}
		
		#sidebar_a {
			text-decoration: none;
			
		}
		
		#sidebar_a:link {
		  color: black;
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
			<span><a name="sidebar_a" id="sidebar_a" href="<%=request.getContextPath()%>/login.do" target="_self">LOGIN</a></span><br/>		
			<span><a name="sidebar_a" id="sidebar_a" href="#" target="_self">SEARCH</a></span><br/>		
			<span><a name="sidebar_a" id="sidebar_a" href="<%=request.getContextPath()%>/exhibition/list.do" target="_self">MEET OTHERS</a></span><br/>		
			<span><a name="sidebar_a" id="sidebar_a" href="#" target="_self">MY EXHIBITION</a></span><br/>		
			<br/><br/><br/>
			<span><a name="sidebar_a" id="sidebar_a" href="#" target="_self">MY PAGE</a></span><br/>		
			<span><a name="sidebar_a" id="sidebar_a" href="#" target="_self">Q & A</a></span><br/>		
			<span><a name="sidebar_a" id="sidebar_a" href="#" target="_self">NOTICE</a></span><br/>		
		</div>
		
		<!-- 인기 전시회 포스터  -->
		<div name="sub_content" id="sub_content">
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
			<div name="" id="">
				<div id="exhibitionContainer">
					<c:forEach var="item" items="${exhibitionPage.content}">
					  <c:set var="_count" value="${_count+1}" />
						  <tr>
						    <td>																					
						      <a href="<%=request.getContextPath()%>/exhibition/read.do?no=${item.exhibition_no}"><img src="<%=request.getContextPath() %>/img/exhibition/${item.thumbnail}" style="width:150px;"/></a>
						    </td>   
						  </tr>
					  		<c:if test="${_count % 3 == 0}">
							    <br>
							 </c:if>
					</c:forEach>
				</div>
	
				<!-- 페이지네이션 시작 -->			
		 		<c:if test="${exhibitionPage.startPage > 5}">
		 			<a href="list.do?pageNo=${exhibitionPage.startPage-5}"> &lt;&lt;pre </a>
		 		</c:if>
		 	
		 		<%-- <c:forEach></c:forEach>1 2 3 4 5 6 7 8 9 10 --%>
		 		<%--for(int i = 1; i<=10; i++) ${syso(i)} --%>
		 		<c:forEach var="pNo" begin="${exhibitionPage.startPage}"  end="${exhibitionPage.endPage}" step="1">
						<a href="<%=request.getContextPath()%>/exhibition/list.do?pageNo=${pNo}">${pNo}</a> 
		 		</c:forEach>
		 		
		 		<c:if test="${exhibitionPage.endPage < exhibitionPage.totalPages}">
		 			<a href="<%=request.getContextPath()%>/exhibition/list.do?pageNo=${exhibitionPage.startPage+5}"> next&gt;&gt; </a>
		 		</c:if>
			</div>
		</div>
		
		<!-- 이 자리에는 사이트 공통 푸터가 들어가면 될 것같다. -->
		<div name="footer" id="footer">
			<h2>footer</h2>
		</div>
	</div>
	<script src="testJS.js"></script>	
</body>
</html>