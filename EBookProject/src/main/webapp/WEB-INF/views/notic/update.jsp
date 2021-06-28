
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<%@ include file="../../include/include.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="resources/css/layout.css" rel="stylesheet">
<link href="resources/css/servPage.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="resources/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="resources/css/bootstrap.min.css">


<script src="<%=request.getContextPath() %>/resources/ckeditor/ckeditor.js"></script>
<script>
$(document).ready(function(){
	$("#btnSubmit").click(function(){
		document.form1.submit();	// jsp로 곧바로 링크 못시키기때문에 write.do로 패스
	});
});

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


<h2>공지사항수정</h2>
<hr>
<form name="form1" method="post" action="${pageContext.request.contextPath}/admin/updateResult">
<input type="hidden" name="notic_no" value="${dto.notic_no }">
<div>
	<input name="notic_title" id="notic_title" size="80" value="${dto.notic_title }" class="form-control">
</div>
<div>
	<textarea id="notic_content" name="notic_content" row="3" cols="80" >${dto.notic_content }</textarea>
</div>
<div style="text-align:right">
	<a href="list?listtype=notic">
	<button type="button" id="btnCanel">취소</button></a>
	<button type="button" id="btnSubmit">수정</button>
</div>
<script>
CKEDITOR.replace("notic_content", {
	placeholder:"내용을 입력해주세요",
	height:"300px"
});
</script>
 </form> 


  </article>

  
   <footer id="pageFooter">
  		<!-- Footer -->
		<%@ include file="../../include/pageFooter.jsp" %>
  </footer>
</body>
</html>