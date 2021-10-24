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
        <div class="ps1">
            비밀번호 재설정
            <div class="ps2">
                <br>
                &nbsp;&nbsp;봄숲에 등록된 개인정보로 비밀번호 재설정 하기
                <p>
                    <font size="1">
                        2가지 인증 방식 중 하나를 선택해 주세요.<br>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;가입 정보에 저장된 휴대전화를 현재 사용하고 있지 않으면"E-mail"주소 를 체크합니다.<br>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(2가지 인증 방식 모두 가입된 E-mail주소는 입력해야 합니다.)
                    </font size>    
                </p><br>              
                <div class="topline">
                </div>
                <br>
                <div class="id3">
                    <input type="radio" class="psreset" name="phoneno"> 
                    <label class="psreset">휴대전화 번호</label>                    
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="radio" class="psreset" name="emailno">
                    <label class="psreset">E-mail 주소</label>
                    <br><br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <label>이름</label> <input type="text" class="id1text" size="10"><br><br>
                    <label>휴대전화 번호</label> <input type="text" class="id1text" size="10"><br><br>
                    &nbsp;&nbsp;
                    <label>E-mail 주소</label> <input type="text" class="id1text" size="10"><br><br>
                    <a href="password2.html"><button class="id2pagebut">다음단계</button></a><br>
                </div>
                <br><div class="topline">
                </div><br>
                &nbsp;&nbsp;&nbsp;<label>고객센터 1544 - 0000</label>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;
                <a href="emailconsulting.html"><button id="emailquestion">E-mail로 문의하기</button></a><br>
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
    <!-- footer -->
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>