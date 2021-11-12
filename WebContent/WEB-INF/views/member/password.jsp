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
    <link href="<%= request.getContextPath() %>/resources/css/member/login-style.css" rel="stylesheet">
</head>
<body>
    <!-- 메뉴바 -->
	<%@ include file="/WEB-INF/views/common/menubar.jsp" %>
        <div class="id0">
        <div class="ps1">
            <h1 id="emailh1">비밀번호 재설정</h1>
            <div class="ps2">
                <br>
                <div class="id4div">
                                           봄숲에 등록된 개인정보로 비밀번호 재설정 하기<br><br>
                <p>
                    <font size="2">
                        2가지 인증 방식 중 하나를 선택해 주세요.<br>
                                                가입 정보에 저장된 휴대전화를 현재 사용하고 있지 않으면"E-mail"주소 를 체크합니다.<br>
                        (2가지 인증 방식 모두 가입된 E-mail주소는 입력해야 합니다.)
                    </font size>    
                </p>
                <br>              
                </div>
                <div class="topline">
                </div>
                <br>
                
                <form name="passwordForm" action="<%= request.getContextPath() %>/password2"
				method="post">
                
                <div class="id3">
                    
                    <label class="psid">&nbsp;&nbsp;ID</label> <input type="text" name="userId" class="id1text" size="10"><br><br>
                    <label class="psname">이름</label> <input type="text" name="userName" class="id1text" size="10"><br><br>
                    
                    <label class="psemail">E-mail 주소</label> <input type="text" name="userEmail" class="id1text" size="10"><br><br>
                    <a href="login"><button class="id2pagebut">다음단계</button></a><br>
                </div>
                </form>
                
                <br><div class="topline">
                </div><br>
                <label class="servicec">고객센터 1544 - 0000</label>
                
                <a href="emailconsulting"><button id="emailquestion">E-mail로 문의하기</button></a><br>
               
                
                <label id="idnologin">로그인 필요 없음</label>
            </div>
        </div> 
        </div>   
    <!-- footer -->
	<jsp:include page="/WEB-INF/views/member/footer.jsp" />
</body>
</html>