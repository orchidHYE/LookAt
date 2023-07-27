<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src=../js/resetpwd.js></script>
<link rel="stylesheet" href="../css/setpwd.css" />
<title>LOOK AT</title>
</head>
<body>

	<input type = "hidden" name="settel" value="${user.tel}">
	<form action="resetpwd.do" method="post" accept-charset="utf-8" >
	
		<div class="logo">
			<img src="../view/image/LOGO.png">
		</div>
		
		<div class ="form">
			<div>
				<input class="text" type="password" id="setpw" name="setpw"
					placeholder="새로운 비밀번호">
			</div>
			<div>
				<input class="text" type="password" id="setrepw" name="setrepw"
					placeholder="비밀번호 확인">
			</div>
      <div id="errorContainer" style ="color: #aaaaaa; font-style: italic; font-size: 10pt;" ></div>
		</div>
			<div class="setpwd">
				<input class="set" type="submit"  style="cursor: pointer;" value="로그인창으로 이동">
			</div>
			
			
   	
	</form>
	
	<script type="text/javascript">
 
 	var nameOrTelNotMatch = ${errors.nameOrTelNotMatch};
 	
 	if(nameOrTelNotMatch){
 		var errorContainer = document.getElementById("errorContainer");
 		errorContainer.innerHTML = "입력하신 새로운 비밀번호와 일치하지 않습니다.";
 	}
 </script>
</body>
</html>