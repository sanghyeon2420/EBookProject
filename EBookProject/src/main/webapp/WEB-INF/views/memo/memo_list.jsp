<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
			  <table border="1" style="width:700px">
			  <tr>
				<td>No</td>
				<td>닉네임</td>
				<td>메모</td>
				<td>날짜</td>
			  </tr>
			<c:forEach var="list" items="${map.list}">
		  	  <tr>
		  	  <!-- idx, memo, nickname, post_date -->
				<td>${list.idx}</td>
				<td>${list.nickname}</td>
				<td>${list.memo}</td>
				<td>${list.post_date}</td>
			  </tr>
			</c:forEach>	
			</table> 
</body>
</html>