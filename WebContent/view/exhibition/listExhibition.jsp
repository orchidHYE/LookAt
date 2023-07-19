<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전시회 목록</title>
<!-- CSS -->
<link rel="stylesheet" href="../../css/listExhibiitonCss.css">
</head>
<body>
<div class="container">
 		
	<div>총 ${exhibitionPage.total}건의 검색결과가 있습니다.</div>
	<c:forEach var="result" items="${exhibitionPage.content}">
		<a href="read.do?no=${result.exhibition_no}"><img src="<%=request.getContextPath() %>/img/exhibition/${result.thumbnail}"></a>
	</c:forEach>		
 	<a href="write.do" class="btn btn-secondary btn float-right">글쓰기(p653 12라인)</a><br/>
 	
 		<%-- <c:if>이용하여 노출여부가 달라진다 --%>
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


</body>
</html>