
<!-- 게시판 글쓰는 사람의 ip주소 -->
<% String ip=session.; %>
<% System.out.println("접속한 사람의 ip : " + ip ); %>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../../include/include.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>

</script>
<style>

</style>
</head>
<body>
<header id="pageHeader">
  	<!-- Header -->
	<%@ include file="../../include/pageHeader.jsp" %>
</header>
  
  <article id="mainArticle">
  <!-- 게시판 작성 -->
  게시판
  
  </article>
  
  
   <footer id="pageFooter">
  		<!-- Footer -->
		<%@ include file="../../include/pageFooter.jsp" %>
  </footer>
</body>
</html>