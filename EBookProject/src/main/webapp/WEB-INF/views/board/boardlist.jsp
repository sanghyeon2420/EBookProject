


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
<style type="text/css">
a:link { color: black; text-decoration: none;}
 a:visited { color: black; text-decoration: none;}
 a:hover { color: black; text-decoration: none;}
</style>
</head>
<body>
<header id="pageHeader">
  	<!-- Header -->
	<%@ include file="../../include/pageHeader.jsp" %>
</header>
  
  <article id="mainArticle">
  <!-- 여기서 board 작성 -->
  
  <script>

$(function(){
	$("#btnWrite").click(function(){
		//jsp로 곧바로 링크 못시키기때문에 boardcontroller.java 에서 requestmapping("write")로 
		location.href="<%=path%>/board/write";
	});
});
</script>
  
  <button type="button" id="btnWrite">글쓰기</button>
  <table border="1" width=600px>
  <tr>
  	<th>번호</th>
  	<th>제목</th>
  	<th>이름</th>
  	<th>조회수</th>
  	<th>날짜</th>
  </tr>
  <c:forEach var="row" items="${map.blist}">
<tr>
	<td>${row.board_no}</td>
	<td>${row.b_title}</td>
	<td>${row.b_write_date}</td>
	<td><fmt:formatDate value="${row.b_write_date}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
	<!-- 조회수 --><td>${row.board_get}</td>
</tr>
</c:forEach>
  
  </table>

  </article>
  
  
   <footer id="pageFooter">
  		<!-- Footer -->
		<%@ include file="../../include/pageFooter.jsp" %>
  </footer>
</body>
</html>