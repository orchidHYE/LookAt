<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style>
		body {
			margin: 0 160px;
		}
		
		#searchBox {
			width: 1000px;
			height: 200px;
			border:1px solid;
		}
		#searchBox > #leftBox {
			border:1px solid;
			float:left;
			width:200px;
			height:200px;
			
		}
		
		#searchBox > #rightBox {
			border:1px solid;
			float:right;
			width:700px;
			height:200px;
		} 
		#searchBox #search {
			border:1px solid;
			float:right;
			width:700px;
			height:200px;
		}
	</style>
</head>
<body>
	<div name="searchBox" id="searchBox">
		<div name="leftBox" id="leftBox">
			<div name="searchText" id="searchText"></div>
				내가 보고 싶은<br/>
				전시회만<br/>
				보자!<br/>
				<br/>
				전시회를 찾아보세요 !
			</div>	
		</div>
		<div name="rightBox" id="rightBox">
			<div name="search" id="search">
				<table>
						<tr><td>개최 장소</td></tr>
						<tr>
							<td>서울</td>
							<td>경기</td>
							<td>인천</td>
							<td>강원</td>
							<td>울산</td>
							<td>부산</td>
							<td>경남</td>
							<td>대구</td>
							<td>경북</td>
							<td>대전</td>
							<td>충남</td>
							<td>충북</td>
							<td>광주</td>
							<td>전북</td>
							<td>전남</td>
							<td>제주</td>
						</tr>
				</table>
				<br/>
				<table>
						<tr><td>개최 시기</td></tr>
						<tr>
							<td>1월</td>
							<td>2월</td>
							<td>3월</td>
							<td>4월</td>
							<td>5월</td>
							<td>6월</td>
							<td>7월</td>
							<td>8월</td>
							<td>9월</td>
							<td>10월</td>
							<td>11월</td>
							<td>12월</td>
						</tr>
				</table>
			</div>	
		</div>	
	</div>
</body>
</html>