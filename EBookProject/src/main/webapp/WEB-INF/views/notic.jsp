<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<% String path=request.getContextPath(); %>
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
	
	<table>
		<c:forEach var="list" items="${noticlist}">
		<tr>
		<td><a href="<%=path%>/notic/detail/${list.notic_no}">공지</a></td>
		<td>${list.notic_content }</td>
		</tr>
		</c:forEach>
	</table>
	
</body>
</html>