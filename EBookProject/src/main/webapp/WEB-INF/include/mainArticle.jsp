<%@page import="com.example.EBookProject.model.dto.BookDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="resources/css/section4.css">
<link rel="stylesheet" href="resources/css/slick.css">
<link rel="stylesheet" type="text/css" href="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<link rel="stylesheet" href="http://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<script type="text/javascript" src="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<link rel="stylesheet" type="text/css" href="resources/css/modal.css"/>
<link href="//font.elice.io/EliceDigitalBaeum.css" rel="stylesheet">
<style type="text/css">
a:link { color: black; text-decoration: none;}
 a:visited { color: black; text-decoration: none;}
 a:hover { color: black; text-decoration: none;}
body{font-family: 'Jua', sans-serif;}
</style>
</head>
<body>  

<section id="section1" class="visual">
	<!-- width=1200px; height=700px -> width=890px; height=450px -->
	<div><img src="resources/images/banner3.jpg" width=1200px; height=700px;></div>
    <div><img src="resources/images/banner4.jpg" width=1200px; height=700px;></div>
    <div><img src="resources/images/banner1.jpg" width=1200px; height=700px;></div>
    <div><img src="resources/images/banner2.jpg" width=1200px; height=700px;></div>
</section>


<section id="section3">
<div class="rank">
	<div class="title">
			<h1>TOP5</h1>
	</div>
	<hr>
	<div class="bookrank">
	<c:forEach var="list" items="${ranklist}"  varStatus="i">
	<input type="hidden" value="${i.count}" id="rank" name="rank">
	</c:forEach>
	<c:forEach var="list" items="${ranklist}"  varStatus="i" begin="0" end="4">
			<div class="bookrank${i.count}">
			
			<p>${i.count}</p><img src="resources/images/${list.b_category}/${list.imagefileName}" >
			<div class="text">
				<br><a href="/EBookProject/book/list?idx=${list.category_no }" style=color:green;>${list.b_category}</a>
				<a href="/EBookProject/book/detail?idx=${list.ebook_no }"><h2> <b>${list.b_name}</b> </h2>
				<h4>${list.w_name}</h4></a>
			</div>
		</div><hr>
	</c:forEach>
	</div>
</div>
</section>


<section id="section4">
<div class="todaybook">
		<h1><strong>작가 소개</strong></h1>
	</div>
<div class="books">
<c:forEach var="writer_enter" items="${writer_enter }" varStatus="i" begin="0" end="5">
	<div class="book1">
		<div class="cover">
			<img src="resources/images/writer/${writer_enter.imagefile_no }.png" alt="작가 이미지를 불러옵니다.">
		</div>
		<div class="title">
			<a href="<%=request.getContextPath()%>/writer/viewdetail?writer_no=${writer_enter.writer_no}"><b style=font-size:18px;>${writer_enter.w_name }</b></a><br>
		</div>
	</div>
</c:forEach>
</div>
</section>


<section id="section5">
<div class="todaybook">
		<h1><strong>북하우스의 오리지널 <span style=color:#ff00e1;>&quot;Romance&quot;</span></strong></h1>
	</div>
<div class="books">
<c:forEach var="romancebook" items="${romancebook}" >
<div class="book1">
		<div class="cover">
			<img src="resources/images/${romancebook.b_category }/${romancebook.imagefileName}" alt="북커버 이미지를 불러옵니다.">
		</div>
		<div class="title">
			<a href="/EBookProject/book/list?idx=${romancebook.category_no }" style=color:green;>${romancebook.b_category }</a><br>
			<a href="/EBookProject/book/detail?idx=${romancebook.ebook_no }" style=font-size:18px;><b>${romancebook.b_name }</b></a><br>
			<span>${romancebook.w_name }</span>
		</div>
	</div>
</c:forEach>
</div>
</section>


<section id="adverbanner">
<div class="adver">
	<img src="resources/images/1.png" width=60vw; height=30vh; alt="광고를 불러오고 있습니다">
</div>
</section>


<section id="section6">
<div class="todaybook">
		<h1><strong>지금 새로 들어온 작품</strong></h1>
	</div>
<div class="books">

<c:forEach var="newbook" items="${newbook}" >
	 <div class="book1">
		<div class="cover">
			<img src="resources/images/${newbook.b_category }/${newbook.imagefileName }" alt="북커버 이미지를 불러옵니다." />
		</div>
		<div class="title">
			<a href="/EBookProject/book/list?idx=${newbook.category_no }" style=color:green;>${newbook.b_category }</a><br>
			<a href="/EBookProject/book/detail?idx=${newbook.ebook_no }" style=font-size:17px;><b>${newbook.b_name }</b></a><br>
			<span>${newbook.w_name }</span>
		</div>
	</div>
</c:forEach>
</div>
</section>


<section id="section2" class="notice_top">
  <div class="notice_wrap">
    <ul class="notice_rolling">
    	<c:forEach var="list" items="${noticlist}">
      <li><a href="${pageContext.request.contextPath}/notic/detail/${list.notic_no}"><i>공지</i>${list.notic_title}</a></li>
      </c:forEach>

    </ul>
  </div>
</section>
<script type="text/javascript"> 
    $('.visual').slick({
    infinity:true, // 무한 반복 옵션
    slidesToShow: 1, // 한 화면에 보여질 컨텐츠 개수
    slidesToScroll: 1, //스크롤 한번에 움직일 컨텐츠 개수
    autoplay: true, // 자동 스크롤 사용 여부
    autoplaySpeed: 2000, // 자동 스크롤 시 다음으로 넘어가는데 걸리는 시간 (ms) -> 2초
    dots:true, // 스크롤바 아래 점으로 페이지네이션 여부
    arrows:false, // 옆으로 이동하는 화살표 표시 여부
    fade:true, // 사라지는 효과
    });
    
    $('.notice_rolling').each(function(){
        let $this = $(this);
        let that = $(this).children('li');

        setInterval(function(){
            $this.animate({top:'-=40px'},function(){
                $this.children().first().appendTo($this);
                $this.animate({top:'0px'},0);
            });
        },4000);
    });
</script>
</body>
</html>