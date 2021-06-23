<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
  <!-- 여기서 board 작성 -->
  
  <script>

$(function(){
	$("#btnWrite").click(function(){
		//jsp로 곧바로 링크 못시키기때문에 boardcontroller.java 에서 requestmapping("write")로 
		location.href="<%=path%>/board/write";
	});
});
</script>
  
  <table border="1" width=600px>
  <tr>
  	<th>번호</th>
  	<th>제목</th>
  	<th>작성자</th>
  	<th>날짜</th>
  	<th>조회수</th>
  </tr>
  <c:forEach var="row" items="${map.list}">
<tr>
	<td>${row.board_no}</td>
	<td><a href="#" >${row.b_title}</a></td>
	<td>${row.nickname}</td>
	<td><fmt:formatDate value="${row.b_write_date}" pattern="MM/dd" /></td>
	<!-- 조회수 --><td>${row.board_get}</td>
</tr>

<!-- 페이지 네비게이션 -->
</c:forEach>
	<tr>
		<td colspan="5" align="center">
			<c:forEach var="num" begin="1" end="${map.pager.totPage }">
				<a href="javascript:list('${num}')">${num}</a>
			</c:forEach>
		</td>
	</tr>
  </table>

  </article>
  
  
   <footer id="pageFooter">
  		<!-- Footer -->
		<%@ include file="../../include/pageFooter.jsp" %>
  </footer>
</body>
</html>