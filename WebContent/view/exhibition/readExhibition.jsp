<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Look At !</title>
	<style>
		body {
			width: 1200px;
			margin: auto;
		}
		
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
		
		#slideShow {
			width: 500px;
			padding: 20px;
			float: right;
			margin-bottom: 20px;
		} 
		
		#sidebar {
			width: 500px;
			heigth:800px;
			padding: 20px;
			float: left;
			margin-left: 20px;
			margin-bottom: 20px
		}
		
		#newContents {
			clear: both;
			padding: 20px;
			margin-bottom: 20px;
		}
		
		#newContents img {
			width: 70%;
			margin: auto;
		}
		
		#footer {
			clear: both; /* 양쪽 플로팅 해제 */
			padding: 20px;
		}
		#sidebar img {
			width: 300px;
		}
		
	</style>
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
	
	detailData : ${detailData}
	
	
	<div name="container" id="container">
		<!-- 이 자리에는 사이트 공통 네비게이션 바가 들어가면 될 것같다. -->
		<div id="header">
			<h1>Look At !</h1>
		</div> 
		
		<!-- 전시회 포스터 -->
		<div name="sidebar" id="sidebar">
			<span><img src="<%=request.getContextPath() %>../../img/exhibition/${detailData.thumbnail}"/></span>		
		</div>
		
		<!-- 가격 장소 등 출력  -->
		<div name="slideShow" id="slideShow">
			      <span>${detailData.title}<span>
			      <span>${detailData.introduction}<span>
			      <button id="want-btn" data-exhibition_no="${detailData.exhibition_no}">
								${detailData.exhibition_no}
				  </button>
		 </div>
		
		<!-- detail img 출력 -->
		<div name="newContents" id="newContents" style ="text-align:center">
			<span><img src="<%=request.getContextPath() %>../../img/exhibition/${detailData.details_img}"/></span>		
		</div>
		
		<!-- 세션정보 받은 후 주석해제, 코드 수정 필요 -->
		<%-- <c:if test="${AUTH_USER.id==ora.writer_id}"> --%>
			<a href="modify.do?no=${detailData.exhibition_no}"><button type="submit" class="btn btn-primary" >수정하기</button></a>
			<a href="delete.do?no=${detailData.exhibition_no}"><button type="submit" class="btn btn-primary" >삭제하기</button></a> 
		<%-- </c:if> --%>
		
		<!-- 이 자리에는 사이트 공통 푸터가 들어가면 될 것같다. -->
		<div name="footer" id="footer">
			<h2>footer</h2>
		</div>
	</div>
	
</body>
</html>