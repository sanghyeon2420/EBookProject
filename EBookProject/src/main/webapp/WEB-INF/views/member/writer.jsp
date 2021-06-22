<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="../../include/include.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>pageWriter.jsp</title>
<script>
//로그아웃
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
	.writer {
      margin: 5px;
      font-size: 1vw;
      margin-left: 2vw;
    }

    .card {
      width: 55vw;
      height: 60vh;
      display: flex;
      flex-flow: column;
    }

    .card_header {
      width: 55vw;
      height: 6vh;
      display: flex;
      color: azure;
      align-items: center;
      justify-content: center;
      background-color: black;
      border-radius: 50px 50px 0 0;
    }

    .card_body {
      width: 55vw;
      height: 8vh;
      display: flex;
      color: black;
      margin-bottom: 10px;
      align-items: flex-start;
      justify-content: center;
      border-radius: 0 0 50px 50px;
      background-color: antiquewhite;
      overflow: auto;
      -ms-overflow-style: none;
    }
    
    .card_body::-webkit-scrollbar {
      display: none;
    }
    
    /* scroll-top-btn css */      
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
<body>
	
  <header id="pageHeader">
     <!-- Header -->
   <%@ include file="../../include/pageHeader.jsp" %>
  </header>

  <article id="mainArticle">
     <!-- Body -->
     <!-- 작가페이지  -->
     <div class="writer">
      ${writer.w_name}작가님의 페이지
      &nbsp;
      종합 조회수 :
      <i class="fas fa-check-circle"></i>
      5
      &nbsp;
      종합 추천수 :
      <i class="far fa-heart"></i>
      5

    </div>
    <div class="card">
      <!-- card_header -->
      <div class="card_header">
        <span>
         ${writer.w_name}작가님의 연재중인 소설
        </span>
      </div>

      <!-- card_body -->
      <div class="card_body">
        <span>
          <b>연재중인 소설이 없습니다.</b>
        </span>
      </div>

      <!-- card_header -->
      <div class="card_header">
        <span>
          ${writer.w_name}작가님의 완결된 소설
        </span>
      </div>

      <!-- card_body -->
      <div class="card_body">
        <span>
          <b>완결된 소설이 없습니다.</b>
        </span>
      </div>

      <!-- card_header -->
      <div class="card_header">
        <span>
         ${writer.w_name}작가님이 눈여겨보는 소설
        </span>
      </div>

      <!-- card_body -->
      <div class="card_body">
        <span>
          <b>보고계신 소설이 없습니다.</b>
        </span>
      </div>

      <!-- card_header -->
      <div class="card_header">
        <span>
          	베스트 추천도서(추천)
        </span>
      </div>

      <!-- card_body -->
      <div class="card_body">
        <span>
          <b>베스트 추천의 도서들</b>
        </span>
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