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
        <div class="ps3">
           <h1 id="emailh1">비밀번호 찾기</h1>
            <div class="ps4">
                <br>
                	<div class="id4div">
                 	본인인증 수단으로 비밀번호 찾기<br><br>
                    <p>
                    <font size="2">
		                        가입된 정보로 비밀번호를 찾을수 있습니다.<br>
		            &nbsp;봄숲에 가입된 비밀번호 입니다.<br>
                    </font size>    
                	</p>
                	</div>
                <br>              
                <div class="topline">
                </div>
                <br>
                <div class="id3"> 
                    <label>비밀번호  : </label>${ member.userPwd }
                    <!-- <input type="text" class="id1text" size="10" value="${ member.userEmail }"> --><br><br>
                    <a href="login"><button class="id2pagebut">로그인 화면으로</button></a><br><br>
                    <label id="ps2explanation">가입시 등록한 비밀번호로 로그인해 주세요.</label>
                
                </div>
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