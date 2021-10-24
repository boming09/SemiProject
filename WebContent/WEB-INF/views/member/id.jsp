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
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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