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
        <div class="id1">
            아이디 찾기
            <div class="id2">
                <ul> 
                    <li>봄숲 에서는 E-Mail주소로 로그인할 수 있습니다.<br></li>
                    <li>이름과 E-Mail 주소를 입력 후 "가입 여부 확인하기"<br>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        버튼을 클릭해 주시면 가입 여부를 알려드립니다.</li><br>
                </ul>                
                <div class="topline">
                </div>
                <br>
                <div class="id3">
                    <label>이름</label> <input type="text" class="id1text" size="10"><br><br>
                    <label>E-mail 주소</label> <input type="text" class="id1text" size="10"><br><br>
                    <a href="id2.html"><button id="Confirmbut">가입여부 확인하기</button></a><br>
                </div>
                <br><div class="topline">
                </div><br>
                &nbsp;&nbsp;&nbsp;<label>고객센터 1544 - 0000</label>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;
                <button id="emailquestion">E-mail로 문의하기</button><br>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                
                <label id="idnologin">로그인 필요 없음</label>
            </div>
        </div>    
    <footer>
        <div class="wrapper">
            <p><small>&copy; 2021 Bomsoup</small></p>
        </div>
    </footer>
</body>
</html>
