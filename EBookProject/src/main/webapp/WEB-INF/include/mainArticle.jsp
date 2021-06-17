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
</head>
<body>  

<section id="section1" class="visual">
	<!-- width=1200px; height=700px -> width=890px; height=450px -->
	<div><img src="resources/images/banner1.jpg" width=1200px; height=700px;></div>
    <div><img src="resources/images/banner2.jpg" width=1200px; height=700px;></div>
    <div><img src="resources/images/banner3.jpg" width=1200px; height=700px;></div>
    <div><img src="resources/images/banner4.jpg" width=1200px; height=700px;></div>
</section>


<section id="section3">
<div class="rank">
	<div class="title">
			<h1>TOP5</h1>
	</div>
	<hr>
	<div class="bookrank">
		<div class="bookrank1">
			<p>1</p><img src="resources/css/bookCover/나의_소중한_소꿉친구_커버.jpg" >
			<div class="text">
				<br><a href="#" style=color:green;>로맨스</a>
				<h2>나의 소중한 소꿉친구</h2>
				<h4>도톨</h4>
			</div>
		</div><hr>
		<div class="bookrank2">
			<p>2</p><img src="resources/css/bookCover/포커스_인_투유_커버.jpg" >
			<div class="text">
				<a href="#" style=color:green;>로맨스</a>
				<h2>나의 소중한 소꿉친구</h2>
				<h4>도톨</h4>
			</div>
		</div><hr>
		<div class="bookrank3">
			<p>3</p><img src="resources/css/bookCover/환골탈태하고 헌터되기.jpg" >
			<div class="text">
				<a href="#" style=color:green;>로맨스</a>
				<h2>나의 소중한 소꿉친구</h2>
				<h4>도톨</h4>
			</div>
		</div><hr>
		<div class="bookrank4">
			<p>4</p><img src="resources/css/bookCover/스타프로젝트_원영_커버.jpg" >
			<div class="text">
				<a href="#" style=color:green;>로맨스</a>
				<h2>나의 소중한 소꿉친구</h2>
				<h4>도톨</h4>
			</div>
		</div><hr>
		<div class="bookrank5">
			<p>5</p><img src="resources/css/bookCover/굿_엔딩에_올인_커버.jpg" >
			<div class="text">
				<a href="#" style=color:green;>로맨스</a>
				<h2>나의 소중한 소꿉친구</h2>
				<h4>도톨</h4>
			</div>
		</div><hr>
	</div>
</div>
</section>


<section id="section4">
<div class="todaybook">
		<h1><strong>오늘의 업데이트</strong></h1>
	</div>
<div class="books">
	<div class="book1">
		<div class="cover">
			<img src="resources/css/bookCover/굿_엔딩에_올인_커버.jpg" alt="북커버 이미지를 불러옵니다.">
		</div>
		<div class="title">
			<a href="#" style=color:green;>판타지</a><br>
			<a href="#open">
			<b style=font-size:18px;>굿 엔딩에 올인</b><br>
			<span>루엘</span></a>	
		    <div class="white_content" id="open">
		        <div>
		          <p><h3><b>굿 엔딩에 올인</b></h3><br>
		           <img src="resources/css/bookCover/굿_엔딩에_올인_커버.jpg" >
		           <p><b> 판타지 / 모험  </b><br>
		           <p><b> 줄거리 </b>:  “ 엘레쥬에 빙의한 것 같다. 이거 진짜 현실이야?”  <br>
				   <p><b> 한줄 대사 </b>: “누구 하나 잡아서 굿 엔딩을 보면 되는 거 아닐까?” <br><br>
		          <a href="resources/page/pageGoodEnding.jsp"><button>자세히보기</button></a>
		          <a href="#close"><button>닫기</button></a></p>
		        </div>
		    	</div>
		</div>
	</div>
	<div class="book2">
		<div class="cover">
			<img src="resources/css/bookCover/굿!모닝 키스의 전설.jpg" alt="북커버 이미지를 불러옵니다.">
		</div> 
		<div class="title">
			<a href="#" style=color:green;>로맨스</a><br>
			<a href="#open1">
			<b style=font-size:18px;>굿!모닝 키스의 전설</b><br>
			<span>석영아</span></a>
				<div class="white_content" id="open1">
		        <div>
		          <p><h3><b>굿!모닝 키스의 전설</b></h3><br>
		           <img src="resources/css/bookCover/굿!모닝 키스의 전설.jpg" >
		           <p><b> 로맨스 </b><br>
		           <p><b> 줄거리 </b>:  "키스 한 번에 전설의 용을 깨운 여자, 다연과 천 년 넘게 잠들어있던 본능을 각성한 남자, 용이의 신비롭고 이상야릇한 러브 판타지"<br>
		           <p><b> 한줄 대사 </b>: "너에게 키스하는 순간부터, 우린 영원히, 끝도 없이 긴 사랑을 나누게 될 거야."<br><br>
		          <a href="resources/page/pageGoodMorning.jsp"><button>자세히보기</button></a>
		          <a href="#close"><button>닫기</button></a></p>
		        </div>
		    	</div>
		</div>
	</div>
	<div class="book3">
		<div class="cover">
			<img src="resources/css/bookCover/나의_소중한_소꿉친구_커버.jpg" alt="북커버 이미지를 불러옵니다.">
		</div>
		<div class="title">
			<a href="#" style=color:green;>로맨스</a><br>
			<a href="#open2">
			<b style=font-size:18px;>나의 소중한 소꿉친구</b><br>
			<span>도톨</span></a>
			<div class="white_content" id="open2">
		        <div>
		          <p><h3><b>나의 소중한 소꿉친구</b></h3><br>
		           <img src="resources/css/bookCover/나의_소중한_소꿉친구_커버.jpg" >
		           <p><b> 로맨스 </b><br>
		           <p><b> 줄거리 </b>:  "엉뚱발랄한 소녀 로해다와 티격태격 소꿉친구 허민우. 유쾌하고 따뜻하지만, 때론 씁쓸한.. 소중한 러브코미디" <br>
		           <p><b> 한줄 대사 </b>:  " 티격태격하긴해도, 날 위해주려 노력하는모습이 슬며시 드러나니 미워할수 없는 녀석이다. 그런데 왜 일까?" <br><br>
		          <a href="resources/page/pageMyfriend.jsp"><button>자세히보기</button></a>
		          <a href="#close"><button>닫기</button></a></p>
		        </div>
		    	</div>
		</div>
	</div>
	<div class="book4">
		<div class="cover">
			<img src="resources/css/bookCover/다시태어난호박.jpg" alt="북커버 이미지를 불러옵니다.">
		</div>
		<div class="title">
			<a href="#" style=color:green;>판타지</a><br>
			<a href="#open3">
			<b style=font-size:18px;>싸움의 기술</b><br>
			<span>델타포스</span></a>
			<div class="white_content" id="open3">
		        <div>
		          <p><h3><b>싸움의 기술</b></h3><br>
		           <img src="resources/css/bookCover/다시태어난호박.jpg" >
		           <p><b> 판타지 </b><br>
		           <p><b> 줄거리 </b>:  "타 학교 학생들과 싸움을 하게 되었고 도윤이는 싸움에서 위기를 맞게 되었다. 과연 도윤이의 운명은 어떻게 될것인가?"<br>
		           <p><b> 한줄 대사 </b>: "믿어야 될 사람은 나 자신뿐" <br><br>
		          <a href="resources/page/pagePungkin.jsp"><button>자세히보기</button></a>
		          <a href="#close"><button>닫기</button></a></p>
		        </div>
		    	</div>
		</div>
	</div>
	<div class="book5">
		<div class="cover">
			<img src="resources/css/bookCover/무림순경.jpg" alt="북커버 이미지를 불러옵니다.">
		</div>
		<div class="title">
			<a href="#" style=color:green;>무협지</a><br>
			<a href="#open4">
			<b style=font-size:18px;>무림순경</b><br>
			<span>지챤주</span></a>
			<div class="white_content" id="open4">
		        <div>
		          <p><h3><b>무림순경</b></h3><br>
		           <img src="resources/css/bookCover/무림순경.jpg" >
		           <p><b> 액션 </b><br>
		           <p><b> 줄거리 </b>:  "무림속에서 홀로 힘듬을 견뎌내는 무림순경의 액션무협" <br>
		           <p><b> 한줄 대사 </b>:  "그 누구도 나를 이기기 전까지는 이 곳을 지나갈 수 없다. <br><br>
		          <a href="resources/page/pagePolice.jsp"><button>자세히보기</button></a>
		          <a href="#close"><button>닫기</button></a></p>
		        </div>
		    	</div>
		</div>
	</div>
	<div class="book6">
		<div class="cover">
			<img src="resources/css/bookCover/환골탈태하고 헌터되기.jpg" alt="북커버 이미지를 불러옵니다.">
		</div>
		<div class="title">
			<a href="#" style=color:green;>무협지</a><br>
			<a href="#open5">
			<b style=font-size:18px;>환골탈태하고 헌터되기</b><br>
			<span>기뮤치뮤</span></a>
			<div class="white_content" id="open5">
		        <div>
		          <p><h3><b>환골탈태하고 헌터되기</b></h3><br>
		           <img src="resources/css/bookCover/환골탈태하고 헌터되기.jpg" >
		           <p><b> 액션 / 판타지</b><br>
		           <p><b> 줄거리 </b>:  "지긋지긋한 이 세상에서 헌터로 살아남기" <br>
		           <p><b> 한줄 대사 </b>:  "내가 이 구역의 진정한 헌터야!"<br><br>
		          <a href="resources/page/pageBone.jsp"><button>자세히보기</button></a>
		          <a href="#close"><button>닫기</button></a></p>
		        </div>
		    	</div>
		</div>
	</div>
</div>
</section>

<section id="section5">
<div class="todaybook">
		<h1><strong>북하우스의 오리지널 <span style=color:#ff00e1;>&quot;Romance&quot;</span></strong></h1>
	</div>
<div class="books">
	<div class="book1">
		<div class="cover">
			<img src="resources/css/bookCover/굿!모닝 키스의 전설.jpg" alt="북커버 이미지를 불러옵니다.">
		</div>
		<div class="title">
			<a href="#" style=color:green;>로맨스</a><br>
			<a href="#open1">
			<b style=font-size:18px;>용사 파티 때려치웁니다</b><br>
			<span>NariaTa</span>
			<div class="white_content" id="open1">
		        <div>
		          <p><h3><b>굿!모닝 키스의 전설</b></h3><br>
		           <img src="resources/css/bookCover/굿!모닝 키스의 전설.jpg" >
		           <p><b> 로맨스 </b><br>
		           <p><b> 줄거리 </b>:  "키스 한 번에 전설의 용을 깨운 여자, 다연과 천 년 넘게 잠들어있던 본능을 각성한 남자, 용이의 신비롭고 이상야릇한 러브 판타지"<br>
		           <p><b> 한줄 대사 </b>: "너에게 키스하는 순간부터, 우린 영원히, 끝도 없이 긴 사랑을 나누게 될 거야."<br><br>
		          <a href="#close"><button>자세히보기</button></a>
		          <a href="#close"><button>닫기</button></a></p>
		        </div>
		    	</div>
		</div>
	</div>
	<div class="book2">
		<div class="cover">
			<img src="resources/css/bookCover/크리스마스_러브스토리_커버.jpg" alt="북커버 이미지를 불러옵니다.">
		</div>
		<div class="title">
			<a href="#" style=color:green;>로맨스</a><br>
			<a href="#open6">
			<b style=font-size:18px;>크리스마스 러브 스토리</b><br>
			<span>둘리살해자</span>
			<div class="white_content" id="open6">
				<div>
				  <p><h3><b>크리스마스 러브 스토리</b></h3>
				  <img src="resources/css/bookCover/크리스마스_러브스토리_커버.jpg">
				  <p><b> 로맨스 </b><br>
		          <p><b> 줄거리 </b>:
		          <p><b> 한줄 대사 </b>:
		         <a href="#close"><button>자세히보기</button></a>
		         <a href="#close"><button>닫기</button></a></p>
		        </div>
		    	</div>
		</div>
	</div>
	<div class="book3">
		<div class="cover">
			<img src="resources/css/bookCover/스타프로젝트_원영_커버.jpg" alt="북커버 이미지를 불러옵니다.">
		</div>
		<div class="title">
			<a href="#" style=color:green;>로맨스</a><br>
			<a href="#open7">
			<b style=font-size:18px;>스타프로젝트 원영</b><br>
			<span>화력발전소</span>
			<div class="white_content" id="open7">
				<div>
				  <p><h3><b>스타프로젝트 원영</b></h3>
				  <img src="resources/css/bookCover/스타프로젝트_원영_커버.jpg">
				  <p><b> 로맨스 </b><br>
		          <p><b> 줄거리 </b>:
		          <p><b> 한줄 대사 </b>:
		         <a href="#close"><button>자세히보기</button></a>
		         <a href="#close"><button>닫기</button></a></p>
		        </div>
		    	</div>
		</div>
	</div>
	<div class="book4">
		<div class="cover">
			<img src="resources/css/bookCover/동화나라_발렌타인데이_커버.jpg" alt="북커버 이미지를 불러옵니다.">
		</div>
		<div class="title">
			<a href="#" style=color:green;>로맨스</a><br>
			<a href="#open8">
			<b style=font-size:18px;>자동사냥이 키운 마녀님</b><br>
			<span>BEbreaker</span>
			<div class="white_content" id="open8">
				<div>
				  <p><h3><b>동화나라 발렌타인데이</b></h3>
				  <img src="resources/css/bookCover/동화나라_발렌타인데이_커버.jpg">
				  <p><b> 로맨스 </b><br>
		          <p><b> 줄거리 </b>:
		          <p><b> 한줄 대사 </b>:
		         <a href="#close"><button>자세히보기</button></a>
		         <a href="#close"><button>닫기</button></a></p>
		        </div>
		    	</div>
		</div>
	</div>
	<div class="book5">
		<div class="cover">
			<img src="resources/css/bookCover/나의_소중한_소꿉친구_커버.jpg" alt="북커버 이미지를 불러옵니다.">
		</div>
		<div class="title">
			<a href="#" style=color:green;>로맨스</a><br>
			<a href="#open2">
			<b style=font-size:18px;>힐링방송 스트리머</b><br>
			<span>딛듣</span>
			<div class="white_content" id="open2">
		        <div>
		          <p><h3><b>나의 소중한 소꿉친구</b></h3><br>
		           <img src="resources/css/bookCover/나의_소중한_소꿉친구_커버.jpg" >
		           <p><b> 로맨스 </b><br>
		           <p><b> 줄거리 </b>:  "엉뚱발랄한 소녀 로해다와 티격태격 소꿉친구 허민우. 유쾌하고 따뜻하지만, 때론 씁쓸한.. 소중한 러브코미디" <br>
		           <p><b> 한줄 대사 </b>:  " 티격태격하긴해도, 날 위해주려 노력하는모습이 슬며시 드러나니 미워할수 없는 녀석이다. 그런데 왜 일까?" <br><br>
		          <a href="#close"><button>자세히보기</button></a>
		          <a href="#close"><button>닫기</button></a></p>
		        </div>
		    	</div>
		</div>
	</div>
	<div class="book6">
		<div class="cover">
			<img src="resources/css/bookCover/굿!모닝 키스의 전설.jpg" alt="북커버 이미지를 불러옵니다.">
		</div>
		<div class="title">
			<a href="#" style=color:green;>로맨스</a><br>
			<a href="#open9">
			<b style=font-size:18px;>룰루랄라송</b><br>
			<span>딛듣선님입니다</span>
			<div class="white_content" id="open9">
				<div>
				  <p><h3><b>동화나라 발렌타인데이</b></h3>
				  <img src="resources/css/bookCover/굿!모닝 키스의 전설.jpg">
				  <p><b> 로맨스 </b><br>
		          <p><b> 줄거리 </b>:
		          <p><b> 한줄 대사 </b>:
		         <a href="#close"><button>자세히보기</button></a>
		         <a href="#close"><button>닫기</button></a></p>
		        </div>
		    	</div>
		</div>
	</div>
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
	<div class="book1">
		<div class="cover">
			<img src="resources/images/books5.jpg" alt="북커버 이미지를 불러옵니다.">
		</div>
		<div class="title">
			<a href="#" style=color:green;>로맨스</a><br>
			<a href="#open9">
			<b style=font-size:18px;>용사 파티 때려치웁니다</b><br>
			<span>NariaTa</span>
			<div class="white_content" id="open9">
				<div>
				  <p><h3><b>동화나라 발렌타인데이</b></h3>
				  <img src="resources/css/bookCover/굿!모닝 키스의 전설.jpg">
				  <p><b> 로맨스 </b><br>
		          <p><b> 줄거리 </b>:
		          <p><b> 한줄 대사 </b>:
		         <a href="#close"><button>자세히보기</button></a>
		         <a href="#close"><button>닫기</button></a></p>
		        </div>
		    	</div>
		</div>
	</div>
	<div class="book2">
		<div class="cover">
			<img src="resources/images/books4.jpg" alt="북커버 이미지를 불러옵니다.">
		</div>
		<div class="title">
			<a href="#" style=color:green;>로맨스</a><br>
			<a href="#open9">
			<b style=font-size:18px;>기네비어가 되었다</b><br>
			<span>둘리살해자</span> 
			<div class="white_content" id="open9">
				<div>
				  <p><h3><b>동화나라 발렌타인데이</b></h3>
				  <img src="resources/css/bookCover/굿!모닝 키스의 전설.jpg">
				  <p><b> 로맨스 </b><br>
		          <p><b> 줄거리 </b>:
		          <p><b> 한줄 대사 </b>:
		         <a href="#close"><button>자세히보기</button></a>
		         <a href="#close"><button>닫기</button></a></p>
		        </div>
		    	</div>
		</div>
	</div>
	<div class="book3">
		<div class="cover">
			<img src="resources/images/books3.jpg" alt="북커버 이미지를 불러옵니다.">
		</div>
		<div class="title">
			<a href="#" style=color:green;>로맨스</a><br>
			<a href="#open9">
			<b style=font-size:18px;>아팔루사는 부서지지 않는다</b><br>
			<span>화력발전소</span>
			<div class="white_content" id="open9">
				<div>
				  <p><h3><b>동화나라 발렌타인데이</b></h3>
				  <img src="resources/css/bookCover/굿!모닝 키스의 전설.jpg">
				  <p><b> 로맨스 </b><br>
		          <p><b> 줄거리 </b>:
		          <p><b> 한줄 대사 </b>:
		         <a href="#close"><button>자세히보기</button></a>
		         <a href="#close"><button>닫기</button></a></p>
		        </div>
		    	</div>
		</div>
	</div>
	<div class="book4">
		<div class="cover">
			<img src="resources/images/books2.jpg" alt="북커버 이미지를 불러옵니다.">
		</div>
		<div class="title">
			<a href="#" style=color:green;>로맨스</a><br>
			<a href="#open9">
			<b style=font-size:18px;>자동사냥이 키운 마녀님</b><br>
			<span>BEbreaker</span>
			<div class="white_content" id="open9">
				<div>
				  <p><h3><b>동화나라 발렌타인데이</b></h3>
				  <img src="resources/css/bookCover/굿!모닝 키스의 전설.jpg">
				  <p><b> 로맨스 </b><br>
		          <p><b> 줄거리 </b>:
		          <p><b> 한줄 대사 </b>:
		         <a href="#close"><button>자세히보기</button></a>
		         <a href="#close"><button>닫기</button></a></p>
		        </div>
		    	</div>
		</div>
	</div>
	<div class="book5">
		<div class="cover">
			<img src="resources/images/books1.jpg" alt="북커버 이미지를 불러옵니다.">
		</div>
		<div class="title">
			<a href="#" style=color:green;>로맨스</a><br>
			<a href="#open9">
			<b style=font-size:18px;>힐링방송 스트리머</b><br>
			<span>딛듣</span>
			<div class="white_content" id="open9">
				<div>
				  <p><h3><b>동화나라 발렌타인데이</b></h3>
				  <img src="resources/css/bookCover/굿!모닝 키스의 전설.jpg">
				  <p><b> 로맨스 </b><br>
		          <p><b> 줄거리 </b>:
		          <p><b> 한줄 대사 </b>:
		         <a href="#close"><button>자세히보기</button></a>
		         <a href="#close"><button>닫기</button></a></p>
		        </div>
		    	</div>
		</div>
	</div>
	<div class="book6">
		<div class="cover">
			<img src="resources/images/books4.jpg" alt="북커버 이미지를 불러옵니다.">
		</div>
		<div class="title">
			<a href="#" style=color:green;>로맨스</a><br>
			<a href="#open9">
			<b style=font-size:18px;>룰루랄라송</b><br>
			<span>딛듣선님입니다</span>
			<div class="white_content" id="open9">
				<div>
				  <p><h3><b>동화나라 발렌타인데이</b></h3>
				  <img src="resources/css/bookCover/굿!모닝 키스의 전설.jpg">
				  <p><b> 로맨스 </b><br>
		          <p><b> 줄거리 </b>:
		          <p><b> 한줄 대사 </b>:
		         <a href="#close"><button>자세히보기</button></a>
		         <a href="#close"><button>닫기</button></a></p>
		        </div>
		    	</div>
		</div>
	</div>
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