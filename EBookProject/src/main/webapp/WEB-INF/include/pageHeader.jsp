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
				<div class="col-md-3 col-sm-3 col-xs-6"> 
				<li><a href="<%=path%>/" class="btn btn-sm animated-button victoria-three">Home</a></li>
				</div>
				<c:forEach var="list" items="${booklist}">
					<div class="col-md-3 col-sm-3 col-xs-6"> 
					<li><a href="/EBookProject/book/list?idx=${list.category_no}" class="btn btn-sm animated-button victoria-three">${list.category_name}</a></li>
					</div>
				</c:forEach>
				<div class="col-md-3 col-sm-3 col-xs-6"> 
				<li><a href="<%=path%>/board/list" class="btn btn-sm animated-button victoria-three">커뮤니티</a></li>
				</div>
				<div class="col-md-3 col-sm-3 col-xs-6"> 
				<li><a href="<%=path%>/notic" class="btn btn-sm animated-button victoria-three">공지사항</a></li>
				</div>
			</ul>
		</div>
	</div>

	<!-- Login&Join icon -->
	<div class="Ebook_icons">
			
			<c:if test="${member.isAdmin == 2 }">
				<a href="member/admin">관리자페이지로 전환</a>
			</c:if>
			
			<c:if test="${writer != null}">
				<a href="EBookProject/writer/detail?writernumber=${writer.writer_no}">${writer.w_name}</a>
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
			<a href="<%=path%>/member/setting" id="setting" title="회원정보"><i class="fas fa-cog"></i></a>
			</c:if>
			
			&nbsp;&nbsp;&nbsp;&nbsp;
         	<button type="button" id="logout">로그아웃</button>
				
			




	</div>

</nav>