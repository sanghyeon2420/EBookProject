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

// 우측 클릭 방지 
document.onmousedown=disableclick;
status="마우스 우클릭 하지 말아주세요!!"; 

function disableclick(event){ 
    if (event.button==2) { 
        alert(status); 
        return false; 
    } 
}
//F12 버튼 방지 
/* $(document).ready(function(){ 
$(document).bind('keydown',function(e){ 
    if ( e.keyCode == 123 ) { //F12
        e.preventDefault(); 
        e.returnValue = false;
        alert("F12버튼 누르지 말아주세요!!")
    }
});
}); */
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
<body style="overflow-x: hidden" oncontextmenu="return false" onselectstart="return false" ondragstart="return false" >

  <header id="pageHeader">
     <!-- Header -->
   <%@ include file="../include/pageHeader.jsp" %>
  </header>

  <article id="mainArticle">
     <!-- Body -->
     <%@ include file="../include/mainArticle.jsp" %>
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