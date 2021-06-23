<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="../../include/include.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="resources/js/bootstrap.min.js"></script>

<link rel="stylesheet" type="text/css" href="resources/css/bootstrap.min.css">
<link href="resources/css/layout.css" rel="stylesheet">
<link href="resources/css/servPage.css" rel="stylesheet">
<title>관리자 페이지 </title>
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
	 table {
    width: 100%;
    border-top: 1px solid #444444;
    border-collapse: collapse;
  	text-align: center;

  }
  th, td {
    border-bottom: 1px solid #444444;
    padding: 10px;
	font-family: 'Jua', sans-serif;
	font-size: 20px;
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
   <div style="width:100%; display:inline;"></div>
		<button style="width:30%; height:60px; background-color:#fff; color:#5FD184; border-style:none;  font-size:25px; font-family: 'Sunflower', sans-serif; font-weight:bold; cursor:pointer;;" onclick="location.href='admin'">회원관리</button>
		<button  style="width:30%; height:60px; background-color:#5FD184; color:#fff; border-style:none;  font-size:25px; font-family: 'Sunflower', sans-serif; font-weight:bold; cursor:pointer;" onclick="location.href=''">도서관리</button>
		<button  style="width:30%; height:60px; background-color:#5FD184; color:#fff; border-style:none;  font-size:25px; font-family: 'Sunflower', sans-serif; font-weight:bold; cursor:pointer;" onclick="location.href=''">게시판관리</button>
 <br><br>
   <table>
  <tr>
	<tr>
		<!-- <td colspan="4" style="text-align: left; font-size: 30px;  border-top: 1px solid #ffff;"> 회원관리
		</td> -->
  	<tr style="background-color: #5FD184">
	  	<th width="10%">회원ID</th>
	  	<th width="10%">닉네임</th>
	  	<th width="10%">쿠키잔고</th>
	  	<th width="10%">관리</th>
   </tr>	
   <c:forEach var="memberlist" items="${memberlist}">
	<tr>
	<td>${memberlist.userid }</td>
	<td>${memberlist.nickname }</td>
	<td>${memberlist.cash }</td>
	<td>
		<button>탈퇴관리</button>
		<button>쿠키관리</button>
	</td>
	</tr>	  
	 </c:forEach>
  </table>
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