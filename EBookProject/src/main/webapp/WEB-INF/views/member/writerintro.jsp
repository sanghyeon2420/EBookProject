<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="../../include/include.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>writerIntro</title>
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
</script>
<style>
#mainArticle {
	margin:0;
	padding:0;
}
.writerintro {
	 align-items: center;
}
#mainArticle .writerpic {
	margin: 20px 20px;
	float: left;
	
}
#mainArticle .wrtierpic img {
	width: 15vw;
	height: 17vh;
	margin: 0;
	padding: 0;
}
#mainArticle .writerid {
	float: left;
	margin: 20px 20px;
	
}
#mainArticle .writerbooklist {
	height: 50vh;
	display: flex;
	margin: 0;
	clear: both;
	justify-content: space-around;
	
	flex-direction: row;
	flex-wrap: wrap;
	overflow: auto;
	-ms-overflow-style: none;
	flex-flow: row nowrap;
}
#mainArticle .writerbookcover {
	width: 14vw;
	height: 25vh;
	padding: 0;
	margin: 0;
}
#mainArticle .writerbookcover img{
	width: 14vw;
	height: 22vh;
	display: block;
	margin: auto;
}
.writerbookcover p {
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
     		<p>${dto.w_name }작가님</p>
     		<p>${dto.w_name }작가님의 주요 연재 </p>
     		<p>${dto.w_name }작가님의 주요 연재 소설</p>
     	</div>
     	</div>
     	<br>
     	<div class="writerbooklist">
     		<c:forEach var="list" items="${list }">
	 	<div class="writerbookcover">
			<div class="cover">
				<img src="resources/images/${list.b_category }/${list.imagefileName }" alt="북커버 이미지를 불러옵니다." /><br>
				<p><b>${list.b_name }</b></p>
			</div>
		</div>
	</c:forEach>
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