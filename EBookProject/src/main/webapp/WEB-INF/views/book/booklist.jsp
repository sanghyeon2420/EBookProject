<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../../include/include.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="resources/css/servPage.css" rel="stylesheet">
<title>Insert title here</title>
<style type="text/css">
a:link { color: black; text-decoration: none;}
 a:visited { color: black; text-decoration: none;}
 a:hover { color: black; text-decoration: none;}
</style>
<script>
</script>
<style>
	td img{
	 width:8vw;
	height:auto; }
	 table {
    width: 100%;
    border-top: 1px solid #444444;
    border-collapse: collapse;
  	text-align: center;
  }
  th, td {
    border-bottom: 1px solid #444444;
    padding: 10px;
  }
</style>
</head>
<body>
  <header id="pageHeader">
     <!-- Header -->
   <%@ include file="../../include/pageHeader.jsp" %>
  </header>
<!-- ${param.idx} => 장르번호 -->
 <article id="mainArticle">
  <table>
  	<tr style="background-color: #5FD184">
  	<td width="8%">일러스트</td>
  	<td width="5%">순위</td>
  	<td width="10%">장르</td>
  	<td width="10%">작가명</td>
  	<td width="20%">제목</td>
  	<td width="30%">간략줄거리</td>
  	
  <c:forEach var="list" items="${list}">
	<tr>
	<td><img src="resources/images/${list.b_category}/${list.imagefileName} "></td>
	<!-- resources/images/무협지/무림순경.jpg -->
	<td>${list.ebook_no}</td>
	<td>${list.b_category}</td>
	<td>${list.w_name }</td>
	<%-- <li><a href="/EBookProject/book/list?idx=${list.category_no}">${list.category_name}</a></li> --%>
	<td><a href="<%=request.getContextPath()%>/book/detail?idx=${list.ebook_no}">${list.b_name }</a></td>
	<td>${list.b_intro }</td>
	</tr>
	  
  </c:forEach>
  </table>
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