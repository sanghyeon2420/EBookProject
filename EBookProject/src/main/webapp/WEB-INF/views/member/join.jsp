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
function validate() {
    //event.preventDefault();
    var objID = document.getElementById("userid");
    var objPwd1 = document.getElementById("userpw");
    var objPwd2 = document.getElementById("userpw2");
    var objEmail = document.getElementById("email");
    var objName = document.getElementById("username");
    var objNicName = document.getElementById("nickname");
    var objNum1 = document.getElementById("my_num1");
    var objNum2 = document.getElementById("my_num2");
    var objPnum = document.getElementById("my_pnumber");
    var objNum = document.getElementById("my_number");

    var arrNum1 = new Array();
    var arrNum2 = new Array();

    var tempSum=0;//주민번호 합을 넣는 공간

    //아이디와 패스워드 값 데이터 정규화 공식
    var regul1 = /^[a-zA-Z0-9]{4,12}$/;
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
        return false;
    }
    //아이디 유효성 검사
    //내가 입력한 데이터를 검사하는 check()
    //만약 내가 아이디에 정규화 방식을 하나라도 지키지 않으면 if문 안으로 들어가서 alert message를 띄움
    if (!check(regul1,objID,"아이디는 4~12자의 대소문자와 숫자로만 입력 가능합니다.")) {
        return false;//반환 할 곳 없이 if문 탈출
    }
    //아이디 입력 하지 않았을 경우
    if ((objID.value) == ""){
        alert("아이디를 입력하지 않았습니다.");
        objID.focus();
        return false;
    }
    //휴대번호를 입력 하지 않았을 경우
     if ((objPnum.value) == ""){
        alert("휴대번호를 입력하지 않았습니다.");
        objID.focus();
        return false;
    }
    //비밀번호 입력 하지 않았을 경우
    if ((objPwd1.value) == ""){
        alert("비밀번호를 입력해 주세요");
        objPwd1.focus();
        return false;
    }
    if ((objPwd2.value=="")){
        alert("비밀번호를 입력해 주세요");
        objPwd2.focus();
        return false;
    }

    //비밀번호 유효성 검사
    //만약 내가 비밀번호에 정규화 방식을 하나라도 지키지 않으면 if문 안으로 들어가서 alert message를 띄움
    if (!check(regul1,objPwd1,"비밀번호는 4~12자의 대소문자와 숫자로만 입력 가능합니다.")) {
        return false;
    }
    
    //비밀번호와 비밀번호 확인이 일치 하지 않을 경우
    if ((objPwd1.value)!=(objPwd2.value)) {
        alert("비밀번호가 일치 하지 않습니다.");
        objPwd1.focus();
        objPwd2.focus();
        return false;
    }
    //이메일 입력 안했을 경우
    if ((objEmail.value)=="") {
        alert("이메일을 입력해 주세요");
        objEmail.focus();
        return false;
    }
    //이메일이 잘못된 경우
    if (!check(regul2,objEmail,"이메일을 잘못 입력 했습니다.")) {
        return false;
    }
    //이름 입력 안 한 경우
    if ((objName.value)=="") {
        alert("이름을 입력해 주세요");
        objName.focus();
        return false;
    }
    //이름에 특수 문자가 들어간 경우
    if (!check(regul3,objName,"이름이 잘못 되었습니다.")) {
        return false;
    }
    //닉네임을 입력 안 한 경우
    if ((objNicName.value)=="") {
        alert("이름을 입력해 주세요");
        objNicName.focus();
        return false;
    }
    //닉네임에 특수 문자가 들어간 경우
    if (!check(regul3,objNicName,"이름이 잘못 되었습니다.")) {
        return false;
    }

    //주민번호 앞자리를 각 배열에 넣어 검색 및 비교하기위한 단계
    //앞자리 값 만큼 돌림
    for (var i = 0; i <objNum1.value.length; i++) {
        //배열 칸마다 앞자리 값 하나씩 넣어줌
        arrNum1[i]=objNum1.value.charAt(i);
    }

    //주민번호 뒷자리를 각 배열에 넣어 검색 및 비교하기위한 단계
    //뒷자리 값 만큼 돌림
    for (var i = 0; i <objNum2.value.length; i++) {
        //배열 칸마다 뒷자리 값 하나씩 넣어줌
        arrNum2[i]=objNum2.value.charAt(i);
    }
    //주민번호 앞자리를 tempSum에 집어 넣기
    //앞자리 만큼 돌림
    for (var i = 0; i <objNum1.value.length; i++) {
        //tempSum에 앞자리를 연이어 넣어줌
        tempSum += arrNum1[i]*(2+i);
    }
    //주민번호 뒷자리를 tempSum에 집어 넣기
    //뒷자리 -1을 해주는 이유 : 뒷자리 마지막 자리는 더할 필요 없어서
    //뒷자리의 -1만큼 돌림
    for (var i = 0; i <objNum2.value.length-1; i++) {
        //뒷자리 2번째 자리 부터 
        if (i>=2) {
            //tempSum에 2~6번째까지 넣어줌
            tempSum += arrNum2[i]*i;
        }else{//뒷자리 0~1번째 자리
            //tempSum에 0~1번째까지 넣어줌
            tempSum += arrNum2[i]*(8+i);
        }
    }
    //주민번호 유효성 체크
    //주민번호 구하는 식
    if (((11-(tempSum%11))%10)!=arrNum2[6]) {
        alert("올바른 주민 번호가 아닙니다.");
        objNum1.value="";
        objNum2.value="";
        objNum1.focus();
        return false;
    }
    //주민번호를 입력하면 생년월일이 자동으로 입력된다.
    //substring은 시작문자와 끝문자를 검색하는 역할
    if (arrNum2[0]==1 || arrNum2[0]==2) {//1900년생 일때
        var y = parseInt(objNum1.value.substring(0,2));
        var m = parseInt(objNum1.value.substring(2,4));
        var d = parseInt(objNum1.value.substring(4,6));
        //년도,월,일을 각각 구함
        f.birthdate.value = 1900+y;//년도
        f.month.value = m;//월
        f.day.value = d;//일
    }else if(arrNum2[0]==3||arrNum2[0]==4){//2000년생 일때
        var y = parseInt(objNum1.value.substring(0,2));
        var m = parseInt(objNum1.value.substring(2,4));
        var d = parseInt(objNum1.value.substring(4,6));
        
        f.birthdate.value = 2000+y;//년도
        f.month.value = m;//월
        f.day.value = d;//일
    }
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


//휴대번호
function inputPhoneNumber(obj) {



var number = obj.value.replace(/[^0-9]/g, "");
var phone = "";



if(number.length < 4) {
    return number;
} else if(number.length < 7) {
    phone += number.substr(0, 3);
    phone += "-";
    phone += number.substr(3);
} else if(number.length < 11) {
    phone += number.substr(0, 3);
    phone += "-";
    phone += number.substr(3, 3);
    phone += "-";
    phone += number.substr(6);
} else {
    phone += number.substr(0, 3);
    phone += "-";
    phone += number.substr(3, 4);
    phone += "-";
    phone += number.substr(7);
}
obj.value = phone;
}


//전화번호
function inputTelNumber(obj) {

var number = obj.value.replace(/[^0-9]/g, "");
var tel = "";

// 서울 지역번호(02)가 들어오는 경우
if(number.substring(0, 2).indexOf('02') == 0) {
    if(number.length < 3) {
        return number;
    } else if(number.length < 6) {
        tel += number.substr(0, 2);
        tel += "-";
        tel += number.substr(2);
    } else if(number.length < 10) {
        tel += number.substr(0, 2);
        tel += "-";
        tel += number.substr(2, 3);
        tel += "-";
        tel += number.substr(5);
    } else {
        tel += number.substr(0, 2);
        tel += "-";
        tel += number.substr(2, 4);
        tel += "-";
        tel += number.substr(6);
    }

// 서울 지역번호(02)가 아닌경우
} else {
    if(number.length < 4) {
        return number;
    } else if(number.length < 7) {
        tel += number.substr(0, 3);
        tel += "-";
        tel += number.substr(3);
    } else if(number.length < 11) {
        tel += number.substr(0, 3);
        tel += "-";
        tel += number.substr(3, 3);
        tel += "-";
        tel += number.substr(6);
    } else {
        tel += number.substr(0, 3);
        tel += "-";
        tel += number.substr(3, 4);
        tel += "-";
        tel += number.substr(7);
    }
}

obj.value = tel;
}

// 아이디 중복확인
function ID_Check(){
	if(KoCheck($("#userid").val()) == 1){ // 아이디 란에 한글이 있으면 종료
		return;
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

// 취소 버튼 누를 시 이벤트
function cancel(){
	location.href="#";
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
<form method="post" onsubmit="return validate()" enctype="text/plain">
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
                <label for="username">닉네임</label>
                <input type="text" class="form-control" name="username" id="username" maxlength="10" placeholder="닉네임">
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
                        <input type="text" class="form-control" name="birthdate" id="birthdate" maxlength="4" placeholder="년도">
                        <span class="input-group-text">년</span>
                    </div>
                    <select name="month" id="month" class="custom-select">
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
                        <option value="1" selected="selected">1
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
                <input class="btn btn-primary" type="submit" name="submit" value="회원 가입">
                <input class="btn btn-primary" type="button" name="cancel"  value="취소" onclick="cancel()">
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