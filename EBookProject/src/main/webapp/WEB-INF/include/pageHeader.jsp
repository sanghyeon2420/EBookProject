<%
	String path = request.getContextPath();
%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>

<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.6.3/css/all.css"
	crossorigin="anonymous">
<link rel="stylesheet" href="resources/css/pageHeader.css">

<nav class="main_header">
	<!-- Header logo -->
	<div class="Ebook_logo">
		<a href="<%=path%>/"> <img src="resources/images/logo_image.jpg"
			width="100px" height="100px">
		</a>
	</div>

	<div class="center">

		<!-- Search -->
		<div class="Search">
			<input type="text" class="searchTerm" placeholder="Search">
			<button type="submit" class="searchButton">
				<i class="fas fa-search"></i>
			</button>
		</div>

		<!-- Menuber -->
		<div class="menu">
			<ul class="menu_list">
				<li><a href="<%=path%>/">Home</a></li>
				<c:forEach var="list" items="${booklist}">


					<li><a href="/EBookProject/book/list?idx=${list.category_no}">${list.category_name}</a></li>
				</c:forEach>

				<li><a href="<%=path%>/board/list">커뮤니티</a></li>
				<li><a href="<%=path%>/notic">공지사항</a></li>
			</ul>
		</div>
	</div>

	<!-- Login&Join icon -->
	<div class="Ebook_icons">
			
			<c:if test="${member.isAdmin == 2 }">
				<a href="member/admin">관리자페이지로 전환</a>
			</c:if>
			
			
			<c:if test="${member != null}">
				<a href="EBookProject/member/detail?membernumber=${member.user_no}">${member.nickname}</a>
			</c:if>
			
			
			
			<c:if test="${member == null}">
			<a href="<%=path%>/member/login" id="login" title="로그인"><i
        	 class="fas fa-user"></i></a> <a href="<%=path%>/member/join" id="join"
         	title="회원가입"><i class="fas fa-id-card"></i></a>
			</c:if>
			
			<c:if test="${member != null}">
			<a href="member/setting" title="회원정보"><i class="fas fa-cog"></i></a>
			</c:if>
			
			&nbsp;&nbsp;&nbsp;&nbsp;
         	<button type="button" id="logout">로그아웃</button>
				
			




	</div>

</nav>