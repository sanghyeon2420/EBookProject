<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="../../include/include.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>writerIntro</title>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="resources/js/bootstrap.min.js"></script>

<link rel="stylesheet" type="text/css" href="resources/css/bootstrap.min.css">
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
	
	$("#hits").click(function(){
		var writer_no=${dto.writer_no};
/* 		console.log(writer_no);
 */		
 		$.ajax({
			type:"post", // 전송방식
			url:"${pageContext.request.contextPath}/writer/hits", // 요청주소
			data:{"writer_no":writer_no}, // 보내줄 데이터
			success: function(data){ // 비동기 통신 성공시, data ->  리턴받은 데이터
					console.log(data); // f12 개발자도구 - > console창에 data가 출력됨
					document.getElementById("span_hits").innerHTML=data;
			}
			
		}); 
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
</script>
<style>
#mainArticle {
	margin:0;
	padding:0;
	font-family: 'Jua', sans-serif;
}
.writerintro {
	 align-items: center;
}
.writerpic {
	margin: 65px 60px 30px 60px;
	display: flex;
	justify-content: center;
}
.writerpic img {
	width: 22vw;
	height: 38vh;
	margin: 10px 10px;
	padding: 0;
}
#mainArticle .writerid {
	clear: both;
	margin: 0 0 60px 0;
    text-align: center;
}
.back {
	background-color: #d9e7ff;
}
.text {
	margin: 0;
	padding: 0;
	height: 8vh;
}
.text p {
	clear: both;
	margin: 20px 20px;
	height: 3vh;
	font-size: 18px;
	align-items: center;
}
#mainArticle .writerbooklist {
	height: 35vh;
	display: flex;
	margin: 0;
	clear: both;
	justify-content: space-around;
	
	flex-direction: row;
	flex-wrap: wrap;
	overflow: auto;
	flex-flow: row nowrap;
}
#mainArticle .writerbookcover {
	width: 14vw;
	height: 22vh;
	padding: 0;
	margin: 0;
}
#mainArticle .writerbookcover img{
	width: 12vw;
	height: 22vh;
	display: block;
	margin: auto;
}
.writerbookcover a {
	margin: 10px 0;
	font-weight: 400;
	text-align: center;
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
     <%-- ${writer.w_name}작가님의 페이지 --%>
     <div class="writerintro">
     	<div class="writerpic">
     		<img src="resources/images/writer/${dto.imagefile_no }.png" alt="작가 이미지 불러옵니다.">
     	</div>
     	<div class="writerid">
     		<h3><strong style=font-size:25px;>${dto.w_name }</strong>님<strong>&nbsp;&nbsp;&nbsp;추천수 : </strong> <span id="span_hits">${dto.w_hits }</span>&nbsp;&nbsp;&nbsp; <button id="hits" name="hits">추천</button></h3>
     	</div>
     </div>
     <div class="back">
     	<div class="text">
     		<p><strong>${dto.w_name }</strong>님의 주요 연재 소설</p>
     	</div>
     	<div class="writerbooklist">
     		<c:forEach var="list" items="${list }">
	 		<div class="writerbookcover">
				<div class="cover">
					<img src="resources/images/${list.b_category }/${list.imagefileName }" alt="북커버 이미지를 불러옵니다." /><br>
					<a href="/EBookProject/book/detail?idx=${list.ebook_no }"><h4> <b>${list.b_name}</b> </h4>
				</div>
			</div>
			</c:forEach>
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