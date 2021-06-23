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
	$("#hits").click(function(){
		var ebook_no=${bookdto.ebook_no};
		
		$.ajax({
			type:"post", //전송 방식
			url:"${pageContext.request.contextPath}/book/hits", //요청주소
			data:{"ebook_no":ebook_no}, //보내줄 데이터
			success: function(data){  //비동기 통신 성공시, data -> 리턴받은 데이터
				console.log(data);  //console창에 data가 출력됨
				document.getElementById("span_hits").innerHTML=data;
			}
		});
	});
});
</script>
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
						&nbsp;조회수 <i class="fas fa-check-circle"></i>${bookdto.book_get } &nbsp;추천수 <i
							class="far fa-heart"></i><span id="span_hits">${bookdto.book_hits }</span>&nbsp;&nbsp;<button id="hits" name="hits">추천</button>
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
							<li><a href="<%=request.getContextPath()%>/book/contentview/?book=${bookdto.ebook_no}&content=${list.contentlist}">
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