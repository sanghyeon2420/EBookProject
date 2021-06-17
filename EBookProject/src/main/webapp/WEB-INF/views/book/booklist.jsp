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
	<td>${list.b_category }</td>
	<td>${list.w_name }</td>
	<td>${list.b_name }</td>
	<td>${list.b_intro }</td>
	</tr>
	  
  </c:forEach>
  </table>
</body>
</html>