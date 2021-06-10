<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="resources/css/section4.css">
<link rel="stylesheet" href="resources/css/slick.css">
<link rel="stylesheet" type="text/css" href="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<link rel="stylesheet" href="http://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<script type="text/javascript" src="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>

</head>
<body>

<section id="section1" class="visual">
	<!-- width=1200px; height=700px -> width=890px; height=450px -->
	<div><img src="resources/images/banner1.jpg" width=890px; height=450px;></div>
    <div><img src="resources/images/banner2.jpg" width=890px; height=450px;></div>
    <div><img src="resources/images/banner3.jpg" width=890px; height=450px;></div>
    <div><img src="resources/images/banner4.jpg" width=890px; height=450px;></div>
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
</script>


<section id="section3">
</section>
<section id="section4">
<div class="todaybook">
		<h1><strong>오늘의 업데이트 책</strong></h1>
	</div>
<div class="books">
	<div class="book1">
		<div class="cover">
			<img src="resources/images/book1.jpg" alt="북커버 이미지를 불러옵니다.">
		</div>
		<div class="title">
			<b>용사 파티 때려치웁니다</b><br>
			<span>NariaTa</span>
		</div>
	</div>
	<div class="book2">
		<div class="cover">
			<img src="resources/images/book2.jpg" alt="북커버 이미지를 불러옵니다.">
		</div>
		<div class="title">
			<b>기네비어가 되었다</b><br>
			<span>둘리살해자</span>
		</div>
	</div>
	<div class="book3">
		<div class="cover">
			<img src="resources/images/book3.jpg" alt="북커버 이미지를 불러옵니다.">
		</div>
		<div class="title">
			<b>아팔루사는 부서지지 않는다</b><br>
			<span>화력발전소</span>
		</div>
	</div>
	<div class="book4">
		<div class="cover">
			<img src="resources/images/book4.jpg" alt="북커버 이미지를 불러옵니다.">
		</div>
		<div class="title">
			<b>자동사냥이 키운 마녀님</b><br>
			<span>BEbreaker</span>
		</div>
	</div>
	<div class="book5">
		<div class="cover">
			<img src="resources/images/book5.jpg" alt="북커버 이미지를 불러옵니다.">
		</div>
		<div class="title">
			<b>힐링방송 스트리머</b><br>
			<span>딛듣</span>
		</div>
	</div>
	<div class="book6">
		<div class="cover">
			<img src="resources/images/book2.jpg" alt="북커버 이미지를 불러옵니다.">
		</div>
		<div class="title">
			<b>룰루랄라송</b><br>
			<span>딛듣선님입니다</span>
		</div>
	</div>
</div>
</section>

<section id="section5">
<div class="todaybook">
		<h1><strong>북하우스의 오리지널 <span>무협지</span></strong></h1>
	</div>
<div class="books">
	<div class="book1">
		<div class="cover">
			<img src="resources/images/book2.jpg" alt="북커버 이미지를 불러옵니다.">
		</div>
		<div class="title">
			<b>용사 파티 때려치웁니다</b><br>
			<span>NariaTa</span>
		</div>
	</div>
	<div class="book2">
		<div class="cover">
			<img src="resources/images/book5.jpg" alt="북커버 이미지를 불러옵니다.">
		</div>
		<div class="title">
			<b>기네비어가 되었다</b><br>
			<span>둘리살해자</span>
		</div>
	</div>
	<div class="book3">
		<div class="cover">
			<img src="resources/images/book4.jpg" alt="북커버 이미지를 불러옵니다.">
		</div>
		<div class="title">
			<b>아팔루사는 부서지지 않는다</b><br>
			<span>화력발전소</span>
		</div>
	</div>
	<div class="book4">
		<div class="cover">
			<img src="resources/images/book1.jpg" alt="북커버 이미지를 불러옵니다.">
		</div>
		<div class="title">
			<b>자동사냥이 키운 마녀님</b><br>
			<span>BEbreaker</span>
		</div>
	</div>
	<div class="book5">
		<div class="cover">
			<img src="resources/images/book3.jpg" alt="북커버 이미지를 불러옵니다.">
		</div>
		<div class="title">
			<b>힐링방송 스트리머</b><br>
			<span>딛듣</span>
		</div>
	</div>
	<div class="book6">
		<div class="cover">
			<img src="resources/images/book2.jpg" alt="북커버 이미지를 불러옵니다.">
		</div>
		<div class="title">
			<b>룰루랄라송</b><br>
			<span>딛듣선님입니다</span>
		</div>
	</div>
</div>
</section>

<section id="adverbanner">
<div class="adver">
	<p>광고입니다<br>
	당장 클릭하세요!<br>
	이벤트가 광광광~</p>
</div>
</section>

<section id="section6">
<div class="todaybook">
		<h1><strong>지금 새로 나온 책</strong></h1>
	</div>
<div class="books">
	<div class="book1">
		<div class="cover">
			<img src="resources/images/book5.jpg" alt="북커버 이미지를 불러옵니다.">
		</div>
		<div class="title">
			<b>용사 파티 때려치웁니다</b><br>
			<span>NariaTa</span>
		</div>
	</div>
	<div class="book2">
		<div class="cover">
			<img src="resources/images/book4.jpg" alt="북커버 이미지를 불러옵니다.">
		</div>
		<div class="title">
			<b>기네비어가 되었다</b><br>
			<span>둘리살해자</span>
		</div>
	</div>
	<div class="book3">
		<div class="cover">
			<img src="resources/images/book3.jpg" alt="북커버 이미지를 불러옵니다.">
		</div>
		<div class="title">
			<b>아팔루사는 부서지지 않는다</b><br>
			<span>화력발전소</span>
		</div>
	</div>
	<div class="book4">
		<div class="cover">
			<img src="resources/images/book2.jpg" alt="북커버 이미지를 불러옵니다.">
		</div>
		<div class="title">
			<b>자동사냥이 키운 마녀님</b><br>
			<span>BEbreaker</span>
		</div>
	</div>
	<div class="book5">
		<div class="cover">
			<img src="resources/images/book1.jpg" alt="북커버 이미지를 불러옵니다.">
		</div>
		<div class="title">
			<b>힐링방송 스트리머</b><br>
			<span>딛듣</span>
		</div>
	</div>
	<div class="book6">
		<div class="cover">
			<img src="resources/images/book4.jpg" alt="북커버 이미지를 불러옵니다.">
		</div>
		<div class="title">
			<b>룰루랄라송</b><br>
			<span>딛듣선님입니다</span>
		</div>
	</div>
</div>
</section>
<section id="section2" class="notice_top">
  <div class="notice_wrap">
    <ul class="notice_rolling">
      <li><a href="#"><i>공지</i> Ebook 공식 SNS와 친구가 되어주세요!</a></li>
      <li><a href="#"><i>공지</i> 지금 쿠키를 충전하면 1+1 !</a></li>
      <li><a href="#"><i>공지</i> 고객센터 휴무안내</a></li>
      <li><a href="#"><i>공지</i> Ebook 업데이트 변경사항</a></li>
      <li><a href="#"><i>공지</i> Ebook 서비스 점검 안내 공지</a></li>
      <li><a href="#"><i>공지</i> Ebook 서버 증설 안내 공지</a></li>
    </ul>
  </div>
</section>
</body>
</html>