<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LOOK AT</title>
<script type="text/javascript" src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="../css/logincss.css" />
</head>
<body>
	<form class="form" accept-charset="utf-8" name="login.jsp" action="login.do" method="post"
		onsubmit="return validCK()" >
		
		
		<div class="logo">
			<img src="../view/image/LOGO.png">
		</div>
		
	<div class="divM">
		<div>
			<input class="text" type="text" id="member_id" name="member_id"
				placeholder="아이디">
		</div>
		<div>
			<input class="text" type="password" id="member_pw" name="member_pw"
				placeholder="비밀번호">
		</div>
	</div>
	
		
		<div class="loginBtn">
			<input class="login" type="submit" style="cursor: pointer;" value="로그인">
		</div>
		
		
	<div class="naverBtn">
         <INPUT CLASS="naver" ID="naverlogin" TYPE="button" STYLE="CURSOR: POINTER;" VALUE="NAVER 아이디로 로그인"/>
	</div>

		<div class="kakaoBtn" >
			<input class="kakao" id="kakao-login-btn" type="button"  style="cursor: pointer;" value="KAKAO 아이디로 로그인">
		</div>
		
		<!--카카오 밑에  -->
	<div class="oneline">
		<div class="id">
			<input class="iddo" type="button" onclick="goIdfind()" style="cursor: pointer;" value="아이디찾기">
		</div>
		<div class="pw">
			<input class="pwdo" type="button" onclick="goPwdfind()" style="cursor: pointer;" value="비밀번호찾기">
		</div>
		
		
		<div class="join">
			<input class="joindo" type="button" onclick="goJoinPage()" style="cursor: pointer;" value="회원가입">
		</div>
	
	</div>
	<script type="text/javascript">
	function goJoinPage(){
		location.href = "./join.do";
	}
	function goPwdfind(){
		location.href = "./lostpwd.do";
	}
	
	//카카오톡 로그인
	Kakao.init('12d7fadee990ae2d4c433ab11f2cbb9a');
	$("#kakao-login-btn").on("click", function(){
	    //1. 로그인 시도
	    Kakao.Auth.login({
	        success: function(authObj) {
	         
	          //2. 로그인 성공시, API 호출
	          Kakao.API.request({
	            url: '/v2/user/me',
	            success: function(res) {
	              console.log(res);
	              var id = res.id;
	              scop:'profile_nickname, profile_image, account_email, gender, age_range, birthday';
	              location.href="index.jsp";
	        }
	          })
	          console.log(authObj);
	          var token = authObj.access_token;
	        },
	        fail: function(err) {
	          alert(JSON.stringify(err));
	        }
	      });
	}) //카카오
	

</script>
	
	
	<!--이용 약관부분  -->
	<div class="endline">
		<div class="role">
			<input class="roeldo" type="button" style="cursor: pointer;" value="이용약관">
		</div>
		<span> | </span>
		
		<div class="info">
			<input class="infodo" type="button" style="cursor: pointer;" value="고객센터">
		</div>
	</div>
	
	
	</form>


	
</body>
</html>