<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="../../include/include.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>writerInfo</title>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="resources/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="resources/css/bootstrap.min.css">
<script>
//로그아웃
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
</script>
<style>
.setWrite { 
      display: grid;
      grid-template-areas: 
        "pic title title"
        "pic writer writer"
        "pic category category"
        "pic form form"
        "pic upload upload"
        "info info info"
        "Wsubmit Wsubmit Wsubmit";
      grid-template-rows: 10% 10% 10% 10% 10% 45% 5%;
      grid-template-columns: 20% 40% 40%;
      grid-gap: 10px;
      height: 60vh;
      width: 60vw;
      margin: 0;
      }
    
    #pic {
      grid-area: pic;
    }
    
    #title { 
      grid-area: title;     
    }
      
    #writer { 
      grid-area: writer;
    }
    
    #category {
      grid-area: category;
    }
    
    #form {
      grid-area: form;
    }
    
    #upload {
      grid-area: upload;
    }
    
    #info {
      grid-area: info;
    }
    
    #Wsubmit {
      grid-area: Wsubmit;
    }
    
    #pic, #title, #writer, #category, #form, #upload, #info {
    	border:dotted 1px;
    }
    
</style>
</head>
<body>
  <header id="pageHeader">
     <!-- Header -->
   <%@ include file="../../include/pageHeader.jsp" %>
  </header>
  
  
  <article id="mainArticle">
	<form class= "setWrite" action="GOGOGO!">
		<div class="pic" id="pic">
			<p>북커버 업로딩 이미지</p>
		</div>
		<div class="title" id="title">
			작품명 <input type="text" id="wTitle" name="wTitle">
		</div>
		<div class="writer" id="writer">
			작가이름 <input type="text" id="nickname" name="nickname">
		</div>
		<div class="category" id="category">
			카테고리 
            <input type="radio" id="action" name="category" value="무협지" checked="checked">
            <label for="action">무협지</label>
            <input type="radio" id="fantasy" name="category" value="판타지">
            <label for="fantasy">판타지</label>
            <input type="radio" id="romance" name="category" value="로맨스">
            <label for="romance">로맨스</label>
		</div>
		<div class="form" id="form">
			연재형태
            <input type="radio" id="continue" name="form" value="continue" checked="checked">
            <label for="action" >연재</label>
            <input type="radio" id="finish" name="form" value="finish">
            <label for="action" >완결</label>
		</div>
		<div class="upload" id="upload">
			이미지등록
            <input type="file" name="imagefile" accept="image/*">
		</div>
		<div class="info" id="info">
			<h3>책소개</h3>
            <textarea class="textarea" style="height:180px; width:60vw;" name="novel_story"></textarea>
		</div>
		<div class="Wsubmit" id="Wsubmit">
            <button id="Wsubmit" type="submit" value="작성">작성</button>
            <button id="Wsubmit" type="reset" value="취소">취소</button>
        </div>
	</form>
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