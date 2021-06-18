<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="../../include/include.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>pageMember.jsp</title>
<script>
$(function(){ // 헤더가리기
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
// scroll_top_btn script 
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
	
	$("#change").click(function(){
		var userpw=prompt("비밀번호를 입력해주세요","");
		console.log(userpw);
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
<style type="text/css">
	.userProfiles {
  		width: 55vw;
    	height: 70vh;
        margin: 0;
        display: flex;
        justify-content: center;
    }
    .profile {
    	width: 45vw;
    	height: 65vh;
    	border-radius: 50px;
    	background-color: beige;
    }

    .profileHeader {
         width: 44vw;
         height: 7vh;
         display: flex;
         align-items: center;
         justify-content: center;
     }

     .profileHeader span {
         width: 7vw;
         height: 4vh;
         text-align: center;
         font-size: 1.4vw;
     }

     .profileBody {
         width: 41vw;
         height: 55vh;
         display: flex;
         margin: 0;
         flex-direction: column;
         justify-content: space-around;
     }

     .profileBody li {
         width: 40vw;
         height: 5vh;
         border: 1px solid #17232e98;
         display: flex;
         list-style: none;
         font-size: medium;
         align-items: center;
         border-radius: 50px;
     }

     .profileBody li>a {
         width: 6vw;
         height: 5vh;
         display: flex;
         color: black;
         align-items: center;
         border-radius: 50px;
         justify-content: center;
         text-decoration-line: none;
     }

     .profileBody li>a:hover {
         background-color: #DEEDF0;
     }
   
</style>
</head>
<body>
	<header id="pageHeader">
     <!-- Header -->
   <%@ include file="../../include/pageHeader.jsp" %>
  </header>

  <article id="mainArticle">
     <!-- Body -->
     <div class="userProfiles">
            <div class="profile">
                <div class="profileHeader">
                    <span>회원정보</span>
                </div>
                <ul class="profileBody">
                    <li>&nbsp;아이디 :${member.userid}</li>
                    <li>&nbsp;이메일 :${member.email}</li>
                    <li>&nbsp;닉네임 :${member.nickname}</li>
                    <li>&nbsp;생년월일 :${member.birthdate}</li>
                    <li>&nbsp;내 쿠키 정보 :&nbsp;${member.cash}&nbsp;<button type="button" onclick="#">충전</button></li>
                    <li><a href="#">내가 봐온 소설</a></li>
                    <li><a href="#">신규 소설등록</a></li>
                    <li><a href="#" id="change">회원 정보 수정</a></li> <!-- 작가등록 포함 -->
                    
                    
                </ul>
            </div>
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