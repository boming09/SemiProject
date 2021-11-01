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
	<!-- 메뉴바 -->
	<%@ include file="/WEB-INF/views/common/menubar.jsp" %>
	<div class="main-center">
    <fieldset class="lofd">
        <legend id="lolegend"></legend>
            <tr>
                <td><input type="text" class="textbox" id="loginid" placeholder="아이디를 입력하세요"></td><br><br>
            </tr>
            <tr>
                <td><input type="password" class="textbox" id="loginps" placeholder="비밀번호를 입력하세요"></td><br>                   
            </tr><br>
            <tr>
                <td>
                    <input type="checkbox" id="loemailcheck" name="loemailcheck" value="loemailcheck" checked="checked">ID 또는 E-Mail 저장
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
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>
