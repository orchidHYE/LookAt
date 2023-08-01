<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Look At !</title>
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<!-- Bootstrap 4 CSS -->
 	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<!-- CSS -->
	<link rel="stylesheet" href="../../css/exhibition/readExhibition.css" type="text/css">
	<!-- Font -->
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@500&family=Noto+Sans+KR&display=swap" rel="stylesheet">
</head>
<body>
 <%@ include file="/view/header.jsp" %>
<div id="wrap" class="wrap">
	<div class="container">
		<!-- 전시회 포스터 -->
		<div class="item"><img class="item" src="<%=request.getContextPath() %>../../img/exhibition/${detailData.thumbnail}" style="width: 430px; height:600px;"/></div>
			<!-- 가격 장소 등 출력  -->
		<div id="itemTitle" class="item"><h1>${detailData.title}</h1></div>
		<div id="itemPrice" class="item">PRICE ${detailData.price_adult}원</div>
		<div id="itemPlace" class="item">${detailData.details_place} </div>
		<div id="itemPlace" class="item"><button id="itemBtn" type="button">BUY NOW</button></div>
	</div>
	<!-- detail img 출력 -->
	<div class="detailImg" style ="text-align:center">
		<span><img src="<%=request.getContextPath() %>../../img/exhibition/${detailData.details_img}" style="width: 700px;"/></span>
	</div>
	<!-- 세션정보 받은 후 주석해제, 코드 수정 필요 -->
	<%-- <c:if test="${AUTH_USER.id==ora.writer_id}"> --%>
	<button type="button" class="btn btn-primary" onclick="location.href='modify.do?no=${detailData.exhibition_no}'">수정하기</button>
	<button type="button" class="btn btn-primary" onclick="location.href='delete.do?no=${detailData.exhibition_no}'">삭제하기</button>
	<%-- </c:if> --%>
	<!-- 이 자리에는 사이트 공통 푸터가 들어가면 될 것같다. -->
	<div id="footer">
		<h2>footer</h2>
	</div>
</div>		
</body>
</html>