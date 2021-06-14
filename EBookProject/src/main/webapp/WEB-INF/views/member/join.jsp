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
<script type="text/javascript">
//개인약관 동의 체크 박스 체크시 동의 
function chk() {
	var req = document.f1rm.req.checked;
	if (req == true) {
		document.f1rm.action="login";
		document.f1rm.method="GET";
		document.f1rm.submit();
	} else {
		swal("ERROR", "개인정보 약관에 동의해야 합니다.", "error");
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
           <table>
  <tr>
    <td rowspan="8">
    <textarea rows="20" cols="90" style="resize: none;" readonly >
제1조(목적)

본 회원약관은 PLAYGROUND(이하 '갑'라 한다)이 운영하는 인터넷관련 서비스(이하 '서비스'라 한다)를 이용함에 있어 관리자와 이용자(이하 '회원'라 한다)의 권리, 의무 및 책임사항을 규정함을 목적으로 한다.


제2조 (약관의 효력)

1.본 약관은 '갑'에 회원 가입 시 회원들에게 통지함으로써 효력을 발생합니다.

2.'갑'은 이 약관의 내용을 변경할 수 있으며, 변경된 약관은 제1항과 같은 방법으로 공지 또는 통지함으로써 효력을 발생합니다.

3.약관의 변경사항 및 내용은 '갑'의 홈페이지에 게시하는 방법으로 공시합니다.


제3조 (약관 이외의 준칙)

이 약관에 명시되지 않은 사항이 전기 통신 기본법, 전기통신 사업법, 기타 관련 법령에 규정되어 있는 경우 그 규정에 따릅니다.


제4조 (이용계약의 체결)

회원 가입 시 회원 약관 밑에 있는 동의버튼을 누르면 약관에 동의하여 이 계약이 체결된 것으로 간주한다.


제5조 (용어의 정의)

이 약관에서 사용하는 용어의 정의는 다음과 같습니다.

1.회원: '갑'과 서비스 이용에 관한 계약을 체결한 자

2.아이디(ID): 회원 식별과 회원의 서비스 이용을 위하여 회원이 선정하고 '갑'이 승인하는 문자와 숫자의 조합

3.비밀번호: 회원이 통신상의 자신의 비밀을 보호하기 위해 선정한 문자와 숫자의 조합



제6조 (이용신청)

1.회원 가입은 온라인으로 가입신청 양식에 기록하여 '갑'에 제출함으로써 이용신청을 할 수 있습니다.

2.가입희망 회원은 반드시 자신의 본명 및 주민등록번호로 이용신청을 하여야 하며, 1개의 ID만 신청을 할 수 있습니다.



제7조 (회원가입의 승낙)

'갑'의 회원 가입 신청 양식에 가입 희망 회원이 인터넷으로 제6조와 같이 신청하면 '갑'은 바로 가입을 승인하여 서비스를 이용할 수 있다.


제8조(회원가입 신청거절 및 강제 탈퇴)

1. '갑'은 타인의 명의나 주민등록번호를 도용하여 회원가입신청을 할 경우 회원가입신청을 거절할 수 있다.
2. 회원가입신청이 승인이 된 후에도 허위사실의 기재가 발각되거나 '갑'의 명예를 회손시키거나 음란물이나 불건전한 내용을 게재할 경우 회원의 자격을 강제 탈퇴시킬 수 있다.


제9조 (서비스 제공의 중지)

'갑'은 다음 각 호의 1에 해당하는 경우 서비스의 제공을 중지할 수 있습니다

1.설비의 보수 등을 위하여 부득이한 경우 

2.전기통신사업법에 규정된 기간통신사업자가 전기통신서비스를 중지하는 경우 

3.기타 '갑'이 서비스를 제공할 수 없는 사유가 발생한 경우.


제10조 ('갑'의 의무)

1. '갑'은  계속적, 안정적으로 서비스를 제공할 수 있도록 최선의 노력을 다하여야 합니다.


2.'갑'은 항상 회원의 신용정보를 포함한 개인신상정보의 보안에 대하여 관리에 만전을 기함으로서 회원의 정보보안에 최선을 다하여야 합니다.   


제11조 (개인정보보호)

1.'갑'은 이용자의 정보수집시 서비스의 제공에 필요한 최소한의 정보를 수집합니다. 

2.제공된 개인정보는 당해 이용자의 동의없이 목적외의 이용이나  제3자에게 제공할 수 없으며, 이에 대한 모든 책임은 '갑'이 집니다. 다만, 다음의 경우에는 예외로 합니다. 
 ①통계작성, 학술연구 또는 시장조사를 위하여 필요한 경우로서 특정 개인을 식별할 수 없는 형태로 제공하는 경우  
 ②전기통신기본법 등 법률의 규정에 의해 국가기관의 요구가 있는 경우
 ③범죄에 대한 수사상의 목적이 있거나 정보통신윤리 위원회의 요청이 있는 경우
 ④기타 관계법령에서 정한 절차에 따른 요청이 있는 경우


3.회원은 언제든지 '갑'이 가지고 있는 자신의 개인정보에 대해 열람 및 오류정정을 요구할 수 있으며 '갑'은 이에 대해 지체없이 처리합니다.



제12조 (회원의 의무)

1.회원은 관계법령, 이 약관의 규정, 이용안내 및 주의사항 등 '갑'이 통지하는 사항을 준수하여야 하며, 기타 '갑'의 업무에 방해되는 행위를 하여서는 안됩니다.

2.회원은 '갑'의 사전 승낙 없이 서비스를 이용하여 어떠한 영리 행위도 할 수 없습니다.

3.회원은 서비스를 이용하여 얻은 정보를 '갑'의 사전 승낙 없이 복사, 복제, 변경, 번역, 출판,방송 기타의 방법으로 사용하거나 이를 타인에게 제공할 수 없습니다.

4.회원은 이용신청서의 기재내용 중 변경된 내용이 있는 경우 서비스를 통하여 그 내용을 '갑'에게 통지하여야 합니다.

5.회원은 서비스 이용과 관련하여 다음 각 호의 행위를 하여서는 안됩니다. 
  ①다른 회원의 아이디(ID)를 부정 사용하는 행위 
  ②범죄행위를 목적으로 하거나 기타 범죄행위와 관련된 행위 
  ③선량한 풍속, 기타 사회질서를 해하는 행위
  ④타인의 명예를 훼손하거나 모욕하는 행위  
  ⑤타인의 지적재산권 등의 권리를 침해하는 행위 
  ⑥해킹행위 또는 컴퓨터바이러스의 유포행위  
  ⑦타인의 의사에 반하여 광고성 정보 등 일정한 내용을 지속적으로 전송 또는 타 사이트를 링크하는 행위  
  ⑧서비스의 안전적인 운영에 지장을 주거나 줄 우려가 있는 일체의 행위
  ⑨기타 관계법령에 위배되는 행위  
  ⑩게시판 등 커뮤니티를 통한 상업적 광고홍보 또는 상거래 행위


제13조 (게시물 또는 내용물의 삭제) 

'갑'은 서비스의 게시물 또는 내용물이 제12조의 규정에 위반되거나 '갑' 소정의 게시기간을 초과하는 경우 사전 통지나 동의 없이 이를 삭제할 수 있습니다.


제14조 (게시물에 대한 권리·의무)

게시물에 대한 저작권을 포함한 모든 권리 및 책임은 이를 게시한 회원에게 있습니다.


제15조 (양도금지)

회원이 서비스의 이용권한, 기타 이용계약상 지위를 타인에게 양도, 증여할 수 없으며, 이를 담보로 제공할 수 없습니다.


제16조 (계약해지 및 이용제한) 

1.회원이 이용계약을 해지하고자 하는 때에는 본인이 서비스 또는 전자 우편을 통하여 해지하고자 하는 날의 1일전까지 (단, 해지일이 법정 공휴일인 경우 공휴일 개시 2일전까지)이를 '갑'에게 신청하여야 합니다.

2.'갑'은 해지 및 탈퇴를 한 회원이 다시 이용신청을 하는 경우 일정기간 그 승낙을 제한할 수 있습니다.




제17조 (면책·배상)

1.'갑'은 회원이 서비스에 게재한 정보, 자료, 사실의 정확성, 신뢰성 등 그 내용에 관하여는 어떠한 책임을 부담하지 아니하고,  회원은 자기의 책임아래 서비스를 이용하며, 서비스를 이용하여 게시 또는 전송한 자료 등에 관하여 손해가 발생하거나 자료의 취사 선택, 기타서비스 이용과 관련하여 어떠한 불이익이 발생 하더라도 이에 대한 모든 책임은 회원에게 있습니다.

2.'갑'은 제12조의 규정에 위반하여 회원간 또는 회원과 제3자간에 서비스를 매개로 하여 물품거래 등과 관련하여 어떠한 책임도 부담하지 아니하고, 회원이 서비스의 이용과 관련하여 기대하는 이익에 관하여 책임을 부담하지 않습니다. 

3.회원 아이디(ID)와 비밀번호의 관리 및 이용상의 부주의로 인하여 발생 되는 손해 또는 제3자에 의한 부정사용 등에 대한 책임은 모두 회원에게 있습니다.

4.회원이 제12조, 기타 이 약관의 규정을 위반함으로 인하여 '갑'이 회원 또는 제3자에 대하여 책임을 부담하게 되고, 이로써 '갑'에게 손해가 발생하게 되는 경우, 이 약관을 위반한 회원은 '갑'에게  발생하는 모든 손해를 배상하여야 하며, 동 손해로부터 '갑'을 면책시켜야 합니다.




제18조 (분쟁의 해결) 

1.'갑'과 회원은 서비스와 관련하여 발생한 분쟁을 원만하게 해결하기 위하여 필요한 모든 노력을 하여야 합니다.

2.1항의 규정에도 불구하고 분쟁으로 인하여 소송이 제기될 경우 소송은 '갑'의 소재지를 관할하는 법원의 관할로 합니다.


부  칙

제 1 조 (시행일) 이 약관은 2018년 12월 30일부터 시행한다.  
	</textarea>
    </td>
    <tr>
    <td>
      <label for="userid">아이디</label>
    </td>
    <td>
      <input type="text" class="form-control" name="userid" id="userid" size="12" maxlength="12" placeholder="아이디">
      <button class="form-control btn btn-primary" type="button" onclick="ID_Check()">중복확인</button>
    </td>
  </tr>
  <tr>
   <td> 
     <label for="userpw">비밀번호</label>
   </td>
   <td>
     <input type="password" class="form-control" name="userpw" id="userpw" maxlength="12" placeholder="비밀번호">
   </td>
  </tr>
  <tr>
   <td> 
     <label for="userpw2">비밀번호 확인</label>
   </td>
   <td>
      <input type="password" class="form-control" name="userpw2" id="userpw2" maxlength="12" placeholder="비밀번호 확인">
  </tr>
   <tr>
   <td> 
     <label for="username">이름</label>
   </td>
   <td>
      <input type="text" class="form-control" name="username" id="username" maxlength="10" placeholder="이름">
  </tr>
    <tr>
   <td> 
     <label for="nickname">닉네임</label>
   </td>
   <td>
      <input type="text" class="form-control" name="nickname" id="nickname" maxlength="10" placeholder="닉네임">
  </td>
  </tr> 
   <tr>
   <td> 
     <label for="email">메일주소</label>
   </td>
   <td>
      <input type="email" class="form-control" name="email" id="email" placeholder="메일주소">
                <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
  </td>
  </tr>
      <tr>
   <td> 
     <label for="birthdate">생년월일</label>
   </td>
   <td>
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
  </td>
  </tr> 
  <tr colspan=3>
   <td> 
    <p><span>Decorating's 이용약관 동의
									<input type="checkbox" name="req">
								</span></p>
   </td>
   <td colspan=2 align="right">
      <div class="col-md-12 submit-btn">
                <input class="btn btn-primary" type="button" name="check" id="check" onclick="chk()" value="회원 가입">
                <input class="btn btn-primary" type="button" name="cancel"  value="취소" onclick="window.location.href='/EBookProject/'">
      </div>
  </td>
  </tr>
</table>
</div>
</form>
</article>

  
    <footer id="pageFooter">
  		<!-- Footer -->
		<%@ include file="../../include/pageFooter.jsp" %>
  </footer>
</body>
</html>