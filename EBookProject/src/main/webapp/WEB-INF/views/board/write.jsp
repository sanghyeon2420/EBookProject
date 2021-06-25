
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
	$("#btnInsert").click(function(){
		document.form1.submit();	//jsp로 곧바로 링크 못시키기때문에 write.do로 패쓰
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


<h2>글등록</h2>
<hr>
<form name="form1" method="post" action="${pageContext.request.contextPath}/board/insert.do">
<div>
	<input name="b_title" id="b_title" size="80" placeholder="제목을 입력해주세요." class="form-control">
</div>
<div>
	<textarea id="b_content" name="b_content" row="3" cols="80" placeholder="내용을 입력해주세요."></textarea>
</div>
<div style="text-align:right">
	<button type="button" id="btnCanel">취소</button>
	<button type="button" id="btnInsert">등록</button>
</div>
<script>
CKEDITOR.replace("b_content", {
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