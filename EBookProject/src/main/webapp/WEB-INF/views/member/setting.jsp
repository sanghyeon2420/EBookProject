<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="../../include/include.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원정보</title>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="resources/js/bootstrap.min.js"></script>
<link href="resources/css/modal.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="resources/css/bootstrap.min.css">
<script>
/* $(function(){ // 헤더가리기
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
}); */

// 로그아웃
$(document).ready(function(){
	$("#logout").click(function(){
		location.href="${pageContext.request.contextPath}/member/logout";
	});
	
	$("#change").click(function(){
		var userpw = $("#userpw").val();
		if(userpw == ${member.userpw}){
			alert("비밀번호맞음");
		}else{
			alert("틀린 비밀번호 입니다 ");
			return false;
		}
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
function cash(){
	location.href="/EBookProject/pay/productbuy";
}
</script>
<style type="text/css">
.userProfiles {
	width: 100%;
	height: 100%;
	display: flex;
	justify-content: center;
}

.profile {
	width: 70%;
}

.profileHeader {
	
}

.line-box {
	position: relative;
	width: 100%;
	height: 2px;
	background: #BCBCBC;
}

.line {
	position: absolute;
	width: 0%;
	height: 2px;
	top: 0px;
	left: 50%;
	transform: translateX(-50%);
	background: #8BC34A;
	transition: ease .6s;
}

ul.profileBody {
	padding: 0;
}

.profileBody li{
    width: 55%;
    height: 5vh;
    display: flex;
    padding: 10px;
	list-style: none;
    align-items: center;
}

.bodyline {
	display: flex;
}

.first {
    width: 30%;
    height: 5vh;
    display: flex;
    padding: 10px;
    align-items: center;
    justify-content: center;
}

.ct {
	width:3%;
	height: 5vh;
	display: flex;
	align-items: center;
	
}

.ctn {
	width: 2px;
	height: 3vh;
    display: flex;
	background: #BCBCBC;
    justify-content: center;
}

.bt {
	width: 12%;
	height: 5vh;
	display: flex;
	align-items: center;
	justify-content: center;
}

.btn-secondary {
	width: 65%;
	height: 4vh;
}

.footerline {
	width: 100%;
	display: flex;
	justify-content: space-around;
}

.footerline a {
	margin: 25px 15px;
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
            <!-- 회원 정보 헤더 -->
                <div class="profileHeader">
                    <h1>회원정보</h1>
					<br>                    
                    <h5>회원께서 가입하신 북 하우스의 회원정보입니다.</h5>
					<br>                    
					<h3 style="margin-bottom:20px;">필수 회원 정보</h3>                    
                </div>
                <!-- 분기선 -->
                <div class="line-box">
                	<div class="line"></div>
                </div>
                <!-- 회원 정보 -->
                <ul class="profileBody">
                	<div class="bodyline">
                    	<div class="first">아이디 </div>
                    	<div class="ct">
                    		<div class="ctn"></div>
                    	</div>
                    	<li>${member.userid}</li>
                	</div>
                	<div class="bodyline">
                    	<div class="first">이메일 </div>
                    	<div class="ct">
                    		<div class="ctn"></div>
                    	</div>
                    	<li>${member.email}</li>
                	</div>
                	<div class="bodyline">
                    	<div class="first">닉네임 </div>
                    	<div class="ct">
                    		<div class="ctn"></div>
                    	</div>
                    	<li>${member.nickname}</li>
                	</div>
                	<div class="bodyline">
                    	<div class="first">생년월일 </div>
                    	<div class="ct">
                    		<div class="ctn"></div>
                    	</div>
                    	<li><fmt:formatDate value="${member.birthdate}" pattern="yyyy년MM월dd일"/></li>
                	</div>
                	<div class="bodyline">
                    	<div class="first">내 쿠키 정보 </div>
                    	<div class="ct">
                    		<div class="ctn"></div>
                    	</div>
                    	<li>
                    		${member.cash}                    	
                    	</li>
                    	<div class="bt">
 	                   		<button type="button" onclick="javascript:cash()" class="btn btn-secondary">충전</button>
                    	</div>
                	</div>
                    <!-- 분기선 -->
	                <div class="line-box">
	                	<div class="line"></div>
	                </div>
                    <!-- 하단 버튼 -->
                    <div class="footerline">
	                    <a href="${pageContext.request.contextPath}/writer/insertBook" type="button" class="btn btn-primary">신규 소설등록</a>
	                  <a href="#open${member.user_no }" type="button" class="btn btn-primary">수정</a>
				         <div class="white_content" id="open${member.user_no }">
				            <div>
				            <br>
				            <p>
				           	  비밀번호를 입럭해주세요 <br>
				             <input type="password" id="userpw" name="userpw">
				            <p><br>
				       		 <a href="update" id="change" type="button" class="btn btn-primary">
				       		확인</a>
				       	
							 <a href="#close" type="button" class="btn btn-primary">닫기</a>
				           </div>
			        	 </div> 
                    </div>
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
