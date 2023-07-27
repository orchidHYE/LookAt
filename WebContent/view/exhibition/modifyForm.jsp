<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정</title>
</head>
<body>

${modReq}
${modReq.exhibition_no}
 <div class="container">
    <!-- page title -->
	<h2  class="mt-5 mb-4 text-center">수정</h2>
	
	<form action="modify.do" method="post">
		<label for="title" class="form-label">전시명</label>
				<input type="text" name="title" id="title" class="form-control" value="${modReq.title}"/>${modReq.title}
				<c:if test="${errors.title }" ><span class="error">제목을 입력하세요</span></c:if>
			</div>
			<div class="mb-4">
				<label for="open_date" class="form-label">시작일</label>
				<input type="date" name="open_date" id="open_date" class="form-control" value="${modReq.open_date}"/><br/>
				<c:if test="${errors.open_date }">제목을 입력하세요</c:if> 
			</div>
			<div class="mb-4" >
				<label for="end_date" class="form-label">종료일</label>
				<input type="date" name="end_date" id="end_date" class="form-control" value="${modReq.end_date}"><br/>
			</div>
			<div class="mb-4" >
				<label for="place" class="form-label">장소</label>
				<input type="text" name="place" id="place" class="form-control" value="${modReq.place}"><br/>
				<c:if test="${errors.place}" ><span class="error">장소를 입력하세요</span></c:if>
			</div>
			<div class="mb-4" >
				<label for="thumbnail" class="form-label">포스터</label>
				<input type="file" name="thumbnail" id="thumbnail" class="form-control" value=""><br/>
				<c:if test="${errors.thumbnail}" ><span class="error">대표이미지를  첨부해주세요</span></c:if>
			</div>
			<div class="mb-4" >
				<label for="details_img" class="form-label">상세사진</label>
				<input type="file" name="details_img" id="details_img" class="form-control" ${modReq.details_img}"><br/>
			</div>
			<div class="mb-4" >
				<label for="content" class="form-label">상세소개</label>
				<textarea name="introduction" id="introduction" class="form-contro" rows="5" cols="30">${modReq.introduction}</textarea>
			</div>

	<!-- button -->
	<div>
     <a href="list.do">목록보기</a> 
     <button type="submit">수정하기</button>
     <a href="delete.do?no=${modReq.exhibition_no}">삭제하기</a> 
	</div>
   </form>
 </div>
</body>
</html>