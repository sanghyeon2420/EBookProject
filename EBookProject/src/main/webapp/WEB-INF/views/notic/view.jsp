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

</script>
<style>
a#MOVE_TOP_BTN {
    position: fixed;/*화면에 고정 */
    right: 2%;
    bottom: 50px;/*버튼 위치 설정*/
    display: none;/*기본 값 화면에서 숨김 */
}

.icon_img img{
  width:50px;
  height:50px;
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
  
  #text-left {
  	text-align: left;
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
		<input type="hidden" name="notic_no" value="${noticdto.notic_no}">
		<table>
			<tr>
			<td style="background-color: #5FD184;">제목</td>
			<td>${noticdto.notic_title}</td>
			<td style="background-color: #5FD184;">작성일</td>
			<td >
			${noticdto.notic_regdate} </td> 
			</tr>
			<tr>
			<td colspan='6' style="background-color: #5FD184;"> 내용 </td>
			<tr valign="top">
			<td colspan='6' id="text-left">
			<br>
			${noticdto.notic_content}
			<br><br>
			</td>
			</tr>
		
			

			</td>
			</tr>
		</table>

<%-- 	<div style="margin-top: 10px; margin-bottom:20px;">
	<div align="center" style="float:left; ">
			<c:if test="${map.previousB != null}">
			<button class="previous" onClick="location.href='view?notic_no=${map.previousB.notic_no}&show=Y'">이전글</button>
			</c:if>
			<c:if test="${map.nextB != null}">
			<button class="next" onClick="location.href='view?notic_no=${map.nextB.notic_no}&show=Y'">다음글</button>
			</c:if>
			&nbsp;&nbsp;&nbsp;게시글 번호 : ${notic.notic_no}
		</div> --%>
 
		
		<button type="button" id="list_btn" onClick="location.href='list'">목록</button>
		</div>
		</div>
	
	
	<%-- <br/><br/><br/>
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
	</div> --%>
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