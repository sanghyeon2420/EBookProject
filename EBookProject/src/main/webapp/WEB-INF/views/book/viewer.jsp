<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Bookview</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&family=Nanum+Gothic&family=Nanum+Myeongjo&display=swap" rel="stylesheet">
<style>
    @font-face {
        font-family: 'Arita-dotum-Medium';
        src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/Arita-dotum-Medium.woff') format('woff');
        font-weight: normal;
        font-style: normal;
    }
    
    // 스크롤 이동시 부드럽게 구현
    html { 
  		scroll-behavior: smooth; 
	} 
	
    body {
        margin:0;
    }

    .gridline {
        display: grid;
        border: dotted 0px;
        grid-template-areas:
            "headline headline headline"
            "navline viewline adsline"
            "footline footline footline";
        grid-template-rows: 15vh 1fr 15vh;
        grid-template-columns: 20vh 1fr 20vh;
        height: 100%;
        grid-gap: 0px;
        padding:0;
    }

    .headline {
        width: 100%;
        height: 15vh;
        background-color: #262626;
        color: #F7F7F7;
        grid-area: headline;
        top: 0;
        left: 0;
        position: fixed;
        overflow: visible;
    }

    .fixline {
        display: flex;
        flex-wrap: nowrap;
        justify-content: space-between;
        height: 15vh;
    }
    
    a:visited, a:link{
    	text-decoration:none;
    	color: #F7F7F7;
    }

    .footline {
        width: 100%;
        height: 15vh;
        background-color: #262626;
        color: #F7F7F7;
        grid-area: footline;
        bottom: 0;
        left: 0;
        position: fixed;
    }

    .footline span {
        font-size: 1.5em;
        margin-bottom: 1vh;
    }

    .navline {
        grid-area: navline;
    }

    .adsline {
        grid-area: adsline;
    }

    .viewline {
        grid-area: viewline;
    }

    .homeline, .titlename, .setting, .lefticon, .foottitle, .righticon {
    width: 30vw;
    height: 10vh;
    }

    .homeline,.lefticon {
        text-align: left;
        padding-left: 5vw;
        padding-top: 5vh;
    }

    .setting, .righticon {
        text-align: right;
        padding-right: 5vw;
        padding-top: 5vh;
    }

    .bookview {
        padding-top: 5vh;
        padding-bottom: 5vh;
    }

    .titlename h2,h4 {
        margin: 3vh;
        text-align: center;
    }

    input#menu {
        display: none;
    }

    nav#setup {
        display: none;
        color : #262626;
        text-align: right;
    }
    
    nav#setup ul{
    	display: inline-table;
    }

    nav#setup li{
        list-style-type: none;
    }

    input#menu:checked + nav#setup {
        display: block;
    }

    input[type=radio]:hover + label {
        color: #4b4e6c;
        font-weight: 700;
    }

    input[type=radio] {
        display: none;
    }

    tr, td, th {
        width: 4vw;
        height: 4vh;
        text-align: center;
        border : none;
        padding :0;
    }

    .bookview {
        font-family: 'Nanum Gothic', sans-serif;
        font-size: 18px;
        line-height: 2.4;
        background-color: #F7F7F7;
        color: #262626;
        font-weight: 100;
    } 
    
    .adsline, .navline {
    	background-color: #F7F7F7;
    }
    
    .table {
    	background-image: radial-gradient(circle at 50% -20.71%, #fef6d9 0, #f8eac7 25%, #f2deb5 50%, #edd2a3 75%, #e8c593 100%);
    	}
    	
    #setup label{
        border : 0px #262626;
        border-radius: 20px; 
        box-sizing: border-box;
    }
    
</style>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.2/jquery.min.js"></script>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css">
    <script>
       /* $(function () { // 헤더가리기
            var lastScrollTop = 0, delta = 15;
            $(window).scroll(function (event) {
                var st = $(this).scrollTop();

                if (Math.abs(lastScrollTop - st) <= delta)
                    return; // 스크롤값을 받아서 리턴한다.
                if ((st > lastScrollTop) && (lastScrollTop > 0)) {
                    // downscroll code
                    $(".headline").css("top", "-550px"); // 스크롤을 내렸을때 .headline의 CSS 속성중 top 값을 -550px로 변경한다.
                    $(".footline").css("bottom", "-550px"); // 스크롤을 내렸을때 .headline의 CSS 속성중 top 값을 -550px로 변경한다.
                } else {
                    // upscroll code
                    $(".headline").css("top", "0px"); // 스크롤을 올렸을때 .headline의 CSS 속성중 top 값을 0px로 변경한다.
                    $(".footline").css("bottom", "0px"); // 스크롤을 올렸을때 .headline의 CSS 속성중 top 값을 0px로 변경한다.

                }
                lastScrollTop = st;
            });
        })
*/
// 우측 클릭 방지 
        document.onmousedown = disableclick;
        status = "마우스 우클릭 하지 말아주세요!!";
        function disableclick(event) {
            if (event.button == 2) {
                alert(status);
                return false;
            }
        }
//F12 버튼 방지
        $(document).ready(function(){
        	textview();
        $(document).bind('keydown',function(e){
            if ( e.keyCode == 123 ) { //F12
                e.preventDefault();
                e.returnValue = false;
                alert("F12버튼 누르지 말아주세요!!")
            }
        });
        }); 

        function FontAritaDotum() {
            document.getElementById("bookview").style.fontFamily = "Arita-dotum-Medium";
        }
        function FontJua() {
            document.getElementById("bookview").style.fontFamily = "Jua";
        }
        function NanumGothic() {
            document.getElementById("bookview").style.fontFamily = "Nanum Gothic";
        }
        function NanumMyeongjo() {
            document.getElementById("bookview").style.fontFamily = "Nanum Myeongjo";
        }
        function size12() {
            document.getElementById("bookview").style.fontSize = "12px";
        }
        function size18() {
            document.getElementById("bookview").style.fontSize = "18px";
        }
        function size24() {
            document.getElementById("bookview").style.fontSize = "24px";
        }
        function size32() {
            document.getElementById("bookview").style.fontSize = "32px";
        }
        function lH100() {
            document.getElementById("bookview").style.lineHeight = "1";
        }
        function lH170() {
            document.getElementById("bookview").style.lineHeight = "1.7";
        }
        function lH240() {
            document.getElementById("bookview").style.lineHeight = "2.4";
        }
        function lH300() {
            document.getElementById("bookview").style.lineHeight = "3";
        }
        function bggreen() {
            document.getElementById("bookview").style.backgroundColor = "#00AF5B";
            document.getElementById("navline").style.backgroundColor = "#00AF5B";
            document.getElementById("adsline").style.backgroundColor = "#00AF5B";
            document.getElementById("headline").style.backgroundColor = "#262626";
            document.getElementById("footline").style.backgroundColor = "#262626";
            document.getElementById("headline").style.color = "#F7F7F7";
            document.getElementById("footline").style.color = "#F7F7F7";
        }
        function bgwhite() {
            document.getElementById("bookview").style.backgroundColor = "#F7F7F7";
            document.getElementById("navline").style.backgroundColor = "#F7F7F7";
            document.getElementById("adsline").style.backgroundColor = "#F7F7F7";
            document.getElementById("headline").style.backgroundColor = "#262626";
            document.getElementById("footline").style.backgroundColor = "#262626";
            document.getElementById("headline").style.color = "#F7F7F7";
            document.getElementById("footline").style.color = "#F7F7F7";
        }
        function bgblack() {
            document.getElementById("bookview").style.backgroundColor = "#262626";
            document.getElementById("navline").style.backgroundColor = "#262626";
            document.getElementById("adsline").style.backgroundColor = "#262626";
            document.getElementById("headline").style.backgroundColor = "#F7F7F7";
            document.getElementById("footline").style.backgroundColor = "#F7F7F7";
            document.getElementById("headline").style.color = "#262626";
            document.getElementById("footline").style.color = "#262626";
        }
        function bgbeige() {
            document.getElementById("bookview").style.backgroundColor = "#ffeb7a";
            document.getElementById("navline").style.backgroundColor = "#ffeb7a";
            document.getElementById("adsline").style.backgroundColor = "#ffeb7a";
            document.getElementById("headline").style.backgroundColor = "#262626";
            document.getElementById("footline").style.backgroundColor = "#262626";
            document.getElementById("headline").style.color = "#F7F7F7";
            document.getElementById("footline").style.color = "#F7F7F7";
        }
        function tcblack() {
            document.getElementById("bookview").style.color = "#262626";
        }
        function tcwhite() {
            document.getElementById("bookview").style.color = "#F7F7F7";
        }
        function tcgray() {
            document.getElementById("bookview").style.color = "gray";
        }
        function tcbeige() {
            document.getElementById("bookview").style.color = "#ffeb7a";
        }
        function bdnormal() {
        	document.getElementById("bookview").style.fontWeight = "400";
        }
        function bolder() {
        	document.getElementById("bookview").style.fontWeight = "700";
        }
        function darkmode() {
        	document.getElementById("bookview").style.color = "#F7F7F7";
        	document.getElementById("bookview").style.backgroundColor = "#3a3d3b";
        	document.getElementById("navline").style.backgroundColor = "#3a3d3b";
        	document.getElementById("adsline").style.backgroundColor = "#3a3d3b";
        	document.getElementById("headline").style.backgroundColor = "#262626";
        	document.getElementById("footline").style.backgroundColor = "#262626";	
        }
        function defaultmode() {
        	document.getElementById("bookview").style.fontFamily = "Nanum Gothic";
        	document.getElementById("bookview").style.fontSize = "18px";
        	document.getElementById("bookview").style.lineHeight = "2.4";
        	document.getElementById("bookview").style.backgroundColor = "#F7F7F7";
            document.getElementById("navline").style.backgroundColor = "#F7F7F7";
            document.getElementById("adsline").style.backgroundColor = "#F7F7F7";
            document.getElementById("headline").style.backgroundColor = "#262626";
            document.getElementById("footline").style.backgroundColor = "#262626";
            document.getElementById("bookview").style.color = "#262626";
            document.getElementById("headline").style.color = "#F7F7F7";
            document.getElementById("footline").style.color = "#F7F7F7";
            document.getElementById("bookview").style.fontWeight = "400";
        }
        
        
        function textview(){
        	var xhr = new XMLHttpRequest();

        	xhr.onreadystatechange = function() {
        		console.log("readyState : "+xhr.readyState);
        		console.log("status : "+xhr.status);
        		if (xhr.readyState == 4 && xhr.status == 200) {
        			document.getElementById("bookview").innerHTML = xhr.responseText;
        		}
        	}
        	
        	
        	xhr.open("GET","resources/text/${b_category}/${b_name}/${content}.txt", "true");
        	
        	xhr.setRequestHeader("Content-Type", "text/plain;charset=euc-kr"); 
        	//ajax로 url 요청시 한글로 인코딩 변경
        	
        	xhr.send();
        }
    </script>
</head>

<body style="overflow-x: hidden" oncontextmenu="return false" onselectstart="return false" ondragstart="return false">
    <div class="gridline">
        <div class="headline" id="headline">
            <div class="fixline">
                <div class="homeline">
                    <i class="fas fa-home fa-2x" onclick="location.href='<%=request.getContextPath() %>/book/detail?idx=${ebook_no }'" style="cursor:pointer;"></i>
                </div>
                <div class="titlename">
                    <h2>${b_name }</h2>
                    <h4>${content}. ${content_name}</h4>
                </div>
                <div class="setting">
                    <label class="menu" for="menu"><i class="fas fa-cog fa-2x" style="cursor:pointer"></i></label>
                    <input id="menu" type="checkbox">
                    <nav id="setup">
                        <ul>
                            <table border="1" class="table">
                                <tr>
                                    <th>글꼴</th>
                                    <td><input type="radio" id="Jua" name="fontfamily" onclick="FontJua()">
                                        <label for="Jua" style="font-family : 'Jua'">주아</label>
                                    </td>
                                    <td><input type="radio" id="AritaDotum" name="fontfamily"
                                            onclick="FontAritaDotum()">
                                        <label for="AritaDotum" style="font-family : 'Arita-dotum-Medium'">돋움</label>
                                    </td>
                                    <td><input type="radio" id="NanumGothic" name="fontfamily" onclick="NanumGothic()">
                                        <label for="NanumGothic" style="font-family : 'Nanum Gothic'">고딕</label>
                                    </td>
                                    <td><input type="radio" id="NanumMyeongjo" name="fontfamily"
                                            onclick="NanumMyeongjo()">
                                        <label for="NanumMyeongjo" style="font-family : 'Nanum Myeongjo'">명조</label>
                                    </td>
                                </tr>
                                <tr>
                                    <th>글자크기</th>
                                    <td><input type="radio" id="12" name="fontsize" onclick="size12()">
                                        <label for="12">12</label>
                                    </td>
                                    <td><input type="radio" id="18" name="fontsize" onclick="size18()">
                                        <label for="18">18</label>
                                    </td>
                                    <td><input type="radio" id="24" name="fontsize" onclick="size24()">
                                        <label for="24" selected="selected">24</label>
                                    </td>
                                    <td><input type="radio" id="32" name="fontsize" onclick="size32()">
                                        <label for="32">32</label>
                                    </td>
                                </tr>
                                <tr>
                                    <th>줄간격</th>
                                    <td><input type="radio" id="1" name="lineheight" onclick="lH100()">
                                        <label for="1">1</label>
                                    </td>
                                    <td><input type="radio" id="1.7" name="lineheight" onclick="lH170()">
                                        <label for="1.7">1.7</label>
                                    </td>
                                    <td><input type="radio" id="2.4" name="lineheight" onclick="lH240()">
                                        <label for="2.4" selected="selected">2.4</label>
                                    </td>
                                    <td><input type="radio" id="3" name="lineheight" onclick="lH300()">
                                        <label for="3">3</label>
                                    </td>
                                </tr>
                                <tr>
                                    <th>배경색상</th>
                                    <td><input type="radio" id="bggreen" name="bgcolor" onclick="bggreen()">
                                        <label for="bggreen" style="background-color : #00AF5B; color: #00AF5B" >색</label>
                                    </td>
                                    <td><input type="radio" id="bgwhite" name="bgcolor" onclick="bgwhite()">
                                        <label for="bgwhite" style="background-color : #F7F7F7; color: #F7F7F7" >색</label>
                                    </td>
                                    <td><input type="radio" id="bgblack" name="bgcolor" onclick="bgblack()">
                                        <label for="bgblack" style="background-color : #262626; color: #262626" >색</label>
                                    </td>
                                    <td><input type="radio" id="bgbeige" name="bgcolor" onclick="bgbeige()">
                                        <label for="bgbeige" style="background-color : #f5f5dc; color:#ffeb7a" >색</label>
                                    </td>
                                </tr>
                                <tr>
                                    <th>글자색상</th>
                                    <td><input type="radio" id="tcblack" name="textcolor" onclick="tcblack()">
                                        <label for="tcblack" style="background-color : #262626; color: #262626" >색</label>
                                    </td>
                                    <td><input type="radio" id="tcwhite" name="textcolor" onclick="tcwhite()">
                                        <label for="tcwhite" style="background-color : #F7F7F7; color: #F7F7F7" >색</label>
                                    </td>
                                    <td><input type="radio" id="tcgray" name="textcolor" onclick="tcgray()">
                                        <label for="tcgray" style="background-color : gray; color: gray" >색</label>
                                    </td>
                                    <td><input type="radio" id="tcbeige" name="textcolor" onclick="tcbeige()">
                                        <label for="tcbeige" style="background-color : #f5f5dc; color:#ffeb7a" >색</label>
                                    </td>
                                </tr>
                                <tr>
                                    <th>기타</th>
                                    <td><input type="radio" id="bdnormal" name="etc" onclick="bdnormal()">
                                        <label for="bdnormal" style="font-weight: 400;">보통</label>
                                    </td>
                                    <td><input type="radio" id="bolder" name="etc" onclick="bolder()">
                                        <label for="bolder" style="font-weight: 700;">굵게</label>
                                    </td>
                                    <td><input type="radio" id="darkmode" name="etc" onclick="darkmode()">
                                        <label for="darkmode">다크</label>
                                    </td>
                                    <td><input type="radio" id="defaultmode" name="etc" onclick="defaultmode()">
                                        <label for="defaultmode">초기화</label>
                                    </td>
                                </tr>
                            </table>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
        <div class="viewline">
            <div class="bookview" id="bookview">

            </div>
        </div>
        <div class="navline" id="navline">
        </div>
        <div class="adsline" id="adsline">
        </div>
        <div class="footline" id="footline">
            <div class="fixline">
				<c:if test="${content > 1 }">
				<div class="lefticon">
                    <a href="<%=request.getContextPath()%>/book/contentview/?book=${book}&content=${content-1}"><i class="fas fa-arrow-circle-left fa-2x"></i><span> 이전화 </span></a>
                </div>				
				
				</c:if>

                <div class="foottitle">
                </div>
				<c:if test="${contentCount > content}">				
                <div class="righticon">
                    <a href="<%=request.getContextPath()%>/book/contentview/?book=${book}&content=${content+1}"><span> 다음화 </span><i class="fas fa-arrow-circle-right fa-2x"></i></a>
                </div>
				</c:if>
            </div>
        </div>
    </div>
</body>

</html>