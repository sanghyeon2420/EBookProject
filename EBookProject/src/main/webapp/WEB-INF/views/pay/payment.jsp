<%@page import="org.springframework.ui.Model"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="../../include/include.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>payment</title>
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



function BuyNow(buy){
	console.log(buy);

	var buyinfo=confirm("쿠키충전을 하시겠습니까?");
	buy = parseInt(buy);
	
	if(buyinfo){
		$.ajax({
			type:"post",
			url:"${pageContext.request.contextPath}/pay/cookiecharge",
			data:{"cookie":buy},
			success:function(data){
				data = parseInt(data);
				console.log(buy+data);
				var result = buy+data;
				document.getElementById("return").innerHTML=result;
				alert("결제가 완료되었습니다");
			}
		});	
	} else {
		alert("결제가 취소되었습니다");
		location.href="${pageContext.request.contextPath}/pay/productbuy";
	}
}


$('dt').on('click', function() {

	  function slideDown(target) {
	    slideUp();
	    $(target).addClass('on').next().slideDown();
	  }

	  function slideUp() {
	    $('dt').removeClass('on').next().slideUp();
	  }

	  $(this).hasClass('on') ? slideUp() : slideDown(this);

	});


</script>
<style>
.list {
  	display: block;
}
.cookielist1 {
    margin: 15px 10px;
    height: 6vh;
   align-content: center;
}
.cookielist1 p {
	float: left;
}
.cookielist1 button {
	float: right;
	background-color: #00AF5B;
	font-color: black;
}
.cookielist2 {
	margin: 15px 10px;
    height: 6vh;
    align-items: center;
}
.cookielist2 p {
	float: left;
}
.cookielist2 button {
	float: right;
	background-color: #00AF5B;
}
.cookielist3 {
	margin: 15px 10px;
    height: 6vh;
    align-items: center;
}
.cookielist3 p {
	float: left;
}
.cookielist3 button {
	float: right;
	background-color: #00AF5B;
}
.cookielist4 {
	margin: 15px 10px;
    height: 6vh;
    align-items: center;
}
.cookielist4 p {
	float: left;
}
.cookielist4 button {
	float: right;
	background-color: #00AF5B;
}
.cookielist5 {
	margin: 15px 10px;
    height: 6vh;
    align-items: center;
}
.cookielist5 p {
	float: left;
}
.cookielist5 button {
	float: right;
	background-color: #00AF5B;
}
.cookielist6 {
	margin: 15px 10px;
    height: 6vh;
    align-items: center;
}
.cookielist6 p {
	float: left;
}
.cookielist6 button {
	float: right;
	background-color: #00AF5B;
}    
/* 광고 배너 */
#adverbanner {
	width: 60vw;
	height: 16vh;
    margin: 15px 0; 
}
.adver img {
	width: 60vw;
	height: 16vh;
	margin: 0;
	padding: 0;
}
.detailcookie p {
	margin: 0;
	padding: 10px 0;
}

dt, dd {
  padding: 10px;
}

dt {
  background-color: #cfc;
  margin-bottom: 5px;
}

dt span {
  display: inline-block;
  width: 5px;
  height: 5px;
  background-color: black;
  vertical-align: middle;
  margin-right: 10px;
}

dt.on span {
  background-color: red;
}

dd {
  background-color: tan;
  margin-bottom: 5px;
  display: none;
} 

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
  	<br>
  	<div class="title">
  		<p><strong>${sessionScope.member.nickname}</strong>&nbsp;회원님의 보유 쿠키 : <span id="return">${sessionScope.member.cash}</span>쿠키</p>
  	</div>
  </div>
  <hr>
  <div class="list">
  <c:set var="buy1" value="10" />
  <c:set var="buy2" value="50" />
  <c:set var="buy3" value="100" />
  <c:set var="buy4" value="150" />
  <c:set var="buy5" value="200" />
  <c:set var="buy6" value="300" />
  	<div class="cookielist1">
  		<p><i class="fas fa-cookie-bite"></i>&nbsp;쿠키 10개</p><button type="button" onclick="javascript:BuyNow(${buy1})">￦1,000</button>
  	</div><hr>
  	<div class="cookielist2">
  		<p><i class="fas fa-cookie-bite"></i>&nbsp;쿠키 50개</p><button type="button" onclick="javascript:BuyNow(${buy2})">￦5,000</button>
  	</div><hr>
  	<div class="cookielist3">
  		<p><i class="fas fa-cookie-bite"></i>&nbsp;쿠키 100개</p><button type="button" onclick="javascript:BuyNow(${buy3})">￦10,000</button>
  	</div><hr>
  	<div class="cookielist4">
  		<p><i class="fas fa-cookie-bite"></i>&nbsp;쿠키 150개</p><button type="button" onclick="javascript:BuyNow(${buy4})">￦15,000</button>
  	</div><hr>
  	<div class="cookielist5">
  		<p><i class="fas fa-cookie-bite"></i>&nbsp;쿠키 200개</p><button type="button" onclick="javascript:BuyNow(${buy5})">￦20,000</button>
  	</div><hr>
  	<div class="cookielist6">
  		<p><i class="fas fa-cookie-bite"></i>&nbsp;쿠키 300개</p><button type="button" onclick="javascript:BuyNow(${buy6})">￦30,000</button>
  	</div>
  </div>
  <hr>
  	<section id="adverbanner">
		<div class="adver">
		  <a href="/EBookProject/notic/view?notic_no=2 ">
			<img src="resources/images/cookie.jpg" width=60vw; height=16vh; alt="광고를 불러오고 있습니다">
		  </a>
		</div>
	</section>
	<hr>
  <div class="detail">
  	<div class="detailcookie">
  		<dl>
  		<dt><span></span>쿠키 이용안내</dt>
  			<dd>ebook 작품은 쿠키를 사용하여 대여/구매하실 수 있습니다.</dd>
  			<dd>충전한 쿠키는 ebook의 모든 플랫폼에서 사용할 수 있습니다.</dd>
  			<dd>쿠키 구매 시 지급되는 보너스 쿠키의 수량은 변경될 수 있으며, 유효기간은 변도 표시한 기준에 따릅니다.</dd>
  			<dd>IOS앱에서 충전한 쿠키의 구매취소는 ebook 정책 상 고객센터를 통해서만 가능합니다.</dd>
  			<dd>쿠키 구매 시 지급되는 보너스 쿠키와 이벤트로 받은 무료 쿠키는 구매 취소 및 환불 대상이 아닙니다.</dd>
  			<dd>쿠키가 사용될 때는 이벤트로 받은 무료 쿠키가 우선 사용되며, 구매한 쿠키 패키지 내에서는 보너스 쿠키가 유료 쿠키보다 먼저 사용됩니다.</dd>
  			<dd>쿠키 충전 금액은 쿠키샵 테이블에 표시되는 금액 기준이며, 실제 결제금액과 차이가 있슬 수 있습니다.</dd>
  			<dd>쿠키 가격은 부가가치세가 포함되지 않은 가격입니다.</dd>
  		 </dl>
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