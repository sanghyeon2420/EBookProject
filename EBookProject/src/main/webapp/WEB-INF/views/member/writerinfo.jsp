<%@page import="org.springframework.ui.Model"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="../../include/include.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>writerInfo</title>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="resources/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="resources/css/bootstrap.min.css">
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
</script>
<style>
.setTitle { 
      display: grid;
      grid-template-areas: 
        "nav header header"
        "nav article article";
      grid-template-rows: 45% 55%;
      grid-template-columns: 20% 40% 40%;
      grid-gap: 20px;
      height: 40vh;
      margin: 0;
      }
    
    #navPicture {
      grid-area: nav;
    }
    
    #headTitle { 
      grid-area: header;  
      margin-left:20px;
      width:41.3vw;
      height:32vh;    
    }
      
    #container { 
      grid-area: article;
      display: flex;
      text-align: center;
      height:8vh;
    }
      
	.detail {
  	margin-left:0.8rem;
	}

	.item {
		flex: 0.5;
    	display:inline-block;
    	position: relative;
    	margin: 7px 14px;
    	color:#262626;
    	font-size: 1.5vh;
	    background:#2bb33698;
	}
	.back {
	background-color: #d9e7ff;
	}
.text {
	margin: 0;
	padding: 0;
	height: 8vh;
}
.text p {
	clear: both;
	margin: 20px 20px;
	height: 3vh;
	font-size: 18px;
	align-items: center;
}
#mainArticle .writerbooklist {
	height: 35vh;
	display: flex;
	margin: 0;
	clear: both;
	justify-content: space-around;
	
	flex-direction: row;
	flex-wrap: wrap;
	overflow: auto;
	flex-flow: row nowrap;
}
#mainArticle .writerbookcover {
	width: 14vw;
	height: 22vh;
	padding: 0;
	margin: 0;
}
#mainArticle .writerbookcover img{
	width: 12vw;
	height: 22vh;
	display: block;
	margin: auto;
}
.writerbookcover a {
	margin: 10px 0;
	font-weight: 400;
	text-align: center;
}

.addnovel{
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
  

			<div class="setTitle">
				<div id="navPicture">
					<img src="resources/images/writer/${dto.imagefile_no }" alt="작가 이미지 불러옵니다." width="240px"
						height="300px">
				</div>
				<div id="headTitle">
					<div class="name">
						<h1>${dto.w_name} 님</h1>
						<strong>받은 추천수  </strong><span id="span_hits">${dto.w_hits }</span> <i class="far fa-heart"></i><br>
						<strong>가지고 있는 쿠키</strong>&nbsp;${memberDTO.cash }&nbsp;<i class="fas fa-cookie-bite"></i>
					</div>
				</div>
				<div class="container" id="container">
					<div class="item">
					<a href="${pageContext.request.contextPath}/writer/insertBook">
						<br><i class="fas fa-book-open"></i> 내 작품 등록하기<br>
					</a>
					</div>
				</div>
			</div>
			<div id="mainDetail">
				<div class="detail">
					<h4>공지하기</h4>
					<p id=writerNotice>
						일신상의 사정으로 인해 7월~8월 휴재예정입니다. <br>
						9월에 다시 찾아뵙겠습니다. 감사합니다.  <br>
					</p>
				</div>
			</div>
			<div class="back">
                <div class="text">
                    <p><strong>${dto.w_name }</strong>님의 연재 소설</p>
                </div>
                <div class="writerbooklist">
                    <c:forEach var="list" items="${list }">
                    <div class="writerbookcover">
                       <div class="cover">
                           <img src="resources/images/${list.b_category }/${list.imagefileName }" alt="북커버 이미지를 불러옵니다." /><br>
                           <a href="/EBookProject/book/detail?idx=${list.ebook_no }"><h4> <b>${list.b_name}</b> </h4></a>
                           <div class="addnovel">
                           <button class="btn btn-primary" onclick="#" >회차 등록</button> &nbsp;
                           </div>
                       </div>
                   </div>
                   </c:forEach>
               </div>
           </div>
			
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