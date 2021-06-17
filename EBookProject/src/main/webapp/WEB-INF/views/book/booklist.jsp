<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>

</script>
<style>
	td img{
	width:8vw;
	height:10vh;}
</style>
</head>
<body>
<!-- ${param.idx} => 장르번호 -->
  <table>
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
</body>
</html>