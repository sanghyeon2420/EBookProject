<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<%@ include file="../../include/include.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="resources/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="resources/css/bootstrap.min.css">
<script>

var i=0;

$(document).ready(function(){
	

	$("#check").click(function(){
		validate();
	});	
});


function validate() {
	var j=1;
    //event.preventDefault();
    var objID = document.getElementById("userid");
    var objPwd1 = document.getElementById("userpw");
    var objPwd2 = document.getElementById("userpw2");
    var objEmail = document.getElementById("email");
    var objName = document.getElementById("username");
    var objNickName = document.getElementById("nickname");
	var birthdate = $("#year").val() +"/" +$("#month").val() + "/" +$("#day").val();  



    //아이디와 패스워드 값 데이터 정규화 공식
    var regul1 = /^[a-zA-Z0-9]{8,12}$/;
    //이메일 값 데이터 유효성 체크
    //[]안에 있는 값만 쓰겠다

    //이메일 정규화 공식
    var regul2 = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/;
    
    //이름 정규화 공식
    var regul3 = /^[가-힝a-zA-Z]{2,}$/;
    //var email = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);

    //아이디 입력 하지 않았을 경우
    if ((objID.value) == ""){
        alert("아이디를 입력하지 않았습니다.");
        objID.focus();
        j=0;
    }
    
    
    //아이디 유효성 검사
    //내가 입력한 데이터를 검사하는 check()
    //만약 내가 아이디에 정규화 방식을 하나라도 지키지 않으면 if문 안으로 들어가서 alert message를 띄움
    else if (!check(regul1,objID,"아이디는 4~12자의 대소문자와 숫자로만 입력 가능합니다.")) {
    	j=0;
    }
    //아이디 입력 하지 않았을 경우
    else if ((objID.value) == ""){
    	console.log(objID.value);
        alert("아이디를 입력하지 않았습니다.");
        objID.focus();
        j=0;
    }
    
    //비밀번호 입력 하지 않았을 경우
    else if ((objPwd1.value) == ""){
    	console.log(objPwd1.value);
        alert("비밀번호를 입력해 주세요");
        objPwd1.focus();
        j=0;
    }
    else if ((objPwd2.value)==""){
    	console.log(objPwd2.value);
        alert("비밀번호 확인을 입력해 주세요");
        objPwd2.focus();
        j=0;
    }

    //비밀번호 유효성 검사
    //만약 내가 비밀번호에 정규화 방식을 하나라도 지키지 않으면 if문 안으로 들어가서 alert message를 띄움
    else if (!check(regul1,objPwd1,"비밀번호는 8~12자의 대소문자와 숫자로만 입력 가능합니다.")) {
    	j=0;
    }
    
    //비밀번호와 비밀번호 확인이 일치 하지 않을 경우
    else if ((objPwd1.value)!=(objPwd2.value)) {
    	console.log("비밀번호 일치 확인 : "+objPwd1.value);
    	console.log("비밀번호 일치 확인 : "+objPwd2.value);
        alert("비밀번호가 일치 하지 않습니다.");
        objPwd1.focus();
        objPwd2.focus();
        j=0;
    }

    //이름 입력 안 한 경우
    else if ((objName.value)=="") {
    	console.log(objName.value);
        alert("이름을 입력해 주세요");
        objName.focus();
        j=0;
    }
    //이름에 특수 문자가 들어간 경우
    else if (!check(regul3,objName,"이름이 잘못 되었습니다.")) {
    	j=0;
    }
    
    //닉네임을 입력 안 한 경우
    else if ((objNickName.value)=="") {
    	console.log(objNickName.value);
        alert("닉네임을 입력해 주세요");
        objNickName.focus();
        j=0;
    }

    
    //이메일 입력 안했을 경우
    else if ((objEmail.value)=="") {
    	console.log(objEmail.value);
        alert("이메일을 입력해 주세요");
        objEmail.focus();
        j=0;
    }
    //이메일이 잘못된 경우
    else if (!check(regul2,objEmail,"이메일을 잘못 입력 했습니다.")) {
    	j=0;
    }
    
 	
    
    console.log("i값 :"+i+", j값:"+j);
    
    if(i == 1 && j == 0){
    document.form1.submit();    	
    } else if(i == 0){
    	alert("아이디 중복확인하세요!");
    }
    
 

}

//아이디 중복확인
function ID_Check(){
	if(KoCheck($("#userid").val()) == 1){ // 아이디 란에 한글이 있으면 종료
		return;
	} else if($("#userid").val() == ""){ // 아이디란이 공백이면
		console.log($("#userid").val());
		alert("아이디를 입력하세요.");
		return; // 종료
	}
		
	
	var userid={"userid":$("#userid").val()}
	$.ajax({
		type:"post",
		url:"/EBookProject/member/idcheck",
		data:userid,
		success:function(result){
			if(result=="use"){
				idcheck_confirm =confirm("사용할 수 있는 아이디입니다. 사용하시겠습니까?");
				if(idcheck_confirm) {
					i = 1;
					console.log(i);
				} 
			}
			
			if(result=="notuse"){
				i=0;
				alert("이미 있는 아이디입니다.");
				$("#userid").focus();
				document.getElementById("userid").value="";
			}
		}
	});	
}

function check(re,what,message){//정규화데이터,아이템 id,메세지
    if (re.test(what.value)) {//what의 문자열에 re의 패턴이 있는지 나타내는 함수 test
    //만약 내가 입력한 곳의 값이 정규화 데이터를 썼다면 true를 반환해서 호출 된 곳으로 리턴됨
        return true;
    }
    alert(message);
    what.value = "";
    what.focus();
}



// 취소 버튼 누를 시 이벤트
function cancel(){
	location.href="/EBookProject/";
}

//한글 체크
function KoCheck(e){
    var lang = e;
     var check = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
     if(check.test(lang)){
        alert('한글을 포함하고 있습니다.');
        return 1; // 한글이 있으면 1 리턴
     }
}
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
	  <!-- Body -->
<form name="form1" method="post" action="<%=path%>/member/join/proc">
        <div class="container">
            <div class="form-group col-md-4">
                <label for="userid">아이디</label>
                <input type="text" class="form-control" name="userid" id="userid" size="12" maxlength="12" placeholder="아이디">
                <button class="form-control btn btn-primary" type="button" onclick="ID_Check()">중복확인</button>
            </div>
                
            <div class="form-group col-md-4">
                <label for="userpw">비밀번호</label>
                <input type="password" class="form-control" name="userpw" id="userpw" maxlength="12" placeholder="비밀번호">
            </div>
            <div class="form-group col-md-4">
                <label for="userpw2">비밀번호 확인</label>
                <input type="password" class="form-control" name="userpw2" id="userpw2" maxlength="12" placeholder="비밀번호 확인">
            </div>
            <div class="form-group col-md-4">
                <label for="username">이름</label>
                <input type="text" class="form-control" name="username" id="username" maxlength="10" placeholder="이름">
            </div>
            <div class="form-group col-md-4">
                <label for="nickname">닉네임</label>
                <input type="text" class="form-control" name="nickname" id="nickname" maxlength="10" placeholder="닉네임">
            </div>
           
   
           
            <div class="form-group col-md-6">
                <label for="email">메일주소</label>
                <input type="email" class="form-control" name="email" id="email" placeholder="메일주소">
                <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
            </div>
            <div class="form-group col-md-8">
                <label for="birthdate">생년월일</label>
                <div class="input-group">
                    <div class="input-group-prepend">
                        <input type="text" class="form-control" name="year" id="year" maxlength="4" placeholder="년도" >
                        <span class="input-group-text">년</span>
                    </div>
                    <select name="month" id="month" class="custom-select">
                     <option value="" selected disabled>선택</option>
                        <option value="1">1
                        </option>
                        <option value="2">2
                        </option>
                        <option value="3">3
                        </option>
                        <option value="4">4
                        </option>
                        <option value="5">5
                        </option>
                        <option value="6">6
                        </option>
                        <option value="7">7
                        </option>
                        <option value="8">8
                        </option>
                        <option value="9">9
                        </option>
                        <option value="10">10
                        </option>
                        <option value="11">11
                        </option>
                        <option value="12">12
                        </option>
                    </select>
                    <div class="input-group-prepend">
                        <label class="input-group-text" for="month">월</label>
                    </div>
                    <select name="day" id="day" class="custom-select">
                    <option value="" selected disabled>선택</option>

                        <option value="1">1
                        </option>
                        <option value="2">2
                        </option>
                        <option value="3">3
                        </option>
                        <option value="4">4
                        </option>
                        <option value="5">5
                        </option>
                        <option value="6">6
                        </option>
                        <option value="7">7
                        </option>
                        <option value="8">8
                        </option>
                        <option value="9">9
                        </option>
                        <option value="10">10
                        </option>
                        <option value="11">11
                        </option>
                        <option value="12">12
                        </option>
                        <option value="13">13
                        </option>
                        <option value="14">14
                        </option>
                        <option value="15">15
                        </option>
                        <option value="16">16
                        </option>
                        <option value="17">17
                        </option>
                        <option value="18">18
                        </option>
                        <option value="19">19
                        </option>
                        <option value="20">20
                        </option>
                        <option value="21">21
                        </option>
                        <option value="22">22
                        </option>
                        <option value="23">23
                        </option>
                        <option value="24">24
                        </option>
                        <option value="25">25
                        </option>
                        <option value="26">26
                        </option>
                        <option value="27">27
                        </option>
                        <option value="28">28
                        </option>
                        <option value="29">29
                        </option>
                        <option value="30">30
                        </option>
                        <option value="31">31
                        </option>
                    </select>
                    <div class="input-group-prepend">
                        <label class="input-group-text" for="day">일</label>
                    </div>
                </div>
            </div>
            <div class="col-md-12 submit-btn">
                <input class="btn btn-primary" type="button" name="check" id="check" value="회원 가입">
                <input class="btn btn-primary" type="button" name="cancel"  value="취소" onclick="window.location.href='/EBookProject/'">
            </div>
            </div>
</form>	  


  </article>
  
    <footer id="pageFooter">
  		<!-- Footer -->
		<%@ include file="../../include/pageFooter.jsp" %>
  </footer>
</body>
</html>