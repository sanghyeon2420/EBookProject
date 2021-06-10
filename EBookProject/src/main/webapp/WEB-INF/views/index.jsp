<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../include/include.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>

</script>
<style>

</style>
</head>
<!-- 가로 스크롤 삭제 : style="overflow-x: hidden" -->
<body style="overflow-x: hidden">

  <header id="pageHeader">
  	<!-- Header -->
	<%@ include file="../include/pageHeader.jsp" %>
  </header>

  <article id="mainArticle">
	  <!-- Body -->
	  <%@ include file="../include/mainArticle.jsp" %>
  </article>
  
  <nav id="mainNav">
	  <!-- Nav -->
  	  <%@ include file="../include/mainNav.jsp" %>
  </nav>
  
  <div id="siteAds">
  		<!-- Ads -->
  		<%@ include file="../include/siteAds.jsp" %>
  </div>
  
  <footer id="pageFooter">
  		<!-- Footer -->
		<%@ include file="../include/pageFooter.jsp" %>
  
  </footer>
  



</body>
</html>