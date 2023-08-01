<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전시회 목록</title>
<!-- CSS -->
<link rel="stylesheet" href="../../css/exhibition/listExhibition.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
 <%@ include file="/view/header.jsp" %>
<div class="title">
	<h1>EXHIBITION</h1>
</div>
<div class="wrap">
	<div class="exhibitionContainer">
		<c:forEach var="item" items="${exhibitionPage.content}">
			<a href="read.do?no=${item.exhibition_no}">
				<div class="item" width="1280px">
					<img src="<%=request.getContextPath() %>/img/exhibition/${item.thumbnail}" style="width: 300px; height:418px;"/>
				</div>
			</a>
		</c:forEach>
	</div>

	<div class="pagenation">
	<a href="write.do" class="btn btn-secondary btn float-right">글쓰기</a><br/>
 		<c:if test="${exhibitionPage.startPage > 5}">
 			<a href="list.do?pageNo=${exhibitionPage.startPage-5}"> &lt;&lt;pre </a>
 		</c:if>
 	
 		<%-- <c:forEach></c:forEach>1 2 3 4 5 6 7 8 9 10 --%>
 		<%--for(int i = 1; i<=10; i++) ${syso(i)} --%>
 		<c:forEach var="pNo" begin="${exhibitionPage.startPage}"  end="${exhibitionPage.endPage}" step="1">
				<a href="list.do?pageNo=${pNo}">${pNo}</a> 
 		</c:forEach>
 		
 		<c:if test="${exhibitionPage.endPage < exhibitionPage.totalPages}">
 			<a href="list.do?pageNo=${exhibitionPage.startPage+5}"> next&gt;&gt; </a>
 		</c:if>
 	</div>
</div>
</body>
</html>