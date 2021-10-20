<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bomsoup login</title>
    <link href="resources/css/login-style.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="https://unpkg.com/ress/dist/ress.min.css">
    <!-- favicon (Real Favicon Generator 등에서 가공 필요) -->
    <link rel="icon" type="image/x-icon" href="resources/image/khfavicon.ico">
    <!--웹 폰트-->
    <link href="https://fonts.googleapis.com/css2?family=Bebas+Neue&display=swap" rel="stylesheet">
    <!-- 외부 스타일 시트 -->
	<link href="<%= request.getContextPath() %>/resources/css/login-style.css" rel="stylesheet">
    <script>
    
    </script>
</head>
<body>
    <div id="top">
        <header class="page-header">
            <!--
            <h1>
                <a href="#">
                    <img class="logo" src="image/logo.jpg" alt="Bomsoup">
                </a>
            </h1>
            -->
            <nav>
                <ul class="main-nav">
                    <li><a href="login.html">로그인</a></li>
                    <li><a href="joinmembership.html">회원가입</a></li>
                    <li><a href="#">마이페이지</a></li>
                    <li><a href="#">장바구니</a></li>
                    <li><a href="#">고객센터</a></li>
                </ul>
            </nav>
        </header>
        <!-- 페이지 제목 -->
        <div class="mainlogo wrapper">
            <h2 class="page-title">
                <a href="#"><img class="logo" src="resources/image/logo.png" alt="home logo"></a>
                    <select class="textbox" id="nationality">
                        <option value="writer" class="so">작가검색</option>
                        <option value="bk" class="so">도서검색</option>
                        <option value="Search" class="so" selected>통합검색</option>
                    </select type="submit">                                    
                <input type="text" class="textbox">
                <a href="#"><input type="button" class="textbox2" value="검색"></a>
            </h2>
        </div>        
        <div class="topline">
        </div>
    </div>
    <div class="main-center2">
        <h1>봄숲 개인 회원가입</h1>
        <fieldset class="lofd">
            <legend id="lolegend">기본 정보 입력</legend>
            <div class="topline">
            </div>
            <table class="lotb">
                <tr>
                    <th>아이디</th>
                    <td><input type="text" class="lomb" placeholder="아이디 10글자 이내">&nbsp;
                        <a href="#"><input type="button" class="lomb" value="중복 확인"></a></td>
                </tr>
                <tr>
                    <th>이메일</th>
                    <td><input type="text" id="email1" class="lomb"  size="10">&nbsp;@&nbsp;<input type="text" id="email2" class="lomb"  size="10">&nbsp;
                        <select  class="lomb" name="emailSelection" id="emailSelection">
                            <option value="naver.com">naver.com</option>
                            <option value="daum.com">daum.com</option>
                            <option value="gmail.com">gmail.com</option>
                            <option value="hanmail.net">hanmail.net</option>
                            <option value="nate.com">nate.com</option>
                            <option value="1" selected>&nbsp;&nbsp;직접입력</option>
                        </select></td>
                </tr>
                <tr>
                    <th>비밀번호</th>
                    <td><input type="text" class="lomb" size="30" placeholder="영문,숫자,특수문자 포함 8자 이상">
                        </input>
                    </td>
                </tr>
                <tr>
                    <th>비밀번호 확인</th>
                    <td><input type="text" class="lomb" size="30"></td>
                </tr>
                <tr>
                    <th>휴대전화</th>
                    <td><input type="text" class="lomb" size="5"> -
                        <input type="text" class="lomb" size="5"> -
                        <input type="text" class="lomb" size="5">
                    </td>
                </tr>
                <tr>
                    <th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        개인정보 유효기간
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
                    <td><input type="radio">&nbsp;1년&nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="radio">&nbsp;3년&nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="radio">&nbsp;5년&nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="radio">&nbsp;탈퇴 시까지</td>
                </tr>                
            </table>
        </fieldset>
        <div class="topline">
        </div> 
        <fieldset class="lofd">
            <legend id="lolegend">부가 정보 입력</legend>
            <table class="lotb">
                <tr>
                    <th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;주소</th>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" class="lomb" size="10"></td>
                    <td><a href=""><button class="lomb">주소검색</button></a></td>
                </tr>
                <tr>
                    <th></th>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" class="lomb" size="20"></td>
                </tr>
                <tr>
                    <th></th>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" class="lomb" size="20"></td>
                </tr>
        </table>
        </fieldset>
        <div class="topline">
        </div>
        <fieldset class="lofd">
            <legend id="lolegend">약관 동의</legend>
            <table class="lotb">                
                <tr>
                    <th>봄숲 이용약관</th>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;약관 전체보기
                        <a href="#"><img class="terms" src="terms" alt="terms"></a> 
                    </td>
                </tr>
                <tr>
                    <th>봄숲 커뮤니티 이용약관</th>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;약관 전체보기
                        <a href="#"><img class="terms" src="terms" alt="terms"></a> 
                    </td>
                </tr>
                <tr>
                    <th>개인 정보 수집 및 이용</th>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;내용보기
                        <a href="#"><img class="terms" src="terms" alt="terms"></a> 
                    </td>
                </tr>
                <div class="joinme" onclick="bomsoup()">회원 가입하기</div>
                <script>
                    function bomsoup() {
                        alert("회원가입이 완료 되었습니다.");
                        window.location.href = "login.html";
                    }
                </script>
            </table>
        </fieldset>
        <div class="topline">
        </div>
    </div>
    <footer>
        <div class="wrapper">
            <p><small>&copy; 2021 Bomsoup</small></p>
        </div>
    </footer>
</body>
</html>
