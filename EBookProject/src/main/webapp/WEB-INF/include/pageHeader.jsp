<% String path=request.getContextPath(); %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<html>

<link rel="stylesheet"
   href="https://use.fontawesome.com/releases/v5.6.3/css/all.css"
   crossorigin="anonymous">
<link rel="stylesheet" href="resources/css/pageHeader.css">

<nav class="main_header">
   <!-- Header logo -->
   <div class="Ebook_logo">
      <a href="<%=path%>/"> <img src="resources/images/logo_image.jpg" wclassth="100px" height="100px">
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
         <li><a href="#">무협지</a></li>
         <li><a href="#">판타지</a></li>
         <li><a href="#">로맨스</a></li>
         <li><a href="<%=path%>/board/list">커뮤니티</a></li>
         <li><a href="#">공지사항</a></li>
      </ul>
      </div>
</div>

   <!-- Login&Join icon -->
   <div class="Ebook_icons">
      <a href="<%=path%>/member/login" id="login" title="로그인"><i class="fas fa-user"></i></a>
      <a href="<%=path%>/member/join" id="join" title="회원가입"><i class="fas fa-id-card"></i></a>
   </div>

</nav>