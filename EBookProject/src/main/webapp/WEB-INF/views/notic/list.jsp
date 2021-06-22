<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link href="resources/css/layout.css" rel="stylesheet">
<link href="resources/css/servPage.css" rel="stylesheet">
<%@ include file="../../include/include.jsp" %>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="resources/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="resources/css/bootstrap.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지사항</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
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

	 table {
    width: 100%;
    border-top: 1px solid #444444;
    border-collapse: collapse;
  	text-align: center;

  }
  th, td {
    border-bottom: 1px solid #444444;
    padding: 10px;
	font-family: 'Jua', sans-serif;
	font-size: 20px;
	text-align: center;
  }
  

</style>
</head>
<!-- 가로 스크롤 삭제 : style="overflow-x: hidden" -->
<body style="overflow-x: hidden">

  <header id="pageHeader">
     <!-- Header -->
   <%@ include file="../../include/pageHeader.jsp" %>
   <input type="hidden" id="curPage" value="${curPage }"/>
  </header>

    <article id="mainArticle">

			<div align="center">
			<!-- 검색했을 때 카운트-->
				<c:if test="${map.search eq 's'}">
					<c:choose>
						<c:when test="${map.count == 0 }">
						<br/><span style="font-family:'돋움';">게시글이 없습니다. 검색을 다시 확인해주세요.&nbsp;</span>
						</c:when>
						<c:otherwise>
						<span style="font-family:'돋움';">${map.count}개의 게시물이 있습니다.&nbsp;</span>
						</c:otherwise>
					</c:choose>
				</c:if>
			<!-- 관리자일 때만 쓰기버튼 활성화-->
				<c:if test="${userid eq 'admin'}">
					<button type="button" class="text" onClick="location.href='write'">글쓰기</button>
				</c:if>
			<br/>
			<table>
				<tr>
					<th colspan="4" style="text-align: left; font-size: 25px;"> 공지사항</th>
				<tr height="50" style="background-color: #5FD184;">
					<th class="list1" width="10%">번호</th>
					<th class="list1" width="60%">제목</th>
					<th class="list1" width="20%">작성일</th>
					<th class="list1" width="9%">조회수</th>
				</tr>
				<c:forEach begin="0" end="${(fn:length(map.list))}" var="i">
					<c:set var="row" value="${map.list[i]}" />
						<input type="hidden" id="notic_no" name="notic_no" value="${row.notic_no}"/>
					<c:choose>
					<%-- 검색결과가 있을 때 --%>
					<c:when test="${not empty row}">
					<tr>
						<td class="list2">${row.notic_no}</td>
						<td  class="list2" style="text-align:left;"><a href="view?notic_no=${row.notic_no}">${row.notic_title}</a>
					<fmt:formatDate value="${row.notic_regdate}" pattern="yyyyMMdd" var="regDate"/>
						<td class="list2">${row.notic_regdate}</td>
						<td class="list2">${row.notic_viewCnt}</td>
					</tr>
					</c:when>
					<%-- 검색결과가 없을 떄 --%>
					<c:when test="${map.count == 0}">
					<tr style="text-align:center;"><td colspan='5' size="30px">
					<b style="color: red; font-size:30px;">'${keyword}'</b> 에 대한 검색결과가 없습니다.
					</td></tr>
					</c:when>
					</c:choose>
				</c:forEach>
			</table>
			<br />
			<br />
			<!-- 페이지 네비게이션 출력 -->
				<c:if test="${map.pager.curBlock > 1}">
					<a href="notic?curPage=1
							&searchOption=${searchOption}&keyword=${keyword}
							&search=${search}">[처음]</a>
				</c:if>
				<c:if test="${map.pager.curBlock > 1}">
					<a href="notic?curPage=${map.pager.prevPage}
							&searchOption=${searchOption}&keyword=${keyword}
							&search=${search}">[이전]</a>
				</c:if>

				<c:forEach var="num" begin="${map.pager.blockBegin}" 
							end="${map.pager.blockEnd}">
					<c:choose>
						<c:when test="${num == map.pager.curPage}">
							<!-- 현재 페이지인 경우 하이퍼링크 제거 -->
							<span style="color: red;">${num}</span>
						</c:when>
						
						<c:otherwise>
							<a href="notic?curPage=${num}
							&searchOption=${searchOption}&keyword=${keyword}
							&search=${search}">${num}</a>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			<!-- 검색 조건 뷰 -->
		</div>
  </article>
  <nav id="mainNav">
     <!-- Nav -->
       <%@ include file="../../include/mainNav.jsp" %>
  </nav>
  
  <div id="siteAds">
        <!-- Ads -->
        <%@ include file="../../include/siteAds.jsp" %>
  </div>
        
  <footer id="pageFooter">
        <!-- Footer -->
      <%@ include file="../../include/pageFooter.jsp" %>
  
  </footer>
   


</body>
</html>