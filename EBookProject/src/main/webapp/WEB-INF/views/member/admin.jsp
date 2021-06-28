<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
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

function cookieUpdate(userno){
	console.log("html에서 넘어온 userno의 값 : "+ userno);
	var id = "cash"+userno; // id이름 생성 (cash1 cash2 cash3... cash10)
	console.log("var id => "+id);
	var result=document.getElementById(id).value; // 값을 저장
	console.log("var result => "+result);
	location.href="/EBookProject/admin/cookiemanager?user_no="+userno+"&cash="+result;
}

$(function(){
	$("#btnWrite").click(function(){
		//jsp로 곧바로 링크 못시키기때문에 boardcontroller.java 에서 requestmapping("write")로 
		location.href="<%=request.getContextPath() %>/admin/write";
	});
});

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
				<button style="width:22%; height:60px; background-color:#fff; color:#5FD184; border-style:none;  font-size:25px; font-family: 'Sunflower', sans-serif; font-weight:bold; cursor:pointer;;" onclick="location.href='/EBookProject/admin/list?listtype=member'">회원관리</button>
				<button  style="width:22%; height:60px; background-color:#5FD184; color:#fff; border-style:none;  font-size:25px; font-family: 'Sunflower', sans-serif; font-weight:bold; cursor:pointer;" onclick="location.href='/EBookProject/admin/list?listtype=book'">도서관리</button>
				<button  style="width:22%; height:60px; background-color:#5FD184; color:#fff; border-style:none;  font-size:25px; font-family: 'Sunflower', sans-serif; font-weight:bold; cursor:pointer;" onclick="location.href='/EBookProject/admin/list?listtype=board'">게시판관리</button>	
				<button  style="width:22%; height:60px; background-color:#5FD184; color:#fff; border-style:none;  font-size:25px; font-family: 'Sunflower', sans-serif; font-weight:bold; cursor:pointer;" onclick="location.href='/EBookProject/admin/list?listtype=notic'">공지사항관리</button>					
			</c:when>
			<c:when test="${listtype eq 'book'}">
				<button style="width:22%; height:60px; background-color:#5FD184; color:#fff; border-style:none;  font-size:25px; font-family: 'Sunflower', sans-serif; font-weight:bold; cursor:pointer;;" onclick="location.href='/EBookProject/admin/list?listtype=member'">회원관리</button>
				<button  style="width:22%; height:60px; background-color:#fff; color:#5FD184; border-style:none;  font-size:25px; font-family: 'Sunflower', sans-serif; font-weight:bold; cursor:pointer;" onclick="location.href='/EBookProject/admin/list?listtype=book'">도서관리</button>
				<button  style="width:22%; height:60px; background-color:#5FD184; color:#fff; border-style:none;  font-size:25px; font-family: 'Sunflower', sans-serif; font-weight:bold; cursor:pointer;" onclick="location.href='/EBookProject/admin/list?listtype=board'">게시판관리</button>	
				<button  style="width:22%; height:60px; background-color:#5FD184; color:#fff; border-style:none;  font-size:25px; font-family: 'Sunflower', sans-serif; font-weight:bold; cursor:pointer;" onclick="location.href='/EBookProject/admin/list?listtype=notic'">공지사항관리</button>					
			</c:when>
			<c:when test="${listtype eq 'board'}">
				<button style="width:22%; height:60px; background-color:#5FD184; color:#fff; border-style:none;  font-size:25px; font-family: 'Sunflower', sans-serif; font-weight:bold; cursor:pointer;;" onclick="location.href='/EBookProject/admin/list?listtype=member'">회원관리</button>
				<button  style="width:22%; height:60px; background-color:#5FD184; color:#fff; border-style:none;  font-size:25px; font-family: 'Sunflower', sans-serif; font-weight:bold; cursor:pointer;" onclick="location.href='/EBookProject/admin/list?listtype=book'">도서관리</button>
				<button  style="width:22%; height:60px; background-color:#fff; color:#5FD184; border-style:none;  font-size:25px; font-family: 'Sunflower', sans-serif; font-weight:bold; cursor:pointer;" onclick="location.href='/EBookProject/admin/list?listtype=board'">게시판관리</button>			
				<button  style="width:22%; height:60px; background-color:#5FD184; color:#fff; border-style:none;  font-size:25px; font-family: 'Sunflower', sans-serif; font-weight:bold; cursor:pointer;" onclick="location.href='/EBookProject/admin/list?listtype=notic'">공지사항관리</button>				
			</c:when>	
			<c:when test="${listtype eq 'notic'}">
				<button style="width:22%; height:60px; background-color:#5FD184; color:#fff; border-style:none;  font-size:25px; font-family: 'Sunflower', sans-serif; font-weight:bold; cursor:pointer;;" onclick="location.href='/EBookProject/admin/list?listtype=member'">회원관리</button>
				<button  style="width:22%; height:60px; background-color:#5FD184; color:#fff; border-style:none;  font-size:25px; font-family: 'Sunflower', sans-serif; font-weight:bold; cursor:pointer;" onclick="location.href='/EBookProject/admin/list?listtype=book'">도서관리</button>
				<button  style="width:22%; height:60px; background-color:#5FD184; color:#fff; border-style:none;  font-size:25px; font-family: 'Sunflower', sans-serif; font-weight:bold; cursor:pointer;" onclick="location.href='/EBookProject/admin/list?listtype=board'">게시판관리</button>
				<button  style="width:22%; height:60px; background-color:#fff; color:#5FD184; border-style:none;  font-size:25px; font-family: 'Sunflower', sans-serif; font-weight:bold; cursor:pointer;" onclick="location.href='/EBookProject/admin/list?listtype=notic'">공지사항관리</button>				
			</c:when>	
		</c:choose>
		
   
 <br><br>
   <table>
 	<c:choose>
 	<c:when test="${listtype eq 'member'}">
 		<tr style="background-color: #5FD184">
	  	<th width="10%">회원ID</th>
	  	<th width="10%">닉네임</th>
	  	<th width="20%">쿠키잔고</th>
	  	<th width="10%">관리</th>
   </tr>	
   <c:forEach var="memberlist" items="${member_list}">
	<tr>
	<td>${memberlist.userid }</td>
	<td>${memberlist.nickname }</td>
	<td>
	${memberlist.cash }<br>
	  <input type="number" value="${memberlist.cash }" id="cash${memberlist.user_no }">
	 <a href="javascript:cookieUpdate(${memberlist.user_no })"> 
	 <button>수정하기</button></a>
	</td>
	<td>
	
		  <a href="#open${memberlist.user_no }"><button>삭제</button></a>
	         <div class="white_content" id="open${memberlist.user_no }">
	            <div>
	            <br>
	            <p>
	              ${memberlist.nickname }님을 탈회 처리 하시겠습니까?
	              <p><br>
	       		 <a href="<%=request.getContextPath() %>/admin/deleteMember?user_no=${memberlist.user_no }"><button>탈회</button></a>
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
	            <br><br>
	            <p>
	              ${booklist.b_name }을 삭제 처리 하시겠습니까?
	              <p><br>
	       		 <a href="<%=request.getContextPath() %>/admin/deleteBook?ebook_no=${booklist.ebook_no}"><button>삭제</button></a>
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
	  	<th width="5%">번호</th>
	  	<th width="20%">게시글제목</th>
	  	<th width="10%">글쓴이</th>
	  	<th width="20%">작성자IP</th>
	  	<th width="10%">작성일</th>
	  	<th width="10%">관리</th>
   </tr>	
		<c:forEach var="boardlist" items="${board_list}">
	<tr>
		<td>${boardlist.board_no }</td>
		<td>${boardlist.b_title }</td>
		<td>${boardlist.nickname }</td>
		<td>${boardlist.user_ip }</td>
		<td><fmt:formatDate value="${boardlist.b_write_date }" pattern="MM. dd" /></td>
		<td>
			<a href="#open${boardlist.board_no }"><button>삭제</button></a>
	         <div class="white_content" id="open${boardlist.board_no }">
	            <div>
	            <br><br>
	              <p>
	              	${boardlist.board_no }번 게시글을 삭제 처리 하시겠습니까?
	              <p><br>
	       		 <a href="<%=request.getContextPath() %>/admin/deleteboard?board_no=${boardlist.board_no}"><button>삭제</button></a>
				 <a href="#close"><button>닫기</button></a>
	           </div>
        	 </div>
		</td>
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
	            <br><br>
	            <p>
	              ${booklist.b_name }을 삭제 처리 하시겠습니까?
	              <p><br>
	       		 <a href="<%=request.getContextPath() %>/admin/deleteBook?ebook_no=${booklist.ebook_no}"><button>삭제</button></a>
				 <a href="#close"><button>닫기</button></a>
	           </div>
        	 </div>
        	 
<!-- 			<button>쿠키관리</button> -->
		</td>
	</tr>
		 </c:forEach>
 	</c:when>


 	 	<c:when test="${listtype eq 'notic'}">
 		<tr style="background-color: #5FD184">
	  	<th width="5%">번호</th>
	  	<th width="20%">게시글제목</th>
	  	<th width="10%">작성일</th>
	  	<th width="10%">관리</th>
   </tr>	
		<c:forEach var="noticlist" items="${notic_list}">
	<tr>
		<td>${noticlist.notic_no }</td>
		<td>${noticlist.notic_title }</td>
		<td><fmt:formatDate value="${noticlist.notic_regdate }" pattern="MM. dd" /></td>
		<td>
			<a href="#open${noticlist.notic_no}"><button>삭제</button></a>
	         <div class="white_content" id="open${noticlist.notic_no }">
	            <div>
	            <br><br>
	              <p>
	              	${noticlist.notic_no }번 게시글을 삭제 처리 하시겠습니까?
	              <p><br>
	       		 <a href="<%=request.getContextPath() %>/admin/deletenotic?notic_no=${noticlist.notic_no}"><button>삭제</button></a>
				 <a href="#close"><button>닫기</button></a>
	           </div>
        	 </div>
        	 <a href="<%=request.getContextPath() %>/admin/update?notic_no=${noticlist.notic_no}">
        	 <button>수정</button></a>
		</td>
		 </c:forEach>
		 	 
		<tr>
			<td>
			<button id="btnWrite">글쓰기</button>
			</td>
			<td colspan="3"></td>		
		</tr>
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