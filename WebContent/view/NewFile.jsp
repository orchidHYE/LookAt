<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<link href="<%=request.getContextPath() %>../css/s.css" rel="stylesheet" >
</head>




<body>
<script src="reviewList.js"></script>








<form action="/reviewList.do" method="post" enctype="multipart/form-data">


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
      <li><a href="#">MEET OTHERS</a></li>
      <li><a href="#">MY EXHIBITION</a></li>
      <li><a href="#">MY PAGE</a></li>
      <li><a href="#">Q & A</a></li>
      <li><a href="#">NOTICE</a></li>
    </ul>
   </div>
   </div>
      
      </div>
         
      <div class="logoBtn"></div>
      <div class="logoBtn2"></div>
      
      <div class="topMenuRight">
         <div class="searchbarBtn">
            <form>
               <input type="text" class="searchbar" name="searchbar">
            </form>
         </div>
         <div class="saveBtn"></div>
         <div class="mypageBtn"></div>
      </div>
   </div>
</div>
   

<div class="box2">
   <div class="headerBox">
      <h2 class="header">MEET OTHERS</h2>
   </div>

   </div>
   
   
   
   
   
   
   
   

   
   
   
   
      
<section>
   
<div class="box">
 <div id="columns">
  <figure>
    <div id="contents"><img src="../img/img1.jpg"></div>
 
    <div id="popup">
       <div id="popmenu">
          <div class="userpng"><img src="../css/img/user.png" ></div>
       <h3 class="userId">UserId001</h3>
          <div class="popimg"><img src="../img/img1.jpg"></div>
          <div class="hashtag"><h5>#즐거운 전시회</h5></div>
          <div class="popex"><img src="../img/poster1.png"></div>
          <div class="popEx">
          <div class="popex2"><h5>VINCENT VAN GOGH</h5></div>
          <div class="popex3"><h6>가나다라마바사아자차카타파하 가나다라마바사아자차카타파하 가나다라마바사아자차카타파하 </h6></div>
       </div>
       </div>
   </div>
    
    <!--contents-->


  <figcaption>Cinderella wearing European fashion of the mid-1860’s</figcaption>
  </figure>
  
  
  
  <figure>
  <img src="../img/img2.jpg">
  <figcaption>Rapunzel, clothed in 1820’s period fashion</figcaption>
  </figure>
  
  <figure>
  <img src="../img/img4.jpg">
  <figcaption>Belle, based on 1770’s French court fashion</figcaption>
  </figure>
  
  <figure>
  <img src="../img/img4.jpg">
  <figcaption>Mulan, based on the Ming Dynasty period</figcaption>
  </figure>
  
  <figure>
  <img src="../img/img5.PNG">
  <figcaption>Sleeping Beauty, based on European fashions in 1485</figcaption>
  </figure>
  
   <figure>
   <img src="../img/img6.PNG">
  <figcaption>Pocahontas based on 17th century Powhatan costume</figcaption>
  </figure>
  
  <figure>
  <img src="../img/img3.jpg">
  <figcaption>Sleeping Beauty, based on European fashions in 1485</figcaption>
  </figure>
  
  <figure>
  <img src="../img/img1.jpg">
  <figcaption>Cinderella wearing European fashion of the mid-1860’s</figcaption>
  </figure>
  
 
  </div>
</div>

</section>
</form>


</body>
</html>