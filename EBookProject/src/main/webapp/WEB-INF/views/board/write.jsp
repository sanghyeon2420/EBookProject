


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link href="resources/css/layout.css" rel="stylesheet">
<link href="resources/css/servPage.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="resources/js/bootstrap.min.js"></script>

<link rel="stylesheet" type="text/css" href="resources/css/bootstrap.min.css">
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
  <!-- 여기서 write.jsp space -->
<script src="<%=request.getContextPath() %>/resources/ckeditor/ckeditor.js"></script>
<script>
$(function(){
	$("#btnSave").click(function(){
		document.form1.submit();	//jsp로 곧바로 링크 못시키기때문에 write.do로 패쓰
	});
}); 
</script>

<h2>글등록</h2>
<form id="form1" name="" method="post" action="${path}/board/insert.do">
<div>
	제목<input name="title" id="title" size="80" placeholder="제목입력">
</div>
<div style="width:800px">
	내용<textarea id="content" name="content" row="3" cols="80" placeholder="내용입력"></textarea>
</div>
<script>
CKEDITOR.replace("content", {
	height:"300px"
});
</script>
<div style="width:700px; text-align:center">
	<button type="button" id="btnSave">확인</button>
</div>

  </article>
  
  
   <footer id="pageFooter">
  		<!-- Footer -->
		<%@ include file="../../include/pageFooter.jsp" %>
  </footer>
</body>
</html>