<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../../include/include.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>login</title>
<link rel="stylesheet" type="text/css" href="resources/css/bootstrap.min.css">
</head>
<script>


	
$(document).ready(function(){
	console.log("${param.message}");
	var message="${param.message}";
	if(message=="nologin"){
		alert("로그인 후 이용이 가능합니다.");
	}
	
	$("#login_form").keypress(function (e) {
        if (e.keyCode === 13) {
            Login();
        }
    });
	
	$("#btnLogin").click(function(){
		var userid=$("#userid").val();
		var userpw=$("#userpw").val();
		if(userid == ""){
			alert("아이디를 입력하세요");
		} else if(userpw == ""){
			alert("비밀번호를 입력하세요");
		} else {
			$.ajax({
				type:"post",
				url:"login/proc",
				data:{"userid":userid,
					"userpw":userpw
				},
				success:function(data){
					console.log(data); // 로그인 성공여부
					if(data == 1){ // 로그인성공
						document.form1.submit();
					} else { // 로그인실패
						alert("아이디 또는 비밀번호가 맞지 않습니다. 다시 확인해주세요");
					}
				}
			});			
		}
	});
});

function join(){
	location.href="${pageContext.request.contextPath}/member/join";	
}
</script>
<style>
body {
    padding-top: 15px;
    font-size: 12px
  }
  .main {
    max-width: 320px;
    margin: 0 auto;
  }
  .login-or {
    position: relative;
    font-size: 18px;
    color: #aaa;
    margin-top: 10px;
            margin-bottom: 10px;
    padding-top: 10px;
    padding-bottom: 10px;
  }
  .span-or {
    display: block;
    position: absolute;
    left: 50%;
    top: -2px;
    margin-left: -25px;
    background-color: #fff;
    width: 50px;
    text-align: center;
  }
  .hr-or {
    background-color: #cdcdcd;
    height: 1px;
    margin-top: 0px !important;
    margin-bottom: 0px !important;
  }
  h3 {
    text-align: center;
    line-height: 300%;
  }
</style>
<body>		

  <header id="pageHeader">
  	<!-- Header -->
	<%@ include file="../../include/pageHeader.jsp" %>
  </header>
  
  <article id="mainArticle">





<div class="container">
  <div class="row">

    <div class="main">

      <h3>LogIn</h3>
      <div class="row">
        <div class="col-xs-6 col-sm-6 col-md-6">
          <a href="#" class="btn btn-lg btn-primary btn-block">Facebook</a>
        </div>
        <div class="col-xs-6 col-sm-6 col-md-6">
          <a href="#" class="btn btn-lg btn-info btn-block">Google</a>
        </div>
      </div>
      <div class="login-or">
        <hr class="hr-or">
        <span class="span-or">or</span>
      </div>

      <form name="form1" method="post" action="<%=path%>/member/login/success">
        <div class="form-group">
          <label for="userid">아이디</label>
          <input type="text" class="form-control" id="userid" name="userid">
        </div>
        <div class="form-group">
          <label for="userpw">비밀번호</label>
          <input type="password" class="form-control" id="userpw" name="userpw">
          <a class="pull-right" href="search">아이디/비밀번호찾기</a> <!-- 아이디/비밀번호 찾기 -->
        </div>
<!--         <div class="checkbox pull-right">
          <label>
            <input type="checkbox">
            Remember me </label>
        </div> -->
        <button type="button" id="btnLogin" name="btnLogin" class="btn btn btn-primary">
          로그인
        </button>
        
        <button type="button" onclick="join()" class="btn btn btn-primary">
          회원가입
        </button>
      </form>
    
    </div>
    
  </div>
</div>

</article>

    <footer id="pageFooter">
  		<!-- Footer -->
		<%@ include file="../../include/pageFooter.jsp" %>
  </footer>
  
</body>
</html>












<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="resources/css/login.css">
<title>login</title>

</head>
<body>		
	<section id="login">
        <div class="container">
            <div class="loginBox">
                <div>
                    <div class="box">
                        <div class="logo">
                            <h1>로그인</h1>
                        </div>
                        <form action="/login" method="post">
                            <input type="text" name="uid" placeholder="아이디">
                            <input type="password" name="pw" placeholder="비밀번호">
                            <button type="submit">로그인</button>
                        </form>
                    </div>
                    <div class="box">
                        <div class="social logo">
                            <h1>소셜 로그인하기</h1>
                            <button class="facebook">페이스북 ID로 로그인</button>
                            <button class="kakao">카카오톡 ID로 로그인</button>
                            <button class="naver">네이버 ID로 로그인</button>
                        </div>
                    </div>
                    <div class="clear"></div>
                    <div class="bottombox">
                        <h1>도움이 필요하신가요?</h1>
                        <p><button>아이디 찾기</button>
                           <button>비밀번호 찾기</button></p>
                    </div>
                </div>
            </div>
        </div>
    </section>
	
</body>
</html> --%>