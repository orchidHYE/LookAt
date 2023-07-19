<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>상세보기</h1>
	detailData : ${detailData}
	<a href="modify.do"><button type="submit" class="btn btn-primary" >수정하기</button></a>
	<a href="delete.do?no=${modReq.articleNumber}" class="btn btn-primary">삭제하기</a> 
</body>
</html>