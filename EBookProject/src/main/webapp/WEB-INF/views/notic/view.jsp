<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>
<%@ include file="../../include/include.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
//게시물 삭제 확인
function deleteB() {
	swal({
		 icon: "warning",
		 text: "정말 게시글을 삭제하시겠습니까?",
		 closeOnClickOutside : false,
		 closeOnEsc : false, 
		 buttons: ["돌아가기", "삭제하기"],
		}).then(function(isConfirm) {
		  if (isConfirm) {
		    swal('삭제 완료!','게시글을 삭제했습니다.','success').then(function(isConfirm)
		   		{
					location.href='delete?notic_no='+${notic.notic_no};
		    	});
		  }
		})
}
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


</style>
</head>
<!-- 가로 스크롤 삭제 : style="overflow-x: hidden" -->
<body style="overflow-x: hidden">

  <header id="pageHeader">
     <!-- Header -->
   <%@ include file="../../include/pageHeader.jsp" %>
  </header>
  <article id="mainArticle">
 <div style="width:800px;">
		
		<script>
		$("#list_btn").click(function(){
			self.location="view?notic_no="
					+ "searchOption=${searchOption}&keyword=${keyword}"
					+ "&search=${search}&curPage=${curPage}";
		});
		</script>
		
		<br/><br/>
	<form>
		<!-- 수정,삭제에 필요한 글번호를 hidden 태그에 저장 -->
		<input type="hidden" name="notic_no" value="${notic.notic_no}">
		<table border="1" bordercolor="#E1DCDC" class="view" cellpadding="0" cellspacing="0" width="100%">
			<tr>
			<td width="70">제목</td>
			<td colspan='3' align="left">${notic.notic_title}</td>
			</tr>
				
			<tr>
			<td>작성일</td>
			<td colspan='3' align="left">
			<div style="width:150px;float:left;">
			${notic.regdate}  
			</div>
			<div>
			|&nbsp;&nbsp;&nbsp;조회수 : ${notic.notic_viewCnt}
			</div>
			</td>
			</tr>
				
			<tr valign="top">
			<td colspan='4' height="500px">${notic.notic_content}</td>
			</tr>
		</table>
	</form>
	<div style="margin-top: 10px; margin-bottom:20px;">
	<div align="center" style="float:left; ">
			<c:if test="${map.previousB != null}">
			<button class="previous" onClick="location.href='view?notic_no=${map.previousB.notic_no}&show=Y'">이전글</button>
			</c:if>
			<c:if test="${map.nextB != null}">
			<button class="next" onClick="location.href='view?notic_no=${map.nextB.notic_no}&show=Y'">다음글</button>
			</c:if>
			&nbsp;&nbsp;&nbsp;게시글 번호 : ${notic.notic_no}
		</div>
 
		<div style="float:right;">
		<!-- 관리자만 공지 -->
		<c:if test="${member.userid eq 'Admin'}">
			<a href="write">글쓰기</a>&nbsp;&nbsp;&nbsp;
		</c:if>
		<!-- 관리자만 수정,삭제 버튼 표시 -->
		<c:if test="${member.userid eq 'Admin'}">
			<a href="updateWrite">수정</a>&nbsp;&nbsp;&nbsp;
			<a href="#" onClick="deleteB()">삭제</a>&nbsp;&nbsp;&nbsp;
		</c:if>
		
		<button type="button" id="list_btn" onClick="location.href='notic'">목록</button>
		</div>
		</div>
		</div>
	</div>
	
	
	<br/><br/><br/>
	<!-- 현재 글을 기준으로 이전글,다음글 리스트 -->
	<div align="center">
		<table class="simpleView" width="800">
			<c:if test="${map.previousB != null}">
			<tr class="a">
				<td onClick="location.href='view?notic_no=${map.previousB.notic_no}&show=Y'"
				style="cursor: pointer">이전글</td>
				<td onClick="location.href='view?notic_no=${map.previousB.notic_no}&show=Y'"
				style="cursor: pointer;width:400px;">${map.previousB.notic_title}</td>
				<td class="tdS">${map.previousB.notic_regdate}</td>
			</tr>
			</c:if>
			<c:if test="${map.nextB != null}">
			<tr class="b">
				<td onClick="location.href='view?notic_no=${map.nextB.notic_no}&show=Y'"
				style="cursor: pointer">다음글</td>
				<td  onClick="location.href='view?notic_no=${map.nextB.notic_no}&show=Y'" 
				style="cursor: pointer;width:400px;">${map.nextB.notic_title}</td>
				<td class="tdS">${map.nextB.writer}</td><td class="tdS">${map.nextB.regdate}</td>
			</tr>
			</c:if>
		</table>
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
        
   <a id="MOVE_TOP_BTN" href="#" ><!-- 상단으로 올리는 버튼  -->
   <img class="icon_img" src="resources/images/up_icon.png"/>
   </a>
  <footer id="pageFooter">
        <!-- Footer -->
      <%@ include file="../../include/pageFooter.jsp" %>
  
  </footer>
   


</body>
</html>