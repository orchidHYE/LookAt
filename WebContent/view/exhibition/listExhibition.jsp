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
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
$(document).ready(function() {
  var page = 1; // 현재 페이지를 나타내는 변수

  // "더 보기" 버튼 클릭 이벤트 처리
  $("#moreButton").click(function() {
    // Ajax 요청 보내기
    $.ajax({
      url: "${exhibitionPage.endPage}", // 서버에서 게시물 데이터를 추가로 가져올 엔드포인트 주소
      method: "GET",
      data: "${PageNo}", // 현재 페이지 정보를 서버에 전달
      success: function(data) {
        // 서버로부터 받은 데이터를 처리하여 HTML로 생성
        var html = "";
        for (var i = 0; i < data.length; i++) {
          var exhibition = data[i];
          html += "<tr>";
          html += "<td><a href='read.do?no='${PageNo}''>";
          html += "<img src="<%=request.getContextPath()%>/img/exhibition/' ''>";
          html += "</a></td>";
          html += "</tr>";
        }

        // 생성된 HTML을 게시물 컨테이너에 추가
        $("#exhibitionContainer").append(html);

        // 현재 페이지 값 증가
        page++;
      },
      error: function() {
        alert("더 보기를 불러오는 데 실패했습니다.");
      }
    });
  });
});
</script>
</head>
<body>

<br/>
${pageNo}

<div id="exhibitionContainer">
<c:forEach var="item" items="${exhibitionPage.content}">
  <c:set var="_count" value="${_count+1}" />
	  <tr>
	    <td>
	      <a href="read.do?no=${item.exhibition_no}"><img src="<%=request.getContextPath() %>/img/exhibition/${item.thumbnail}"/><a></a>
	    </td>   
	  </tr>
  <c:if test="${_count % 3 == 0}">
    	<br>
  </c:if>
  <c:if test="${_count == 9}">
    <div>  
			<!-- "더 보기" 버튼 -->
			<button id="moreButton"><img src="<%=request.getContextPath() %>/img/etc/MORE.png"/></button>
    </div>
  </c:if>
</c:forEach>
</div>


	
	
 		
	<%-- <div>총 ${exhibitionPage.total}건의 검색결과가 있습니다.</div>
	<c:forEach var="result" items="${exhibitionPage.content}">
		<a href="read.do?no=${result.exhibition_no}"><img src="<%=request.getContextPath() %>/img/exhibition/${result.thumbnail}"></a>
	</c:forEach>		 --%>
 	<a href="write.do" class="btn btn-secondary btn float-right">글쓰기</a><br/>
 	
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