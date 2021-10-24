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
        <div class="ps3">
            비밀번호 재설정
            <div class="ps4">
                <br>
                &nbsp;&nbsp;본인인증 수단으로 비밀번호 재설정 하기
                <p>
                    <font size="1">
                        실명인증 또는 본인인증된 계정은 아이핀 또는 본인 명의의 휴대폰으로 인증할수 있습니다.<br>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;본인인증 수단을 선택하신 후, 봄숲에 가입된 이메일주소를 입력해주세요.<br>
                    </font size>    
                </p><br>              
                <div class="topline">
                </div>
                <br>
                <div class="id3">
                    <input type="radio" id="#" name="#" value="phone" checked="checked">휴대전화 번호                  
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="radio" id="#" name="#" value="email">E-mail 주소
                    <br><br>
                    
                    <label>E-mail 주소</label> <input type="text" class="id1text" size="10"><br><br>
                    <a href="login"><button class="id2pagebut">다음단계</button></a><br><br>
                    <label id="ps2explanation">휴대전화 번호가 바뀌어도 본인 명의의 휴대폰으로 본인인증을<br>
                    할수 있습니다.</label>
                
                </div>
                <br><div class="topline">
                </div><br>
                &nbsp;&nbsp;&nbsp;<label>고객센터 1544 - 0000</label>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;
                <a href="emailconsulting"><button id="emailquestion">E-mail로 문의하기</button></a><br>
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