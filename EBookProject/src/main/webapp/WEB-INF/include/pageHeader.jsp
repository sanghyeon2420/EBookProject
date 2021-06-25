<%
	String path = request.getContextPath();
%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<script src="resources/js/search.js"></script>
<link rel="stylesheet"
	  href="https://use.fontawesome.com/releases/v5.6.3/css/all.css"
	  crossorigin="anonymous">
<link rel="stylesheet" href="resources/css/pageHeader.css">

<nav class="main_header" >
	<!-- Header logo -->
	<div class="Ebook_logo" >
		<a href="<%=path%>/"> <img src="resources/images/logo_image.jpg"
			width="100px" height="100px">
		</a>
	</div>
	<div class="center" >

		<!-- Search -->
	<div class="wrap">
	   <div class="search">
	      <input type="text" class="searchTerm" name="keyword" id="keyword" placeholder="search" >
	      <button type="button" class="searchButton" id="searchButton">
	        <i class="fa fa-search"></i>
	     </button>
	   </div>
	</div>

		<!-- Menubar -->
		<div class="menu">
			<ul class="menu_list">
				<div class="menu_list_in"> 
				<li><a href="<%=path%>/" class="btn btn-sm animated-button victoria-three">Home</a></li>
				</div>
				<c:forEach var="list" items="${booklist}">
					<div class="menu_list_in"> 
					<li><a href="/EBookProject/book/list?idx=${list.category_no}" class="btn btn-sm animated-button victoria-three">${list.category_name}</a></li>
					</div>
				</c:forEach>
				<div class="menu_list_in"> 
				<li><a href="<%=path%>/board/list" class="btn btn-sm animated-button victoria-three">커뮤니티</a></li>
				</div>
				<div class="menu_list_in"> 
				<li><a href="<%=path%>/notic/list" class="btn btn-sm animated-button victoria-three">공지사항</a></li>
				</div>
			</ul>
		</div>
	</div>

	<!-- Login&Join icon -->
	<div class="Ebook_icons" >
			
			<c:if test="${member.isAdmin == 2 }">
			<div class="Ebook_icons_in">
				<a href="<%=path%>/admin/list?listtype=member"">관리자페이지로 전환</a>&nbsp; : &nbsp; 관리자 &nbsp;
				<a href="<%=path%>/member/setting" id="setting" title="회원정보"><i class="fas fa-cog"></i></a>
			</div>
			&nbsp;&nbsp;&nbsp;&nbsp;
         	<button type="button" class="out_button" id="logout" onclick="location.href='${pageContext.request.contextPath}/member/logout';">로그아웃</button>
			</c:if>
			

			<c:if test="${member == null}">
			<div class="Ebook_icons_in2">
			<a href="<%=path%>/member/login" id="login" title="로그인"><i
        	 class="fas fa-user"></i></a> <a href="<%=path%>/member/join" id="join"
         	title="회원가입"><i class="fas fa-id-card"></i></a>
			</div>
			</c:if>
			
			<c:if test="${member.isAdmin == 1}">
			<div class="Ebook_icons_in">
				<a href="EBookProject/member/detail?membernumber=${member.user_no}">${member.nickname}</a>
				<a href="<%=path%>/member/setting" id="setting" title="회원정보"><i class="fas fa-cog"></i></a>
			</div>
			&nbsp;&nbsp;&nbsp;&nbsp;
         	<button type="button" class="out_button" id="logout" onclick="location.href='${pageContext.request.contextPath}/member/logout';">로그아웃</button>
			</c:if>
			
				
			




	</div>

</nav>