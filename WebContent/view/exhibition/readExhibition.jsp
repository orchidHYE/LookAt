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
	<!-- Flatly 테마 CSS -->
	<link rel="stylesheet" href="https://bootswatch.com/4/cerulean/bootstrap.min.css">     
	<!-- CSS -->
	<link rel="stylesheet" href="../../css/exhibition/readExhibitioncss.css" type="text/css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
	<script>
	// JQuery 문서 준비 함수: HTML 문서가 로드된 후 실행됩니다.
	$(document).ready(function() {

	    // 전시회 번호를 가져옵니다.
	    var exhibition_no = $("#want-btn").data("exhibition_no");
		// 페이지 로드시 원하는 상태를 확인하는 AJAX 요청을 보냅니다.
	    /* $.ajax({
	        url: "/exhibition/want.do",  // 요청할 URL
	        type: "GET",  // HTTP 메소드
	        data: {  // 서버로 보낼 데이터
	            "exhibition_no": exhibition_no
	        },
	        dataType: "json",  // 응답 데이터 타입
	        success: function(data) {  // 성공 콜백 함수
	            // 원하는 상태가 참이면 'active' 클래스를 추가합니다.
	           console.log("Received data: " + JSON.stringify(data));
	            if (data.wantStatus) {
	                $("#want-btn").addClass('active');
	            }
	        },
	        error: function(request, status, error) {  // 실패 콜백 함수
	        	console.log("Response text: " + request.responseText);
	        	alert("An error occurred: " + status + "\n" + error);
	        }
	    });

	    // 찜 버튼 클릭 이벤트 리스너
	    $("#want-btn").click(function() {
	        // 버튼이 활성화되어있는지 확인
	        var wantCheck = $(this).hasClass('active');

	        // 활성화 상태에 따라 메소드를 선택
	        var method = wantCheck ? 'DELETE' : 'POST';

	        // 찜 상태를 토글하는 AJAX 요청을 보냅니다.
	        $.ajax({
	            url: "/exhibition/want.do",  // 요청할 URL
	            type: method,  // HTTP 메소드
	            data: JSON.stringify({  // 서버로 보낼 데이터
	                "exhibition_no": exhibition_no
	            }),
	            contentType: "application/json; charset=utf-8",  // 요청 컨텐트 타입
	            dataType: "json",  // 응답 데이터 타입
	            success: function(data) {  // 성공 콜백 함수
	                // 성공시 'active' 클래스를 토글합니다.
	                $("#want-btn").toggleClass('active');
	            },
	            error: function(request, status, error) {  // 실패 콜백 함수
	                alert("An error occurred: " + status + "\n" + error);
	            }
	        });
	    });
	}); */
</script>
</head>
<body>
 <%@ include file="/view/header.jsp" %>
<div id="wrap" class="wrap">	
	<div class="container">
		<!-- 전시회 포스터 -->
		
			<div class="item" style="float: right;"><img src="<%=request.getContextPath() %>../../img/exhibition/${detailData.thumbnail}" style="width: 100%"/> </div>
		
		<!-- 가격 장소 등 출력  -->
		
		      <div class="item"><h3 class="title">${detailData.title}</h3> </div>
		      <br/><hr class="info-hr"/>
		      <div class="item">PRICE ${detailData.price_adult}원 </div>
		     <div class="item">TICKET  </div>
		      <div class="item">${detailData.details_place} </div>
		      <div class="item">${detailData.introduction} </div>
		</div>
	</div>
		<!-- detail img 출력 -->
		<div class="detailImg" style ="text-align:center">
			<span><img src="<%=request.getContextPath() %>../../img/exhibition/${detailData.details_img}" style="max-width: 100%"/></span>
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