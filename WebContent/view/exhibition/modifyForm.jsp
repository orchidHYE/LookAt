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
 <div class="container">
    <!-- page title -->
	<h2  class="mt-5 mb-4 text-center">수정</h2>
	
		<label for="title" class="form-label">${modReq.title}</label>
				<input type="text" name="title" id="title" class="form-control"/>
				<c:if test="${errors.title }" ><span class="error">제목을 입력하세요</span></c:if>
			</div>
			<div class="mb-4">
				<label for="memberNick" class="form-label">${modReq.open_date}</label>
				<input type="date" name="open_date" id="open_date" class="form-control" value="${AUTH_USER.id}"/><br/>
				<c:if test="${errors.open_date }">제목을 입력하세요</c:if> 
			</div>
			<div class="mb-4" >
				<label for="end_date" class="form-label">${modReq.end_date}</label>
				<input type="date" name="end_date" id="end_date" class="form-control"><br/>
			</div>
			<div class="mb-4" >
				<label for="place" class="form-label">${modReq.place}</label>
				<input type="text" name="place" id="place" class="form-control"><br/>
				<c:if test="${errors.place}" ><span class="error">내용을 입력하세요</span></c:if>
			</div>
			<div class="mb-4" >
				<label for="thumbnail" class="form-label">${modReq.thumbnail}</label>
				<input type="file" name="thumbnail" id="thumbnail" class="form-control"><br/>
				<c:if test="${errors.thumbnail}" ><span class="error">내용을 입력하세요</span></c:if>
			</div>
			<div class="mb-4" >
				<label for="details_img" class="form-label">${modReq.details_img}</label>
				<input type="file" name="details_img" id="details_img" class="form-control"><br/>
			</div>
			<div class="mb-4" >
				<label for="content" class="form-label">${modReq.introduction}</label>
				<textarea name="introduction" id="introduction" class="form-control" rows="5" cols="30"></textarea>
			</div>

	<!-- button -->
	<div class="d-flex justify-content-end">
     <a href="list.do"   class="btn btn-primary">목록보기</a> 
     <button type="submit" class="btn btn-primary">수정하기</button> 
     <a href="delete.do?no=${modReq.articleNumber}" class="btn btn-primary">삭제하기</a> 
	</div>
   </form>
 </div>
</body>
</html>