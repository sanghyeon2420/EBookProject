<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../../include/include.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="resources/js/bootstrap.min.js"></script>
<link href="resources/css/layout.css" rel="stylesheet">
<link href="resources/css/servPage.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="resources/css/bootstrap.min.css">
<title>Insert title here</title>
<script>

</script>
<style type="text/css">
a:link { color: black; text-decoration: none;}
 a:visited { color: black; text-decoration: none;}
 a:hover { color: black; text-decoration: none;}
 	 table {
    width: 100%;
    border: 1px solid #fff;
    border-collapse: collapse;
  	text-align: center;

  }
  th, td {
    border-bottom: 1px solid #444444;
    padding: 10px;
	font-family: 'Jua', sans-serif;
	font-size: 20px;
	text-align: center;
  }	
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

function list(page){
	location.href="<%=path%>/board/list?curPage="+page+"&search_option=${map.search_option}"
			+"&keyword=${map.keyword}";
}
</script>
  
  <table border="1" width=600px>
  <tr style="background-color: #5FD184">
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

</c:forEach>
<!-- 페이지 네비게이션 -->
	<tr>
		<td colspan="5" align="center">
			<c:if test="${map.pager.curBlock > 1}">
			<a href="javascript:list('1')">[처음]</a>
			</c:if>
			<c:if test="${map.pager.curBlock > 1}">
			<a href="javascript:list('${map.pager.prevPage }')">[이전]</a>
			</c:if>
			<c:forEach var="num" begin="${map.pager.blockBegin }" end="${map.pager.blockEnd }">
				<c:choose>
					<c:when test="${num == map.pager.curPage}">
						<span style="color:red;">${num}</span>&nbsp;
					</c:when>
					<c:otherwise>
					<a href="javascript:list('${num}')">${num}</a>&nbsp;
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${map.pager.curBlock <= map.pager.totBlock}">
			<a href="javascript:list('${map.pager.nextPage}')">[다음]</a>
			</c:if>
			<c:if test="${map.pager.curBlock <= map.pager.totBlock}">
			<a href="javascript:list('${map.pager.totPage}')">[끝]</a>
			</c:if>
		</td>
	</tr>
  </table>
	
	
	
<!-- 검색 -->
<form method="post" name="form1" action="<%=path%>/board/list">
<select name="search_option">
<c:choose>
	<c:when test="${map.search_option == 'all' }">
		<option value="all" selected>전체</option>
		<option value="nickname">작성자</option>
		<option value="b_title">제목</option>
		<option value="b_content">내용</option>
	</c:when>
		<c:when test="${map.search_option == 'nickname' }">
		<option value="all">전체</option>
		<option value="nickname" selected>작성자</option>
		<option value="b_title">제목</option>
		<option value="b_content">내용</option>
	</c:when>
		<c:when test="${map.search_option == 'b_title' }">
		<option value="all">전체</option>
		<option value="nickname">작성자</option>
		<option value="b_title" selected>제목</option>
		<option value="b_content">내용</option>
	</c:when>
		<c:when test="${map.search_option == 'b_content' }">
		<option value="all">전체</option>
		<option value="nickname">작성자</option>
		<option value="b_title">제목</option>
		<option value="b_content" selected>내용</option>
	</c:when>
</c:choose>

</select>
<input name="keyword" value="${map.keyword}">
<input type="submit" value="검색">
</form>	
<!-- 로그인 시 글쓰기 버튼 -->
<c:if test="${sessionScope.member.user_no != null}">
<button id="btnWrite">글쓰기</button>
</c:if>


  </article>
  
  
   <footer id="pageFooter">
  		<!-- Footer -->
		<%@ include file="../../include/pageFooter.jsp" %>
  </footer>
</body>
</html>