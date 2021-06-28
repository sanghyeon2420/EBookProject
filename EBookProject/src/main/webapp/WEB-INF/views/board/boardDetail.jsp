<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>
<%@ include file="../../include/include.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="resources/css/servPage.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.6.3/css/all.css"
	crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="resources/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="resources/css/bootstrap.min.css">
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

function deleteCheck(boardno){
	var check=confirm("정말로 삭제하시겠습니까?");
	console.log(boardno);
	if(check){
		location.href="${pageContext.request.contextPath}/board/deleteBoard?board_no="+boardno;
	}
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
  </header>
  <article id="mainArticle">
	
		<br/><br/>
		<!-- 수정,삭제에 필요한 글번호를 hidden 태그에 저장 -->
		<input type="hidden" name="notic_no" value="${boarddto.board_no }">
		<table>
			<tr>
			<td style="background-color: #5FD184;">제목</td>
			<td >${boarddto.b_title }</td>
			<td style="background-color: #5FD184;">작성자명</td>
			 <td>${boarddto.nickname }(${boarddto.user_ip })
			</td>
			</tr>
			<tr>
			<td colspan='4' style="background-color: #5FD184;"> 내용 </td>
			<tr valign="top">
			<td colspan='4'>
			<br>
			${boarddto.b_content }
			<br><br>
			</td>
			</tr>
			<tr>
			<td style="background-color: #5FD184;">작성일</td>
			<td align="left">
			${boarddto.b_write_date } </td> 
			<td style="background-color: #5FD184;">조회수</td>
			 <td>${boarddto.board_get}
			</td>
		</table>	
		<button type="button" id="list_btn" onClick="location.href='list'">목록</button>
		<c:if test="${sessionScope.member.nickname eq boarddto.nickname }">
		<button type="button" onClick="location.href='/EBookProject/board/boardUpdate?board_no=${boarddto.board_no }'">수정</button>
		<button type="button" onClick="javascript:deleteCheck(${boarddto.board_no })">삭제</button>
		</c:if>	
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