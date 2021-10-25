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
    <link href="<%= request.getContextPath() %>/resources/css/mypage-Center.css" rel="stylesheet">
</head>
<body>
    <!-- 메뉴바 -->
	<%@ include file="/WEB-INF/views/common/menubar.jsp" %>
    <%-- cs 카테고리 일단 가져옴 참고해볼 생각 
    <%@ include file="/WEB-INF/views/notice/csCategory.jsp" %>
    --%>
    
    <div class="csarea wrapper">
		<!-- mypage-category 카테고리 -->
		<%@ include file="/WEB-INF/views/member/mypage-category.jsp" %>		
		<div class="content">
            OOO 고객님, 안녕하세요<br>
            <div class="center">
            	<p>멤버십 등급 : 일반<br>
            	      봄숲 멤버십 회원이 되신걸 환영합니다.<br>
            	      구매 금액의 1~3% 추가 마일리지 및 쿠폰 혜택을 받으실 수 있습니다.
            	</p>            	
            </div>
            <br>
            <div class="center">
            	<p>내 문의 사항<br>
            		내 문의 사항 내용을 볼수 있습니다.
            	</p>
            </div>
        </div>
        <br>        
        	
	</div>
    <!-- footer -->
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>