<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<%@ include file="../include/include.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
$(function(){
    var lastScrollTop = 0, delta = 15;
    $(window).scroll(function(event){
       var st = $(this).scrollTop();
       
        if(Math.abs(lastScrollTop - st) <= delta)
          return; // 스크롤값을 받아서 리턴한다.
        if ((st > lastScrollTop) && (lastScrollTop>0)) {
       // downscroll code
      $("#pageHeader").css("top","-550px"); // 스크롤을 내렸을때 #header의 CSS 속성중 top 값을 -50px로 변경한다.
  
   } else {
      // upscroll code
      $("#pageHeader").css("top","0px"); // 스크롤을 올렸을때 #header의 CSS 속성중 top 값을 0px로 변경한다.
   }
       lastScrollTop = st;
    });
});

$(function() {
    $(window).scroll(function() {
        if ($(this).scrollTop() > 500) { // 스크롤 위치에 따라 화면에서 맨위로 올라가는 버튼이 나타나고, 사라지도록 설정
            $('#MOVE_TOP_BTN').fadeIn();
        } else {
            $('#MOVE_TOP_BTN').fadeOut();
        }
    });
  
    $("#MOVE_TOP_BTN").click(function() {//버튼 클릭 이벤트
        $('html, body').animate({ // animation을 걸어서 화면 맨위로 이동하도록 설정
            scrollTop : 0
        }, 400);
        return false;
    });
});


// 로그아웃
$(document).ready(function(){
	$("#logout").click(function(){
		location.href="${pageContext.request.contextPath}/member/logout";
	});
});

</script>
<style>
a#MOVE_TOP_BTN {
    position: fixed;/*화면에 고정 */
    right: 2%;
    bottom: 50px;/*버튼 위치 설정*/
    display: none;/*기본 값 화면에서 숨김 */
}
img {

  width: 50px;
  height: 50px;
  
  }
}

</style>
</head>
<!-- 가로 스크롤 삭제 : style="overflow-x: hidden" -->
<body style="overflow-x: hidden">

  <header id="pageHeader">
     <!-- Header -->
   <%@ include file="../include/pageHeader.jsp" %>
  </header>
<H2>공지 사항</H2>
  <article id="mainArticle">
    <table cellpadding="0" cellspacing="0" style="text-align:center;" width="100%">
		<tr height="50">
			<th class="list1" width="5%">번호</th>
			<th class="list1" width="60%">제목</th>
			<th class="list1" width="15%">날짜</th>
			<th class="list1" width="10%">조회수</th>
		</tr>
		<c:forEach var="list" items="${noticlist}">
		<tr>
		<td>${list.notic_no }</td>
		<td><a href="notic/detail/${list.notic_no}">${list.notic_title }</a></td>
		<td>${list.notic_regdate }</td>
		<td>${list.notic_viewcnt }</td>
		</tr>
		</c:forEach>
	</table>
	<form action=notic class="noticsearch">
					<select name="searchOption" id="searchOption">
						<option value="ALL" <c:out value="${map.searchOption=='ALL'?'selected':''}"/> >제목+내용</option>
						<option value="NOTIC_CONTENT" <c:out value="${map.searchOption=='NOTIC_CONTENT'?'selected':''}"/> >제목</option>
						<option value="내용" <c:out value="${map.searchOption=='내용'?'selected':''}"/> >내용</option> <!-- 내용값 DB에 없어 임시  -->
					</select> 
				<input type="text" name="keyword" placeholder="검색어 입력" id="keyword" value="${keyword}">
				<input type="hidden" name="search" id="search" value="s"/>
				<input type="submit" class="check2" value="조회"/>
			</form>	
  </article>
  
  <nav id="mainNav">
     <!-- Nav -->
       <%@ include file="../include/mainNav.jsp" %>
  </nav>
  
  <div id="siteAds">
        <!-- Ads -->
        <%@ include file="../include/siteAds.jsp" %>
  </div>
        
   <a id="MOVE_TOP_BTN" href="#" ><!-- 상단으로 올리는 버튼  -->
   <img class="icon_img" src="resources/images/up_icon.png"/>
   </a>
  <footer id="pageFooter">
        <!-- Footer -->
      <%@ include file="../include/pageFooter.jsp" %>
  
  </footer>
   


</body>
</html>