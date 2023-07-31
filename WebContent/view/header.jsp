<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cPath" value="<%=request.getContextPath()%>"></c:set>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://unpkg.com/masonry-layout@4/dist/masonry.pkgd.min.js"></script>
<script src="https://unpkg.com/imagesloaded@4/imagesloaded.pkgd.min.js"></script> 
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700;900&family=Raleway:wght@600;700;800;900&family=Roboto:wght@300;400;500;700;900&display=swap" rel="stylesheet">
<link href="<%=request.getContextPath() %>/css/header_css.css" rel="stylesheet" >
</head>
<body>
<script src="reviewList.js"></script>

<div class="Menu">

   <div class="topMenu">
      <div class="hambergerBtn">
      <div class="mobile_btn">
   <input type="checkbox" id="hamburger" />
   <label for="hamburger">
     <span></span>
     <span></span>
     <span></span>
   </label>
   
   <div class="sidebar">
    <h2 style="text-align: center; position: relative; top: 75px;"><a href="#"></a></h2>
    <hr style="position: relative; top:120px; border: solid 1px black;">
    <ul class="nav_mobile">
      <li><a href="#">SEARCH</a></li>
      <li><a href="${cPath}/exhibition/list.do">MEET OTHERS</a></li>
      <li><a href="#">MY EXHIBITION</a></li>
      <li><a href="${cPath}/myPageMain.do">MY PAGE</a></li>
      <li><a href="#">Q & A</a></li>
      <li><a href="${cPath}/noticeList.do">NOTICE</a></li>
    </ul>
   </div>
   </div>     
      </div>
         
      <div class="logoBtn"><a href="${cPath}/index.do" class="image-link" style="opacity:0;">메인</a></div>
      <div class="logoBtn2"></div>     
      <div class="topMenuRight">
         <div class="searchbarBtn">
               <input type="text" class="searchbar" name="searchbar">
         </div>
         <div class="saveBtn"></div>
         <div class="mypageBtn"  ><a href="${cPath}/myPageMain.do" class="image-link" style="opacity:0;">a</a></div>
      </div>
   </div>
</div>
   

<div class="box2">
   <div class="headerBox">
   </div>

   </div>
   
   
   
   
      
<section>
   
<div class="box">
 <div id="columns">
  </div>
</div>

</section>


</body>
</html>