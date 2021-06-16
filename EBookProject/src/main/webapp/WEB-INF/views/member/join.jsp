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
var checkID = false;
var checkPWD = false;
var checkBIRTH = false;
var checkNAME = false;
var checkNICKNAME = false;
var checkEMAIL = false;

$(document).ready(function() {
	
	// 아이디 입력값 체크
	$("#userid").keyup(function(){
		var userid = $("#userid").val();
		var oMsg = $("#userid_message");
		var regExpId = /^[0-9a-z]+$/;
		if (userid==false) {
			oMsg.css("color", "red");
			oMsg.text("아이디를 입력해주세요.");
			checkID = false;
		}else if(regExpId.test(userid)==false){
			oMsg.css("color","red");
			oMsg.text("숫자,영문만 입력가능합니다.")
		} else {
			$.ajax({	
				type : "POST",	
				url : "idcheck",
				data : {
					"userid" : userid
				},
				success : function(data) {
					if (data == "use") {
						oMsg.css("color", "green");
						oMsg.text("사용 가능한 아이디입니다.");
						checkID = true;
					} else if (data == "notuse") {
						oMsg.css("color", "red");
						oMsg.text("이미 존재하는 아이디입니다.");
						checkID = false;
					} else if (userid==""){
						oMsg.css("color", "red");
						oMsg.text("아이디를 입력해주세요.");
						checkID = false;
					}
				}
			});
		}
	});
	
	// 비밀번호 입력값 체크
	$("#userpw").keyup(function() {
		var regExpPw = /^(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{8,50}$/;
		var userpw = $("#userpw").val();
		var userpw_message = $("#userpw_message");
		if(regExpPw.test(userpw) == false){
			userpw_message.text("최소 8자리의 최소 한개의 숫자 혹은 특수문자를 포함하여주세요.");
			userpw_message.css("color","red");
		}else{
			userpw_message.css("color","green");
			userpw_message.text("사용가능한 비밀번호입니다.");
		}
	});	
	
	
	// 비밀번호 확인 입력값 체크
	$("#userpw_check").keyup(function() {
		var userpw_check_message = $("#userpw_check_message");
		
		// 비밀번호란 또는 비밀번호 확인란이 공백일 때
		if ($("#userpw").val() == "" || $("#userpw_check").val() == "") {
			userpw_check_message.css("color", "red");
			userpw_check_message.text("비밀번호를 입력해주세요.");
			checkPWD = false;
			
			
		} else if ($("#userpw").val() != $("#userpw_check").val()) {
			checkPWD = false;
			userpw_check_message.text("비밀번호가 동일하지 않습니다.");
			userpw_check_message.css("color", "red");
		}
			else if ($("#userpw").val() == false){
				userpw_check_message.css("color", "red");
				userpw_check_message.text("비밀번호를 입력해주세요.");
				checkPWD = false;
		} else {
			checkPWD = true;
			userpw_check_message.text("비밀번호가 동일합니다.");
			userpw_check_message.css("color", "green");
		}
	});	
	
	
	// 이름 체크
	$("#username").blur(function() {
		checkName();
	});
	
	// 닉네임 체크
	$("#nickname").blur(function() {
		checkNickName();
	});
	
});

function checkName() {
	var username_message = $("#username_message");
	var nonchar = /[^가-힣a-zA-Z]/gi;
	
	var username = $("#username").val();
	if (username == false) {
		username_message.css("color", "red");
		username_message.text("필수정보입니다.");
		return false;
	}
	
	if (username != "" && nonchar.test(username)) {
		username_message.css("color", "red");
		username_message.text("한글과 영문 대 소문자를 사용하세요. (특수기호, 공백 사용 불가)");
		return false;
	}
	checkNAME = true;
	username_message.css("color","green");
	username_message.text("멋진이름이시군요!");
	return true;
}

function checkNickName() {
	var nickname = $("#nickname").val();
	var nonchar = /[^가-힣a-zA-Z]/gi;
	
	var nickname_message = $("#nickname_message");
	if (nickname == false) {
		nickname_message.css("color", "red");
		nickname_message.text("필수정보입니다.");
		return false;
	} else if (nickname != "" && nonchar.test(nickname)) {
		nickname_message.css("color", "red");
		nickname_message.text("한글과 영문 대 소문자를 사용하세요. (특수기호, 공백 사용 불가)");
		return false;
	} else {
		$.ajax({	
		type : "POST",	
		url : "nicknamecheck",
		data : {
			"nickname" : nickname
		},
		success : function(data) {
			if (data == "use") {
				nickname_message.css("color","green");
				nickname_message.text("멋진 닉네임이시군요!");
				checkNICKNAME = true;
			} else if (data == "notuse") {
				nickname_message.css("color", "red");
				nickname_message.text("이미 존재하는 닉네임입니다.");
				checkNICKNAME = false;
			} else if (nickname==""){
				nickname_message.css("color", "red");
				nickname_message.text("닉네임을 입력해주세요.");
				checkNICKNAME = false;
			}
		}
	});
		
	}

	return true;
}

function checkEmail(){
	 var email = $("#email").val();
	 var regExpEm = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
	 var email_message = $("#email_message");
	
	 
	 	if(regExpEm.test(email)==false){
		checkEMAIL = false;
		email_message.css("color","red");
		email_message.text("잘못된 형식의 이메일 주소입니다.")
	}
	else{
		email_message.css("color","green");
		email_message.text("사용하실 수 있는 이메일 주소입니다.")
		checkEMAIL = true;
		return true;
	}
	 	
	 	if(email==false){
	 		email_message.css("color","red");
	 		email_message.text("필수정보입니다.");
	 		checkEMAIL = false;
	 	}
}

function checkBirth(){
	var birthdate = $("#birthdate").val();
	var regExpbirth = /^\d{6}$/;
	var birthdate_message = $("#birthdate_message");
	
	if(regExpbirth.test(birthdate) == false){
		birthdate_message.css("color","red");
		birthdate_message.text("주민등록번호 앞 6자리를 입력해주세요.");
		checkBIRTH = false;

	}else{
		birthdate_message.text("");
		checkBIRTH = true;
		return true;
	}
	
	if(birthdate == false){
		birthdate_message.css("color","red");
		birthdate_message.text("필수정보입니다.");
		checkBIRTH = false;
	}
}

function Signup() {

			console.log($("input:checkbox[id='req']").is(":checked"));
	if($("input:checkbox[id='req']").is(":checked") == false){
		alert("이용약관을 동의해 주세요");
	} else {
		
	
	var userid = $("#userid").val();
	var userpw= $("#userpw").val();
	var username = $("#username").val();
	var nickname= $("#nickname").val();
	var birthdate = $("#birthdate").val();
	var email = $("#email").val();





	
	if (checkID == false) { console.log("아이디 중복검사 안함"); }
	if (checkPWD == false) { console.log("비밀번호 다름"); }
	if (checkNAME == false) { console.log("이름이 비어있음"); }
	if (checkNICKNAME == false) { console.log("닉네임이 비어있음"); }
	if (checkBIRTH == false) { console.log("생일이 비어있음"); }
	if (checkEMAIL == false) { console.log("이메일이 비어있음"); }
	if (checkID == false || checkPWD == false || checkNAME == false || checkBIRTH == false || checkNICKNAME == false || checkEMAIL == false) {
		alert("빠진 정보가 있는지 확인해주세요.");
	} else {
		$.ajax({
			type : "POST",
			url : "join/proc",
			data : {
				"userid" : userid,
				"userpw" : userpw,
				"username" : username,
				"nickname" : nickname,
				"birthdate" : birthdate,
				"email" : email
			},
			success : function(data) {
				alert("회원가입을 축하드립니다.")
				window.location.href="login";
			}
		});
	}
}
}

</script>
</head>
<body>
  <header id="pageHeader">
  	<!-- Header -->
	<%@ include file="../../include/pageHeader.jsp" %>
  </header>
  
  <article id="mainArticle">
	  <!-- Body -->
<h2>회원가입</h2>
<div>
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

    <p><span>이용약관에 동의합니다.
		<input type="checkbox" id="req" name="req">
		</span></p>

</div>
<div>
	<form name="form1" method="post" action="#">
		<p><label for="userid">아이디</label></p>
		<p><input type="text" class="form-control" id="userid" name="userid" placeholder="아이디를 입력하세요."></p>
		<p id="userid_message"></p>
		<p><label for="userpw" >비밀번호</label></p>
		<p><input type="password" class="form-control" id="userpw" name="userpw" placeholder="최소 8자리의 최소 한개의 숫자 혹은 특수문자를 포함하여주세요."></p>
		<p id="userpw_message"></p>
		<p><label for="userpw_check"  >비밀번호 확인</label></p>
		<p><input type="password" id="userpw_check" name="userpw_check" class="form-control"></p>
		<p id="userpw_check_message"></p>
		<p><label for="username">이름</label></p>
		<p><input type="text" id="username" name="username" class="form-control"></p>
		<p id="username_message"></p>
		<p><label for="nickname">닉네임</label></p>
		<p><input type="text" id="nickname" name="nickname" class="form-control"></p>
		<p id="nickname_message"></p>
		<p><label for="email">이메일<em> 비밀번호 찾기 시 이메일로 비밀번호가 발송됩니다.</em></label></p>
		<p><input type="text" id="email" name="email" class="form-control" oninput="checkEmail()" placeholder="ex) EBook2222@naver.com"></p>
		<p id="email_message"></p>		
		<p><label for="birthdate">생년월일</label></p>
		<p><input type="text" id="birthdate" name="birthdate" class="form-control" oninput="checkBirth()" placeholder="ex) 931207"></p>
		<p id="birthdate_message"></p>
		<button type="button" class="btn btn-primary" onclick = "Signup()">회원가입</button>
		<button type="button" class="btn btn-danger" onclick="cancel()">취소</button>
	</form>

</div>




</article>

  
    <footer id="pageFooter">
  		<!-- Footer -->
		<%@ include file="../../include/pageFooter.jsp" %>
  </footer>
</body>
</html>