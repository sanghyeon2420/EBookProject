<%@ page language="java" contentType="text/html; charset=UTF-8"
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
</html>