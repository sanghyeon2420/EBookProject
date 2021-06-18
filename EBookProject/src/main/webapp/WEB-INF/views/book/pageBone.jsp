<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<link href="resources/css/servPage.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.6.3/css/all.css"
	crossorigin="anonymous">
</head>
<body>
	<header id="pageHeader">fixed 때문에 고정송출!</header>
	<article id="mainArticle">
		<div class="frame">
			<div class="setTitle">
				<nav id="navPicture">
					<img src="../css/bookCover/images/${bookdto.imagefileName}" width="240px"
						height="300px">
				</nav>
				<div id="headTitle">
					<div class="name">
						<h1>${bookdto.b_name }</h1>
						<h4>&nbsp;${bookdto.w_name }</h4>
						&nbsp;조회수 <i class="fas fa-check-circle"></i> 8318 &nbsp;추천수 <i
							class="far fa-heart"></i> 309
					</div>
					<div class="blank"></div>
					<div class="container">
						<div class="item">
							<i class="far fa-thumbs-up"></i><br> 랭킹<br>6위
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
						베테랑 기뮤치뮤 작가님의 신작 무협소설!<br> 지긋지긋한 이 세상에서 헌터로 살아남기위한 중년의 이야기!<br>
						환골탈태, 그리고 현경이라는 경지에 도달했다. 그것도 나이 30으로.<br> 하지만 그와 동시에 그는 낭심을
						잃었고, 뭐라도 해보겠다는 마음으로 비급을 읽고 수련하더니 이세계 소환을 했다. <br>
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
									<span class="coin_necessary" style="margin-right: 0.01rem;">${list.viewcontent_price}</span>
								</p>
						</a></li>
							
												
						
						</c:forEach>
						<!-- <li><a href="javascript://7" onclick="">
								<p class="text">
									<strong> 7. 술로 보내는 고독의 밤</strong> <span>2021.03.24</span>
								</p>
								<p class="approval">
									<span class="coin_necessary" style="margin-right: 0.01rem;">3쿠키</span>
								</p>
						</a></li>
						<li><a href="javascript://6" onclick="">
								<p class="text">
									<strong> 6. 청아</strong> <span>2021.03.24</span>
								</p>
								<p class="approval">
									<span class="coin_necessary" style="margin-right: 0.01rem;">3쿠키</span>
								</p>
						</a></li>
						<li><a href="javascript://5" onclick="">
								<p class="text">
									<strong> 5. 갈등의 시작</strong> <span>2021.03.24</span>
								</p>
								<p class="approval">
									<span class="coin_necessary" style="margin-right: 0.01rem;">3쿠키</span>
								</p>
						</a></li>
						<li><a href="javascript://4" onclick="">
								<p class="text">
									<strong> 4. 소환수의 몸부림</strong> <span>2021.03.24</span>
								</p>
								<p class="approval">
									<span class="coin_necessary" style="margin-right: 0.01rem;">3쿠키</span>
								</p>
						</a></li>
						<li><a href="javascript://3" onclick="">
								<p class="text">
									<strong> 3. 문둔병환자</strong> <span>2021.03.24</span>
								</p>
								<p class="approval">
									<span class="free_coin_info" style="margin-right: 0.01rem;">무료</span>
								</p>
						</a></li>
						<li><a href="javascript://2" onclick="">
								<p class="text">
									<strong> 2. 도태되어버린 추억</strong> <span>2021.03.24</span>
								</p>
								<p class="approval">
									<span class="free_coin_info" style="margin-right: 0.01rem;">무료</span>
								</p>
						</a></li>
						<li><a href="javascript://1" onclick="">
								<p class="text">
									<strong> 1. 현경</strong> <span>2021.03.24</span>
								</p>
								<p class="approval">
									<span class="free_coin_info" style="margin-right: 0.01rem;">무료</span>
								</p>
						</a></li> -->
					</ol>
				</div>
			</div>
		</div>
	</article>
	<nav id="mainNav">Nav</nav>
	<div id="siteAds">Ads</div>
	<footer id="pageFooter">Footer</footer>
</body>
</html>