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
<<<<<<< HEAD
						<a href="/EBookProject/writer/viewdetail?writer_no=${bookdto.writer_no }">
						<h4>&nbsp;${bookdto.w_name }</h4></a>
=======
						<h4><a href="../writer/viewdetail?writer_no=${bookdto.writer_no}">&nbsp;${bookdto.w_name }</a></h4>
>>>>>>> branch 'main' of https://github.com/sanghyeon2420/EBookProject.git
						&nbsp;조회수 <i class="fas fa-check-circle"></i>${bookdto.book_get } &nbsp;추천수 <i
							class="far fa-heart"></i>${bookdto.book_hits }
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
							<li><a href="javascript://7" onclick="">
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