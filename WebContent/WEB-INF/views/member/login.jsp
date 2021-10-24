<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bomsoup login</title>
    <link rel="stylesheet" href="https://unpkg.com/ress/dist/ress.min.css">
    <!-- favicon (Real Favicon Generator 등에서 가공 필요) -->
    <link rel="icon" type="image/x-icon" href="resources/image/khfavicon.ico">
    <!-- 외부 스타일 시트 -->
    <link href="<%= request.getContextPath() %>/resources/css/login-style.css" rel="stylesheet">
</head>
<body>	
    <!-- 
    <div id="top">
        <header class="page-header">            
            <nav>
                <ul class="main-nav">
                    <li><a href="login.html">로그인</a></li>
                    <li><a href="joinmembership.html">회원가입</a></li>
                    <li><a href="mypage.html">마이페이지</a></li>
                    <li><a href="#">장바구니</a></li>
                    <li><a href="#">고객센터</a></li>
                </ul>
            </nav>
        </header>
        -->
        <!-- 페이지 제목 -->
        <!-- 
        <div class="mainlogo wrapper">
            <h2 class="page-title">
                <a href="00_메인 추천.html"><img class="logo" src="resources/image/logo.png" alt="home logo"></a>    
            </h2>
            <div class="search_area">
                <form method="get">
                    <select id="searchCondition" name="searchCondition">
                        <option value="search">통합검색</option>
                        <option value="title">제목</option>
                        <option value="content">내용</option>
                    </select> 
                    <span class="input_area"> <input type="search"
                        name="searchValue" placeholder="검색할 내용을 입력하세요.">
                    </span>
                    <button type="submit">검색</button>
                </form>
            </div>
        </div>       
            <div class="topline">
            </div>
        </div>
		 -->
	<!-- 메뉴바 -->
	<%@ include file="/WEB-INF/views/common/menubar.jsp" %>
    <div class="main-center">
        <fieldset class="lofd">
            <legend id="lolegend">로그인</legend>
                <tr>
                    <td><input type="text" class="textbox" id="loginid" placeholder="아이디를 입력하세요"></td><br><br>
                </tr>
                <tr>
                    <td><input type="password" class="textbox" id="loginps" placeholder="비밀번호를 입력하세요"></td><br>                   
                </tr><br>
                <tr>
                    <td>
                        <input type="radio" id="loemailcheck" name="loemailcheck" value="loemailcheck" checked="checked">ID 또는 E-Mail 저장
                        <a href="id"><input type="button" value="아이디 찾기" class="idb"></a>
                        <a href="password"><input type="button" value="비밀번호 찾기" class="psb"></a><br>
                    </td>
                </tr>
                <a href="joinmembership"><input type="button" value="봄숲 간편 회원가입" class="mbjoin"></a><br>
                <div class="imgdiv">
                    <a href="#"><img class="naverlogo" src="<%= request.getContextPath() %>/resources/images/naver.jpg" alt="naver logo"></a>   
                    <a href="#"><img class="kakaologo" src="<%= request.getContextPath() %>/resources/images/kakao.jpg" alt="kako logo"></a>
                </div>             
            </fieldset>
            <button id="lobut" onclick="lolo()">로그인</button>
            <script>
                function lolo() {
                    alert("로그인");
                    window.location.href = "login";
                }
            </script>
    </div>
    <!-- footer -->
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
    <!--
    <footer>
        <div class="wrapper">
            <p><small>&copy; 2021 Bomsoup</small></p>
        </div>
    </footer>
    -->
</body>
</html>
