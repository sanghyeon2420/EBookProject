<%@page import="org.springframework.ui.Model"%>

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

</style>
</head>
<body>
  <header id="pageHeader">
     <!-- Header -->
   <%@ include file="../../include/pageHeader.jsp" %>
  </header>
  
  
  <article id="mainArticle">
  <div class="cookie">
  	<div class="header">
  		<p><strong><h2>쿠키충전</h2></strong></p>
  	</div>
  	<div class="title">
  		<p>회원의 보유 쿠키 : 00쿠키</p>
  	</div>
  </div>
  <hr>
  <div class="list">
  	<div class="cookielist1">
  		<p>쿠키 10개</p><button type="button" id="buy">￦1,000</button>
  	</div>
  	<div class="cookielist2">
  		<p>쿠키 50개</p><button type="button" id="buy">￦5,000</button>
  	</div>
  	<div class="cookielist3">
  		<p>쿠키 100개</p><button type="button" id="buy">￦10,000</button>
  	</div>
  	<div class="cookielist4">
  		<p>쿠키 150개</p><button type="button" id="buy">￦15,000</button>
  	</div>
  	<div class="cookielist5">
  		<p>쿠키 200개</p><button type="button" id="buy">￦20,000</button>
  	</div>
  	<div class="cookielist6">
  		<p>쿠키 300개</p><button type="button" id="buy">￦30,000</button>
  	</div>
  </div>
  <div class="detail">
  	<div class="detailcookie">
  		<p>쿠키 이용안내</p>
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