<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="../../include/include.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="resources/css/bootstrap.min.css">
<style type="text/css">
	.search1 {
		width: 100%;
    	position: relative;
    	display: flex;
	}
	form {
		width: 100%;
		display: flex;
		position: relative;
	}
	.body {
		width: 100%;
		display: flex;
		flex-flow: column;
		padding: 10px;
	}
	
	h2 {
		padding-left: 20%; 
	}
	
	.search2 {
		display: flex;
		justify-content: center;
	}
	
	.search_in {
	    width: 70%;
	    height: 25vh;
	    display: flex;
	    flex-direction: column;
	    justify-content: space-around;
	}
	.form2 {
		display: flex;
		justify-content: center;
	}
	.form2 input {
		width: 80%;
	}
	
	.search_btn {
        width: 30%;
	    display: flex;
	    flex-direction: column;
	    justify-content: center;
	    align-items: center;
	}
	
	#search_pw_btn, #search_id_btn {
		width: 50%;
		height: 25%;
		border-radius: 5px;
		border: 1px solid skyblue;
		background-color: rgba(0,0,0,0);
		color: skyblue;
		padding: 5px;
	}
	
	#search_id_btn:hover {
		color: white;
		background-color: skyblue;
	}
	
	#search_pw_btn:hover {
		color: white;
		background-color: skyblue;
	}
</style>
<title>아이디/비밀번호찾기</title>
<script src="resources/js/jquery-3.4.1.min.js"></script>
<script>
$(document).ready(function(){
	$("#search_id_btn").click(function(){
		alert("이메일로 아이디가 발송되었습니다.");
		document.form1.submit();
	});
	
	$("#search_pw_btn").click(function(){
		alert("이메일로 비밀번호가 발송되었습니다.");
		document.form2.submit();
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

	<!-- 아이디 찾기 -->
	<div class="search1">
		<form method="post" action="<%=request.getContextPath()%>/member/searchid" name="form1">
		<div class="body">
			<h2>아이디 찾기</h2>
			<div class="search2">
				<div class="search_in">
					<div class="form2">
						<label for="username">이름  :&nbsp;</label> <input type="text"
							name="username" id="username" placeholder="이름을 입력하세요">
					</div>
					<div class="form2">
						<label for="birthdate">생일  :&nbsp;</label> <input type="text"
							name="birthdate" id="birthdate" placeholder="ex) 931207">
					</div>
					<div class="form2">
						<label for="nickname">닉네임:&nbsp;</label> <input type="text"
							name="nickname" id="nickname" placeholder="닉네임을 입력하세요">
					</div>
				</div>
				<div class="search_btn">
					<button type="button" id="search_id_btn" name="search_id_btn">찾기</button>
				</div>
			</div>
		</div>
		</form>



		<!-- 비밀번호 찾기 -->
			<form method="post" action="<%=request.getContextPath()%>/member/searchpw" name="form2">
			<div class="body">
			<h2>비밀번호 찾기</h2>
			<div class="search2">
				<div class="search_in">
					<div class="form2">
						<label for="userid">아이디:&nbsp;</label> <input type="text"
							name="userid" id="userid" placeholder="아이디를 입력하세요">
					</div>
					<div class="form2">
						<label for="username">이름  :&nbsp;</label> <input type="text"
							name="username" id="username" placeholder="이름을 입력하세요">
					</div>
					<div class="form2">
						<label for="birthdate">생일  :&nbsp;</label> <input type="text"
							name="birthdate" id="birthdate" placeholder="ex) 931207">
					</div>
				</div>
				<div class="search_btn">
					<button type="button" id="search_pw_btn" name="search_pw_btn">찾기</button>
				</div>
			</div>
		</div>
	</form>
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