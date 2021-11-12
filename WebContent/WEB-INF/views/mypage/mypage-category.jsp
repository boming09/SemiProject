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
    <link href="<%= request.getContextPath() %>/resources/css/mypage/mypage-style.css" rel="stylesheet">
</head>
<body>
	<!-- mypage-category 추가 -->
    <aside class="category">
        <div class="ca-head"><a href="<%= request.getContextPath() %>/mypage">마이페이지</a></div>
        <div class="area1"><a class="ca-top">개인정보 수정</a>
            <ul class="ca-list">
                <li><a href="<%= request.getContextPath() %>/memberinformation">회원정보 수정</a></li>
                <li><a href="<%= request.getContextPath() %>/memberout">회원탈퇴</a></li>
                <li><a href="<%= request.getContextPath() %>/mypagemyreview">마이리뷰</a></li>
                <li><a href="<%= request.getContextPath() %>/mypagemycoupon">내쿠폰</a></li>
            </ul>
        </div>
        <div class="area2"><a class="ca-top">주문내역</a>
            <ul class="ca-list">
                <li><a href="<%= request.getContextPath() %>/myorder">주문 조회</a></li>
                <li><a href="<%= request.getContextPath() %>/myorder/change">취소/반품/교환 내역</a></li>
            </ul>
        </div>
        <div class="area3"><a class="ca-top">소통게시판 바로가기</a>
            <ul class="ca-list">
                <li><a href="<%= request.getContextPath() %>/commu/w-info">작가 리스트</a></li>
                <li><a href="<%= request.getContextPath() %>/commu">작가 소통 게시판</a></li>
            </ul>
        </div>
        <div class="area4"><a class="ca-top">고객센터 바로가기</a>
	        <ul class="ca-list">
	            <li><a href="<%= request.getContextPath() %>/cs">FAQ</a></li>
	            <li><a href="<%= request.getContextPath() %>/one/insert">1:1 문의하기</a></li>
	        </ul>
	    </div>        
    	<div class="cs_ad">
			<img id="csad1" src="${ contextPath }/resources/images/ad8.png">
			<img id="csad2" src="${ contextPath }/resources/images/ad9.png">
		</div>  
    </aside>  
</body>
</html>