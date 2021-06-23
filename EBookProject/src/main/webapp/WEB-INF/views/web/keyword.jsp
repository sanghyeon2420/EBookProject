<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	margin: 0;
	padding: 0;
}

#section1 {
	width: 60vw;
    height: 10vh;
    margin: 10px 0;
}
.searchresult p {
	float: left;
	align-items: center;
}
#section2 {
	width: 60vw;
	height: 40vh;
}
.writerresult {
	height: 10vh;
}
.writerresult p {
	float: left;
	align-items: center;
}
.writerlist {
	height: 30vh;
	clear: both;
}
.writerimg {
	width: 10vw;
	height: 25vh;
}
.writerimg img { 
	width: 10vw;
	height: 25vh;
	margin: 0 10px;
	padding: 0;
}
.writerdetail {
	height: 10vh;

}
#section3 {
	width: 60vw;
	height: 40vh;
	margin: 10px 0;
}
.bookresult {
	height: 10vh;
}
.bookresult p {
	float: left;
	align-items: center;
}
.booklist {
	height: 30vh;
	clear: both;
}
.bookimg {
	width: 10vw;
	height: 25vh;
}
.bookimg img {
	width: 10vw;
	height: 25vh;
	margin: 0 10px;
	padding: 0;
}
.bookdetail {
	height: 10vh;

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
   <section id="section1">
    <div class="searchresult">
    	<p><strong><h2>"${keyword}" 검색 결과</h2></strong></p>
    </div>
   </section>
   
   <section id="section2"> 
   	  <div class="writerresult">
    	<p><h4>작가 검색 : 0건</h4></p>
      </div>
      <div class="writerlist">
    	<div class="writerimg">
    		<img src="resources/images/writer/writer1.png" alt="사진을 불러오고 있습니다">
    	</div>	
    	<div class="writerdetail">
    		<a href="<%=request.getContextPath() %>/writer/viewdetail?writer_no=1"><b>작가이름</b></a>
    	</div>
      </div>
   </section>
    
   <section id="section3">
      <div class="bookresult">
    	<p><h4>책 검색 : 0건</h4></p>
      </div>
      <div class="booklist">
    	<div class="bookimg">
    		<img src="resources/images/무협지/bone.jpg" alt="사진을 불러오고 있습니다">
    	</div>
    	<div class="bookdetail">
    		<a href="/EBookProject/book/detail?idx=3"><b>책 제목</b></a> 
    	</div>
      </div>
   </section>
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