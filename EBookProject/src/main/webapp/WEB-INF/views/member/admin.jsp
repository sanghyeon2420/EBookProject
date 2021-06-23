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
<link href="resources/css/modal.css" rel="stylesheet">
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
		<c:choose>
			<c:when test="${listtype eq 'member'}">
				<button style="width:32%; height:60px; background-color:#fff; color:#5FD184; border-style:none;  font-size:25px; font-family: 'Sunflower', sans-serif; font-weight:bold; cursor:pointer;;" onclick="location.href='/EBookProject/admin/list?listtype=member'">회원관리</button>
				<button  style="width:32%; height:60px; background-color:#5FD184; color:#fff; border-style:none;  font-size:25px; font-family: 'Sunflower', sans-serif; font-weight:bold; cursor:pointer;" onclick="location.href='/EBookProject/admin/list?listtype=book'">도서관리</button>
				<button  style="width:32%; height:60px; background-color:#5FD184; color:#fff; border-style:none;  font-size:25px; font-family: 'Sunflower', sans-serif; font-weight:bold; cursor:pointer;" onclick="location.href='/EBookProject/admin/list?listtype=board'">게시판관리</button>			
			</c:when>
			<c:when test="${listtype eq 'book'}">
				<button style="width:32%; height:60px; background-color:#5FD184; color:#fff; border-style:none;  font-size:25px; font-family: 'Sunflower', sans-serif; font-weight:bold; cursor:pointer;;" onclick="location.href='/EBookProject/admin/list?listtype=member'">회원관리</button>
				<button  style="width:32%; height:60px; background-color:#fff; color:#5FD184; border-style:none;  font-size:25px; font-family: 'Sunflower', sans-serif; font-weight:bold; cursor:pointer;" onclick="location.href='/EBookProject/admin/list?listtype=book'">도서관리</button>
				<button  style="width:32%; height:60px; background-color:#5FD184; color:#fff; border-style:none;  font-size:25px; font-family: 'Sunflower', sans-serif; font-weight:bold; cursor:pointer;" onclick="location.href='/EBookProject/admin/list?listtype=board'">게시판관리</button>			
			</c:when>
			<c:when test="${listtype eq 'board'}">
				<button style="width:32%; height:60px; background-color:#5FD184; color:#fff; border-style:none;  font-size:25px; font-family: 'Sunflower', sans-serif; font-weight:bold; cursor:pointer;;" onclick="location.href='/EBookProject/admin/list?listtype=member'">회원관리</button>
				<button  style="width:32%; height:60px; background-color:#5FD184; color:#fff; border-style:none;  font-size:25px; font-family: 'Sunflower', sans-serif; font-weight:bold; cursor:pointer;" onclick="location.href='/EBookProject/admin/list?listtype=book'">도서관리</button>
				<button  style="width:32%; height:60px; background-color:#fff; color:#5FD184; border-style:none;  font-size:25px; font-family: 'Sunflower', sans-serif; font-weight:bold; cursor:pointer;" onclick="location.href='/EBookProject/admin/list?listtype=board'">게시판관리</button>			
			</c:when>		
		</c:choose>
		
   
 <br><br>
   <table>
 	<c:choose>
 	<c:when test="${listtype eq 'member'}">
 		<tr style="background-color: #5FD184">
	  	<th width="10%">회원ID</th>
	  	<th width="10%">닉네임</th>
	  	<th width="10%">쿠키잔고</th>
	  	<th width="20%">관리</th>
   </tr>	
   <c:forEach var="memberlist" items="${member_list}">
	<tr>
	<td>${memberlist.userid }</td>
	<td>${memberlist.nickname }</td>
	<td>${memberlist.cash }</td>
	<td>
		  <a href="#open${memberlist.user_no }"><button>삭제</button></a>
	         <div class="white_content" id="open${memberlist.user_no }">
	            <div>
	            <br>
	            <p>
	              ${memberlist.nickname }님을 탈회 처리 하시겠습니까?
	              <p>
	       		 <a href="#close"><button>탈회</button></a>
				 <a href="#close"><button>닫기</button></a>
	           </div>
        	 </div>
		 <a href="#open1${memberlist.user_no }"><button>쿠키관리</button></a>
		 	<div class="white_content" id="open1${memberlist.user_no }">
	            <div>
	            <br>
	            <p>
	              ${memberlist.nickname }님 <br>
	           	    현재 쿠키 ${memberlist.cash }입니다. <br> 
	        <textarea rows="1" cols="4"></textarea>으로 수정합니다.
	              <p>
	       		 <a href="#close"><button>수정</button></a>
				 <a href="#close"><button>닫기</button></a>
	           </div>
        	 </div>
	</td>
	</tr>	  
	 </c:forEach>
 	</c:when>
 	<c:when test="${listtype eq 'book'}">
 		<tr style="background-color: #5FD184">
	  	<th width="30%">책이름</th>
	  	<th width="10%">장르</th>
	  	<th width="10%">작가이름</th>
	  	<th width="10%">관리</th>
   </tr>	
 		<c:forEach var="booklist" items="${book_list}">
	<tr>
		<td>${booklist.b_name }</td>
		<td>${booklist.b_category }</td>
		<td>${booklist.w_name }</td>
		<td>
			 <a href="#open${booklist.ebook_no}"><button>삭제</button></a>
	         <div class="white_content" id="open${booklist.ebook_no}">
	            <div>
	            <br>
	            <p>
	              ${booklist.b_name }을 삭제 처리 하시겠습니까?
	              <p>
	       		 <a href="#close"><button>삭제</button></a>
				 <a href="#close"><button>닫기</button></a>
	           </div>
        	 </div>
        	 
<!-- 			<button>쿠키관리</button> -->
		</td>
	</tr>
		 </c:forEach>
 	</c:when>
 	 	<c:when test="${listtype eq 'board'}">
 		<tr style="background-color: #5FD184">
	  	<th width="10%">게시글제목</th>
	  	<th width="10%">글쓴이</th>
	  	<th width="20%">회원IP</th>
	  	<th width="10%">작성날짜</th>
	  	<th width="10%">관리</th>
   </tr>	
		<c:forEach var="boardlist" items="${board_list}">
	<tr>
		<td>${boardlist.b_title }</td>
		<td>${boardlist.nickname }</td>
		<td>${boardlist.user_ip }</td>
		<td>${boardlist.b_write_date }</td>
		<td>
			<a href="#open${boardlist.board_no }"><button>삭제</button></a>
	         <div class="white_content" id="open${boardlist.board_no }">
	            <div>
	            <br>
	              <p>
	              	해당 게시글을 삭제 처리 하시겠습니까?
	              <p>
	       		 <a href="#close"><button>삭제</button></a>
				 <a href="#close"><button>닫기</button></a>
	           </div>
        	 </div>
		</td>
		 </c:forEach>
 	</c:when>

 	</c:choose>
  	
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