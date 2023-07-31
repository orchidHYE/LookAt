<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<!-- CSS -->
	<link rel="stylesheet" href="../../css/exhibition/searchExhibitioncss.css">
</head>
<body>
<%@ include file="/view/header.jsp" %>
<div class="wrap">
${filterSearchResult.exhibition}
	<form action="search.do" method="post">
		<div>
			<div>
				<input type="radio" id="radio_btn_1" class="btn" onclick=""/>
				<label for="radio_btn_1">서울</label>
			</div>
			<div>
				<input class="btn" id="radio_btn_2" type="radio"/>
				<label  for="radio_btn_2">경기</label>
			</div>
			<div>
				<input class="btn" id="radio_btn_3" type="radio"/>
				<label for="radio_btn_3">인천</label>
			</div>
			<div>
				<input class="btn" id="radio_btn_4" type="radio"/>
				<label for="radio_btn_4">강원</label>
			</div>
			<div>
				<input class="btn" id="radio_btn_5" type="radio"/>
				<label for="radio_btn_5">울산</label>
			</div>
			<div>
				<input class="btn" id="radio_btn_6" type="radio"/>
				<label for="radio_btn_6">부산</label>
			</div>
			<div>
				<input class="btn" id="radio_btn_7" type="radio"/>
				<label for="radio_btn_7">경남</label>
			</div>
			<div>
				<input class="btn" id="radio_btn_8" type="radio"/>
				<label for="radio_btn_8">대구</label>
			</div>
			<div>
				<input class="btn" id="radio_btn_9" type="radio"/>
				<label for="radio_btn_9">경북</label>
			</div>
			<div>
				<input class="btn" id="radio_btn_10" type="radio"/>
				<label for="radio_btn_10">대전</label>
			</div>
			<div>
				<input class="btn" id="radio_btn_11" type="radio"/>
				<label for="radio_btn_11">충남</label>
			</div>
			<div>
				<input class="btn" id="radio_btn_12" type="radio"/>
				<label for="radio_btn_12">충북</label>
			</div>
			<div>
				<input class="btn" id="radio_btn_13" type="radio"/>
				<label for="radio_btn_13">광주</label>
			</div>
			<div>
				<input class="btn" id="radio_btn_14" type="radio"/>
				<label for="radio_btn_14">전북</label>
			</div>
			<div>
				<input class="btn" id="radio_btn_15" type="radio"/>
				<label for="radio_btn_15">전남</label>
			</div>
			<div>
				<input class="btn" id="radio_btn_16" type="radio"/>
				<label for="radio_btn_16">제주</label>
			</div>
		<!-- 개최장소 div 끝 -->
		</div>
		<div>
			<div>
				<input class="btn" id="radio_btn_17" type="radio">
				<label for="radio_btn_17">1월</label>
			</div>
			<div>
				<input class="btn" id="radio_btn_18" type="radio">
				<label for="radio_btn_18">2월</label>
			</div>
			<div>
				<input class="btn" id="radio_btn_19" type="radio">
				<label for="radio_btn_19">3월</label>
			</div>
			<div>
				<input class="btn" id="radio_btn_20" type="radio">
				<label for="radio_btn_20">4월</label>
			</div>
			<div>
				<input class="btn" id="radio_btn_21" type="radio">
				<label for="radio_btn_21">5월</label>
			</div>
			<div>
				<input class="btn" id="radio_btn_22" type="radio">
				<label for="radio_btn_22">6월</label>
			</div>
			<div>
				<input class="btn" id="radio_btn_23" type="radio">
				<label for="radio_btn_23">7월</label>
			</div>
			<div>
				<input class="btn" id="radio_btn_24" type="radio">
				<label for="radio_btn_24">8월</label>
			</div>
			<div>
				<input class="btn" id="radio_btn_25" type="radio">
				<label for="radio_btn_25">9월</label>
			</div>
			<div>
				<input class="btn" id="radio_btn_26" type="radio">
				<label for="radio_btn_26">10월</label>
			</div>
			<div>
				<input class="btn" id="radio_btn_27" type="radio">
				<label for="radio_btn_27">11월</label>
			</div>
			<div>
				<input class="btn" id="radio_btn_28" type="radio">
				<label for="radio_btn_28">12월</label>
			</div>
		<!-- 개최시기 div 끝 -->	
		</div>
		
		<button type="submit">누르면 검색</button>
	</form>
</div>

<script type="text/javascript">
function find(){
    location.href = "search.do";
 }
</script>

</body>
</html>