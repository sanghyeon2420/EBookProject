<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="../../include/include.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원정보수정</title>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="resources/js/bootstrap.min.js"></script>

<link rel="stylesheet" type="text/css" href="resources/css/bootstrap.min.css">
<script type="text/javascript">
//로그아웃
$(document).ready(function(){
	$("#logout").click(function(){
		location.href="${pageContext.request.contextPath}/member/logout";
	});
});

function updateSubmit(){
	document.form1.submit();
}
</script>

<style type="text/css">
.update {
      width: 100%;
      height: 100%;
      display: flex;
      justify-content: center;
    }

    .updates {
      width: 70%;
    }

    .updateheader {}

    .updatebody {
      padding: 0;
    }

    .updatebody li {
      width: 55%;
      height: 5vh;
      display: flex;
      padding: 10px;
      list-style: none;
      align-items: center;
    }

    .updatebody input {
      width: 55%;
      height: 5vh;
      display: flex;
      padding: 7px;
      margin: 3px;
      list-style: none;
      align-items: center;
      border-radius: 5px;
    }

    .bodyline {
      display: flex;
    }

    .line-box {
      position: relative;
      width: 100%;
      height: 2px;
      background: #BCBCBC;
    }

    .line {
      position: absolute;
      width: 0%;
      height: 2px;
      top: 0px;
      left: 50%;
      transform: translateX(-50%);
      background: #8BC34A;
      transition: ease .6s;
    }

    .first {
      width: 30%;
      height: 5vh;
      display: flex;
      padding: 10px;
      margin: 0;
      align-items: center;
      justify-content: center;
    }

    .ct {
      width: 3%;
      height: 5vh;
      display: flex;
      align-items: center;

    }

    .ctn {
      width: 2px;
      height: 3vh;
      display: flex;
      background: #BCBCBC;
      justify-content: center;
    }

    .bt {
      width: 12%;
      height: 5vh;
      display: flex;
      align-items: center;
      justify-content: center;
    }

    .btn-secondary {
      width: 65%;
      height: 4vh;
    }

    .footerline {
      width: 100%;
      display: flex;
      justify-content: space-around;
    }

    .footerline a {
      margin: 10px;
    }
</style>
</head>
<body>
	<header id="pageHeader"> 
	<!-- Header --> 
		<%@ include file="../../include/pageHeader.jsp"%> 
	</header>

	<article id="mainArticle"> 
		<form name="form1" class="update" action="<%=request.getContextPath() %>/member/updateMember" method="post">
		<input type="hidden" name="user_no" id="user_no" value="${member.user_no}"/>
	      <div class="updates">
	        <div class="updateheader">
	          <h1>회원정보수정</h1>
	          <br>
	          <h4>수정할 회원정보를 입력해주세요</h4>
	          <br>
	        </div>
	        <!-- 분기선 -->
	        <div class="line-box">
	          <div class="line"></div>
	        </div>
	
	        <div class="updatebody">
	          <div class="bodyline">
	            <div class="first">아이디 </div>
	            <div class="ct">
	              <div class="ctn"></div>
	            </div>
	            <li>${member.userid}</li>
	          </div>
	
	
	          <div class="bodyline">
	            <label for="userpw" class="first" >비밀번호 </label>
	            <div class="ct">
	              <div class="ctn"></div>
	            </div>
	            <input type="text" name="userpw" value="${member.userpw}">
	          </div>
	
	          <div class="bodyline">
	            <label for="nickname" class="first">닉네임 </label>
	            <div class="ct">
	              <div class="ctn"></div>
	            </div>
	            <input type="text" name="nickname" value="${member.nickname}">
	          </div>
	          <div class="bodyline">
	            <div class="first">이름 </div>
	            <div class="ct">
	              <div class="ctn"></div>
	            </div>
	            <li>${member.username}</li>
	          </div>
	
	          <div class="bodyline">
	            <label for="email" class="first">이메일 </label>
	            <div class="ct">
	              <div class="ctn"></div>
	            </div>
	            <input type="text" name="email" value="${member.email}">
	          </div>
	
	
	          <div class="bodyline">
	            <label for="birthdate" class="first">생년월일 </label>
	            <div class="ct">
	              <div class="ctn"></div>
	            </div>
	            <input type="text" name="birthdate" value='<fmt:formatDate value="${member.birthdate}" pattern='yyMMdd' />'>
	          </div>
	
	          <!-- 분기선 -->
	          <div class="line-box">
	            <div class="line"></div>
	          </div>
	          <!-- 하단 버튼 -->
	          <div class="footerline">
	            <a href="javascript:updateSubmit()" type="button" class="btn btn-primary">수정</a>
	            <a href="<%=path%>/" type="button" class="btn btn-primary">취소</a>
	            <a href="<%=request.getContextPath() %>/member/deleteMember?user_no=${member.user_no}" type="button" class="btn btn-primary">탈퇴</a>
	           
	          </div>
	        </div>
	      </div>
	    </form>
	</article>

	<nav id="mainNav"> 
	<!-- Nav --> 
		<%@ include	file="../../include/mainNav.jsp"%> 
	</nav>

	<div id="siteAds">
	<!-- Ads -->
		<%@ include file="../../include/siteAds.jsp"%>
	</div>


	<footer id="pageFooter"> 
	<!-- Footer --> 
		<%@ include	file="../../include/pageFooter.jsp"%> 
	</footer>
</body>
</html>