<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../../include/include.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
$(function(){
    var lastScrollTop = 0, delta = 15;
    $(window).scroll(function(event){
       var st = $(this).scrollTop();
       
        if(Math.abs(lastScrollTop - st) <= delta)
          return; // 스크롤값을 받아서 리턴한다.
        if ((st > lastScrollTop) && (lastScrollTop>0)) {
       // downscroll code
      $("#pageHeader").css("top","-550px"); // 스크롤을 내렸을때 #header의 CSS 속성중 top 값을 -50px로 변경한다.
  
   } else {
      // upscroll code
      $("#pageHeader").css("top","0px"); // 스크롤을 올렸을때 #header의 CSS 속성중 top 값을 0px로 변경한다.
   }
       lastScrollTop = st;
    });
});

$(function() {
    $(window).scroll(function() {
        if ($(this).scrollTop() > 500) { // 스크롤 위치에 따라 화면에서 맨위로 올라가는 버튼이 나타나고, 사라지도록 설정
            $('#MOVE_TOP_BTN').fadeIn();
        } else {
            $('#MOVE_TOP_BTN').fadeOut();
        }
    });
  
    $("#MOVE_TOP_BTN").click(function() {//버튼 클릭 이벤트
        $('html, body').animate({ // animation을 걸어서 화면 맨위로 이동하도록 설정
            scrollTop : 0
        }, 400);
        return false;
    });
});


// 로그아웃
$(document).ready(function(){
	$("#logout").click(function(){
		location.href="${pageContext.request.contextPath}/member/logout";
	});
});

</script>
<script>
function updateB() {
	var notic_no=$("#notic_no").val();
	var notic_title=$("#notic_title").val();
	var notic_content=CKEDITOR.instances.notic_content.getData();
	var notic_titleLength=notic_title.length;
	if(!notic_title) {
		swal("error", "제목을 입력하세요.", "error");
	} else if(notic_titleLength>50) {
		swal("", "제목이 너무 깁니다.", "error");
	} 
	else if(notic_content == ""){ 
		 swal("error", "글내용을 입력해 주세요!!.", "error");
		 return false; 
	} 
	else {
		swal({
			 icon: "warning",
			 text: "정말 수정 하시겠습니까?",
			 closeOnClickOutside : false,
			 closeOnEsc : false, 
			 buttons: ["돌아가기", "수정 완료!"],
			}).then(function(isConfirm) {
			  if (isConfirm) {
			    swal('수정 완료!','게시글 수정을 완료했습니다.^^','success').then(function(isConfirm)
			    	{
			    		$.ajax({
							type : "POST",
							url : "updatenotic",
							data : {
								"notic_no" : notic_no,
								"notic_title" : notic_title,
								"notic_content" : notic_content
						}, success : function(data) {
							location.href="view?notic_no="+notic_no+"&show=Y";
						}
					});
			    	});
			  }
			})
	}
}

//키보드로 글자수 입력 받았을 때 글자카운트 스크립트
$(document).ready(function(){
	/* 키보드 이벤트 활용 */
	$('#title').keyup(function(){
		// 남은 글자수를 구한다.
		var titleLength = $(this).val().length; //현재 글자수
		var remain = 50 - titleLength;
		
		// 문서 객체에 남은 글자수 표시
		$('#titleCount').html(remain);
		
		if(remain>=0){
		      $('#titleCount').css('color', 'green');
		}else{
		      $('#titleCount').css('color', 'red');
		}
		
		if(remain<0) {
			swal("", "제목은 한글기준 50자 까지만 쓸 수 있습니다.", "warning");
		}
	})
})
</script>
<style>
a#MOVE_TOP_BTN {
    position: fixed;/*화면에 고정 */
    right: 2%;
    bottom: 50px;/*버튼 위치 설정*/
    display: none;/*기본 값 화면에서 숨김 */
}
img {

  width: 50px;
  height: 50px;
  
  }
}
</style>
</head>
<!-- 가로 스크롤 삭제 : style="overflow-x: hidden" -->
<body style="overflow-x: hidden">

  <header id="pageHeader">
     <!-- Header -->
   <%@ include file="../../include/pageHeader.jsp" %>
  </header>

  <article id="mainArticle">
<div style="width:800px;">
		<div style="float:right;">
		</div>
		<br/><br/>

	<form>
		<input type="hidden" name="bno" id="bno" value="${notic.notic_no}"/>
		<table border="1" bordercolor="#E1DCDC" cellpadding="0" cellspacing="0" width="100%">
			<tr>
			<td width="70">제목</td>
			<td align="left">
			<input type="text" name="title" id="title" size="70%" maxlength="100" 
			value="${notic.notic_title}" />
			<span id="titleCount" style="color:green;">50</span><span>/50</span>
			</td>
			</tr>
				
			<tr>
			<td>작성일</td>
			<td align="left">${notic.notic_regdate}</td>
			</tr>
				
			<tr>
			<td>조회수</td>
			<td align="left">${notic.notic_viewcnt}</td>
			</tr>
				
			<tr>
			<td colspan="2" align="left" height="500px">
			<textarea name="notic_content" id="notic_content" cols="88" rows="80">${notic.notic_content}</textarea>
		<script>
   		 	CKEDITOR.replace( 'notic_content', {} );
		</script>
			</td>
			</tr>
		</table>
		<br/><br/>
		<input id="list_btn" type="button" value="저장" onclick="updateB()" />
	</form>
		<button id="list_btn" style="float:right;" onclick="location.href='notic'">목록</button>
	</div>	
  </article>
   
  <nav id="mainNav">
     <!-- Nav -->
       <%@ include file="../../include/mainNav.jsp" %>
  </nav>
  
  <div id="siteAds">
        <!-- Ads -->
        <%@ include file="../../include/siteAds.jsp" %>
  </div>
        
   <a id="MOVE_TOP_BTN" href="#" ><!-- 상단으로 올리는 버튼  -->
   <img class="icon_img" src="resources/images/up_icon.png"/>
   </a>
  <footer id="pageFooter">
        <!-- Footer -->
      <%@ include file="../../include/pageFooter.jsp" %>
  
  </footer>

</body>
</html>