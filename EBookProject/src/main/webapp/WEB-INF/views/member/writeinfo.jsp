<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="../../include/include.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>writerInfo</title>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="resources/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="resources/css/bootstrap.min.css">
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script>
//로그아웃
$(document).ready(function(){
	$("#logout").click(function(){
		location.href="${pageContext.request.contextPath}/member/logout";
	});
	
});
// 우측 클릭 방지 
document.onmousedown=disableclick;
status="마우스 우클릭 하지 말아주세요!!"; 

function disableclick(event){ 
    if (event.button==2) { 
        alert(status); 
        return false; 
    } 
}
</script>
<style>
.setWrite { 
      display: grid;
      grid-template-areas: 
        "pic title title"
        "pic writer writer"
        "pic category category"
        "pic form form"
        "pic upload upload"
        "info info info"
        "Wsubmit Wsubmit Wsubmit";
      grid-template-rows: 10% 10% 10% 10% 10% 35% 7%;
      grid-template-columns: 20% 40% 40%;
      grid-gap: 10px;
      height: 60vh;
      width: 60vw;
      margin: 0;
      }
    
    #pic {
      grid-area: pic;
    }
    
    #title { 
      grid-area: title;     
    }
      
    #writer { 
      grid-area: writer;
    }
    
    #category {
      grid-area: category;
    }
    
    #form {
      grid-area: form;
    }
    
    #upload {
      grid-area: upload;
    }
    
    #info {
      grid-area: info;
    }
    
    #Wsubmit {
      grid-area: Wsubmit;
      display:flex;
      justify-content: center;
      align-items: center;
    }
    
    /* #pic, #title, #writer, #category, #form, #upload, #info, #Wsubmit{
    	border:dotted 1px;
    } */
    
    input#nickname {
      background-color: #eef5f0;
      color: #968b8b;
    }
    
    #image_preview img{
      width: 12vw;
      height: 34vh;
    }
</style>
</head>
<body>
  <header id="pageHeader">
     <!-- Header -->
   <%@ include file="../../include/pageHeader.jsp" %>
  </header>
  
  
  <article id="mainArticle">
  	<div class="titlemessage">
      <h3>신규 소설 등록</h3>
    </div>
	<form class= "setWrite" action="GOGOGO!">
		<div class="pic" id="pic">
          <div id="image_preview">
            <img src="#" />
        </div>
        </div>
		<div class="title" id="title">
			작품명 <input type="text" id="wTitle" name="wTitle" class="form-control">
		</div>
		<div class="writer" id="writer">
			작가이름 <input type="text" id="nickname" name="nickname" class="form-control" value="${dto.w_name}" style="color:#3a3d3b" readonly/>
		</div>
		<div class="category" id="category">
			카테고리 <br>
            <input type="radio" id="action" name="category" value="무협지" checked="checked">
            <label for="action" >무협지</label>
            <input type="radio" id="fantasy" name="category" value="판타지">
            <label for="fantasy">판타지</label>
            <input type="radio" id="romance" name="category" value="로맨스">
            <label for="romance">로맨스</label>
		</div>
		<div class="form" id="form">
			연재형태 <br>
            <input type="radio" id="continue" name="form" value="continue" checked="checked">
            <label for="action" >연재</label>
            <input type="radio" id="finish" name="form" value="finish">
            <label for="action" >완결</label>
		</div>
		<div class="upload" id="upload">
          <p>
            <label for="image">이미지등록</label> 
            <input type="file" name="image" id="image" style="display:none;" /> 
        </p>
        </div>
		<div class="info" id="info">
            <h3>책소개</h3>
            <textarea class="textarea" style="height:70%; width:100%;" name="novel_story" class="form-control"></textarea>
        </div>
		<div class="Wsubmit" id="Wsubmit">
            <button class="btn btn-primary" type="submit">작품 등록</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
			<button class="btn btn-danger" type="reset">밥이나먹어</button>
        </div>
	</form>
	<script type="text/javascript">
      $('#image').on('change', function() {
          
          ext = $(this).val().split('.').pop().toLowerCase(); //확장자
          
          //배열에 추출한 확장자가 존재하는지 체크
          if($.inArray(ext, ['gif', 'png', 'jpg', 'jpeg']) == -1) {
              resetFormElement($(this)); //폼 초기화
              window.alert('이미지 파일이 아닙니다! (gif, png, jpg, jpeg 만 업로드 가능)');
          } else {
              file = $('#image').prop("files")[0];
              blobURL = window.URL.createObjectURL(file);
              $('#image_preview img').attr('src', blobURL);
              $('#image_preview').slideDown(); //업로드한 이미지 미리보기 
              $(this).slideUp(); //파일 양식 감춤
          }
      });
      function resetFormElement(e) {
          e.wrap('<form>').closest('form').get(0).reset(); 
          //리셋하려는 폼양식 요소를 폼(<form>) 으로 감싸고 (wrap()) , 
          //요소를 감싸고 있는 가장 가까운 폼( closest('form')) 에서 Dom요소를 반환받고 ( get(0) ),
          //DOM에서 제공하는 초기화 메서드 reset()을 호출
          e.unwrap(); //감싼 <form> 태그를 제거
      }
      </script>
  </article>


 <nav id="mainNav">
     <!-- Nav -->
       <%@ include file="../../include/mainNav.jsp" %>
  </nav>
  
  
  <div id="siteAds">
        <!-- Ads -->
        <%@ include file="../../include/siteAds.jsp" %>
  </div>
  
  
  <footer id="pageFooter">
        <!-- Footer -->
      <%@ include file="../../include/pageFooter.jsp" %>
  </footer>
</body>
</html>