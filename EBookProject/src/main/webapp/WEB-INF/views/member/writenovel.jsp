
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<%@ include file="../../include/include.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="resources/css/layout.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="resources/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="resources/css/bootstrap.min.css">


<script src="<%=request.getContextPath() %>/resources/ckeditor/ckeditor.js"></script>
<script>
$(document).ready(function(){
	$("아직연결안함").click(function(){
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


<h2>회차등록</h2>
<hr>
<form name="form1" method="post" action="아직연결안함">
<div>
	<input name="b_title" id="b_title" size="80" placeholder="회차(소제목)을 입력해주세요." class="form-control">
	<textarea id="b_content" name="b_content" row="3" cols="80" placeholder="내용입력"></textarea>
</div>
<div style="text-align:right">
	<button type="button" id="btnCanel">취소</button>
	<button type="button" id="btnInsert">등록</button>
</div>
<script>
CKEDITOR.replace("b_content", {
	placeholder:"소설 작성전 안내사항<br><br>아래 내용에 해당하는 작품은 운영회의를 통해 수정 권고되거나, 정도가 심할 경우 삭제될 수 있습니다.<br>내용을 확인 후 작품 등록 시 준수하여 주시기 부탁드립니다.<br>또한 작품에 대한 모든 권한과 책임은 연재자에게 있습니다.<br><br>1. 욕설 비방(특정 인물 또는 단체, 종교 등을 욕하거나 비방하는) 작품<br>2. 소아를 성적 대상으로 하는 작품 등 현행법상 문제의 소지가 있는 작품<br>3. 타인의 권리에 속하는 저작권, 상표권, 의장권 등을 무단으로 침해한 작품<br>4. 타인의 개인정보(실명, 주민번호, 연락처, 주소, 블로그 주소 등)를 본인의 동의 없이 고의적, 악의적으로 게재한 작품<br>5. 사이버 명예훼손의 우려가 있는 작품<br>&nbsp;&nbsp; · 개인의 사생활, 초상권을 침해한 내용<br>&nbsp;&nbsp; · 개인이나 단체에 대해 비방하거나 허위사실을 유포한 경우 또는 권리를 침해한 경우<br>&nbsp;&nbsp; · 욕설 또는 언어폭력 등의 저속한 표현으로 특정인의 인격을 모독하거나 불쾌감을 불러 일으키는 내용",	height:"300px"
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