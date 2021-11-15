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
        <div class="emailconsulting">
            <h1 id="emailh1">E mail 상담</h1>
            <div class="topline">
            </div>
            <table class="emailtable">
                <tr>
                    <th>메일주소</th>
                    <td><input type="text" class="emailaddress"><br><br>
	                        현재 사용중인 수신 가능한 이메일 주소를 기재해주십시오.<br>
	                        하단의 문의 내용란에는 기억나실 경우 "회원가입시 등록 이메일주소"도
	                        기재해주십시오.<br><br></td>
                </tr>
                <tr>
                    <th>전화번호</th>
                    <td><input type="text" class="emailaddress"><br><br>
                        주문 문의 등 고객센터에서 문의사항을 정확하게 파악하기 위한 상세 정보를<br>
                        최대한 입력해주시면 감사 하겠습니다</td><br>
                </tr>
                <tr>
                    <th>문의 내용</th>
                    <td><input type="textarea" id="emailarea"></textarea></td><br>
                </tr>
                <tr>
                    <th></th>
                    <td><input type="checkbox"> 수집 및 이용에 동의합니다.(필수)<br>
                        이메일 상담에 제공하시는 메일주소와 전화번호는 고객님의 문의사항을<br>
                        해결하기 위해서만 사용하며, 상담 종료 후 폐기 됩니다.</td>
                </tr>
            </table>
        </div>
        </div>    
        <button class="emailbut" onclick="emailbut()">접수하기</button>
        <script>
            function emailbut() {
                        alert("이메일 문의 접수가 완료되었습니다. 로그인 화면으로 돌아갑니다.");
                        window.location.href = "login";
                    }
        </script>    
    <!-- 
    <footer>
        <div class="wrapper">
            <p><small>&copy; 2021 Bomsoup</small></p>
        </div>
    </footer>
    -->
    <!-- footer -->
	<jsp:include page="/WEB-INF/views/member/footer.jsp" />
</body>
</html>