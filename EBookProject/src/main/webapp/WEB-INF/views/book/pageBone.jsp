<%@page import="com.example.EBookProject.model.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<%@ include file="../../include/include.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<link href="resources/css/servPage.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.6.3/css/all.css"
	crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="resources/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="resources/css/bootstrap.min.css">
<script>
$(document).ready(function(){

	//memo_list();
	
	
	$("#hits").change(function(){
		var ebook_no=${bookdto.ebook_no};
		var count=${count};

			$.ajax({
				type:'post',
				url:'${pageContext.request.contextPath}/book/hits',
				data:{'ebook_no':${bookdto.ebook_no}, 'count':${count} },
				success:function(){
					location.href="${pageContext.request.contextPath}/book/detail?idx="+${bookdto.ebook_no};
				}
			});  	
  	 	 });
	  });

/* $(document).ready(function(){
	$("#btnWrite").click(function(){ //버튼클릭이벤트
		memo_insert();		
	});	

function memo_insert(){
	var memo = $("#memo").val();
	var param = "&memo="+memo;
	$.ajax({
		type: "post",
		data: param,
		url: '${pageContext.request.contextPath}/memo/insert',
		success: function(){
			//메모목록 갱신
			memo_list();
			//폼입력값 초기화
			$("#memo").val("");
		}
	});
  }
}); */

<%-- function memo_list(){
	$.ajax({
		type: "post",
		url: "<%=request.getContextPath() %>/memo/list",
		data:{"idx":${bookdto.ebook_no }},
		success: function( data ){
			console.log(data);
			$("#memoResult").html( data );
		}
	});
} --%>



function BuyCheck(ebook_no,contentlist,viewcontent_price,contents_no){
	console.log("ebook_no =>  "+ebook_no+", contentlist => "+contentlist);
	//alert(""); <= 경고문
	// var v=prompt("a를 입력",""); 입력창
	// console.log(v);
	console.log(buycheck);
	
	var usercash= ${sessionScope.member.cash}; 

	console.log(viewcontent_price);
	
	if (viewcontent_price == 0){
		location.href="${pageContext.request.contextPath}/book/contentview/?book="+ebook_no+"&content="+contentlist;
	} else {
		if (usercash >= viewcontent_price){ // 유저 캐쉬가 많을때
			var buycheck=confirm("결제를 하시겠습니까?");
			if (buycheck){
				$.ajax({
					type:"post",
					url:"${pageContext.request.contextPath}/pay/pay",
					data:{"contents_no":contents_no},
					success:function(){
						alert("결제 완료");
						location.href="${pageContext.request.contextPath}/book/contentview/?book="+ebook_no+"&content="+contentlist;
					}
				});
			}
			
		} else { // 적을 때
			var cookiecharge=confirm("쿠키가 부족합니다. 충전창으로 이동하시겠습니까?"); // 리턴값 true false
			if(cookiecharge){
				location.href="${pageContext.request.contextPath}/pay/productbuy";		
			} 
		}	
	}
}




<%-- $(document).ready( function() { //onload 이벤트
	memo_list();
	$("#btnWrite").click(function(){ //버튼클릭이벤트
		memo_insert();		
	});
});
function memo_insert(){
	var memo = $("#memo").val();
	var param = "&memo="+memo;
	$.ajax({
		type: "post",
		data: param,
		url: "<%=request.getContextPath() %>/book/detail?idx=${bookdto.ebook_no }",
		success: function(){
			//메모목록 갱신
			memo_list();
			//폼입력값 초기화
			$("#memo").val("");
		}
	});
}

function memo_list(){
	$.ajax({
		type: "post",
		url: "<%=request.getContextPath() %>/book/detail?idx=${bookdto.ebook_no }",
		success: function( data ){
			$("#list").html( data );
		}
	});
}


$(document).ready( function(){
	$("#btnUpdate").click(function(){
		$("#form1").attr("action","<%=request.getContextPath() %>/book/detail?idx=${bookdto.ebook_no }");
		$("#form1").submit();
	});
	$("#btnDelete").click( function(){
		if( confirm("삭제하시겠습니까?")) {
			$("#form1").attr("action", "<%=request.getContextPath() %>/book/detail?idx=${bookdto.ebook_no }");
			$("#form1").submit();
		}
	});
}); --%>
</script>

<style>
.detail p {
	margin-bottom: 15px;
}

</style>
</head>
<body>
<header id="pageHeader">
     <!-- Header -->
   <%@ include file="../../include/pageHeader.jsp" %>
  </header>

	<article id="mainArticle">
		<div class="frame">
			<div class="setTitle">
				<nav id="navPicture">
					<img src="resources/images/${bookdto.b_category}/${bookdto.imagefileName}" width="240px"
						height="300px">
				</nav>
				<div id="headTitle">
					<div class="name">
						<h1>${bookdto.b_name }</h1>
						<%-- <a href="/EBookProject/writer/viewdetail?writer_no=${bookdto.writer_no }">
						<h4>&nbsp;${bookdto.w_name }</h4></a> --%>
						<h4><a href="/EBookProject/writer/viewdetail?writer_no=${bookdto.writer_no}">&nbsp;${bookdto.w_name }</a></h4>
						&nbsp;조회수 <i class="fas fa-check-circle"></i>${bookdto.book_get } &nbsp;추천수
						
						<c:choose>
							<c:when test="${count == 0 }">
								<input type="checkbox" id="hits" name="hits" >																							
							</c:when>
							<c:when test="${count == 1 }">
								<input type="checkbox" id="hits" name="hits" checked="checked">																										
							</c:when>
						
						</c:choose>

						
						
						<span id="span_hits">${bookdto.book_hits }</span>&nbsp;&nbsp;
					</div>
					<div class="blank"></div>
					<div class="container">
						<div class="item">
							<i class="far fa-thumbs-up"></i><br> 랭킹<br>${rank}위
						</div>
						<div class="item">
							<i class="far fa-comments"></i><br> 첫 리뷰 작성시<br> +1쿠키
						</div>
						<div class="item">
							<i class="fas fa-book-open"></i><br> 첫 포스트 작성시<br> +1쿠키
						</div>
					</div>
				</div>
			</div>
			<div id="mainDetail">
				<div class="detail">
					<h4>책 소개</h4>
					<p>
						${bookdto.b_intro } <br>
					</p>	
				</div>
			</div>
			<div id="footerList">
				<div class="detail_list">
					<ol>
						<c:forEach var="list" items="${list}">
							<li><a href="javascript:BuyCheck(${bookdto.ebook_no},${list.contentlist},${list.viewcontent_price },${list.contents_no })">
								<p class="text">
									<strong> ${list.contentlist}. ${list.content_name}</strong> <span>${list.content_date}</span>
								</p>
								<p class="approval">
									<span class="coin_necessary" style="margin-right: 0.01rem;">
									<c:if test="${list.viewcontent_price == 0}">
									무료
									</c:if>
									<c:if test="${list.viewcontent_price != 0}">
									${list.viewcontent_price}쿠키
									</c:if>
									</span>
								</p>
						</a></li>
						</c:forEach>
					</ol>
				</div>
			</div>
			<!-- <div id="comment">
				<h2>한 줄 후기</h2>
			  <div id="memoInput">
			  	    메모 <input type="text" name="memo" id="memo" size="50" />
					<input type="button" id="btnWrite" value="확인" />
			  </div><br>
			 출력하는 부분 
			<div id="memoResult">
			</div>					
			</div> -->
		</div>
	</article>
	
	<nav id="mainNav">
 	<%@ include file="../../include/mainNav.jsp" %>
 	</nav>
 	
	<div id="siteAds">
	<%@ include file="../../include/siteAds.jsp" %>
	</div>
	
	<footer id="pageFooter">
	<%@ include file="../../include/pageFooter.jsp" %>
	</footer>
</body>
</html>