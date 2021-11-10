<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터_FAQ</title>
<link rel="stylesheet" href="https://unpkg.com/ress/dist/ress.min.css">
<!-- 외부 스타일 시트 -->
<link href="${ contextPath }/resources/css/notice/csPage.css" rel="stylesheet">
</head>
<body>
	<!-- 고객센터 클릭시 첫 화면 -->
	<!-- 메뉴바 -->
	<jsp:include page="/WEB-INF/views/common/menubar.jsp" />
	
	<div class="csarea wrapper">
		<!-- cs 카테고리 -->
		<jsp:include page="/WEB-INF/views/notice/csCategory.jsp" />
		
		<div class="content">
            <header class="csctheader">
                <span>FAQ</span>
                <span>분야별 FAQ 빠른 찾기를 이용해보세요.</span>
            </header>
            <div class="ctarea">
                <div class="ct-area1">
                    <div class="ct-top">주문/결제</div>
                    <ul class="ct-list">
                        <li><a href="${ contextPath }/faqA?atype=1&btype=2">주문/주문확인</a></li>
                        <li><a href="${ contextPath }/faqA?atype=1&btype=3">주문 변경</a></li>
                        <li><a href="${ contextPath }/faqA?atype=1&btype=4">결제 정보</a></li>
                        <li><a href="${ contextPath }/faqA?atype=1&btype=5">세금계산서/영수증</a></li>
                    </ul>
                </div>
                <div class="ct-area2">
                    <div class="ct-top">취소/교환/반품</div>
                    <ul class="ct-list">
                        <li><a href="${ contextPath }/faqB?atype=6&btype=7">취소/취소환불</a></li>
                        <li><a href="${ contextPath }/faqB?atype=6&btype=8">교환</a></li>
                        <li><a href="${ contextPath }/faqB?atype=6&btype=9">반품/반품환불</a></li>
                    </ul>
                </div>
                <div class="ct-area3">
                    <div class="ct-top">배송</div>
                    <ul class="ct-list">
                        <li><a href="${ contextPath }/faqC?atype=10&btype=11">배송정보</a></li>
                        <li><a href="${ contextPath }/faqC?atype=10&btype=12">해외배송</a></li>
                        <li><a href="${ contextPath }/faqC?atype=10&btype=13">배송비</a></li>
                    </ul>
                </div>
                <div class="ct-area4">
                    <div class="ct-top">회원관리</div>
                    <ul class="ct-list">
                        <li><a href="${ contextPath }/faqD?atype=14&btype=15">회원가입/탈퇴</a></li>
                        <li><a href="${ contextPath }/faqD?atype=14&btype=16">회원정보 확인/변경</a></li>
                        <li><a href="${ contextPath }/faqD?atype=14&btype=17">작가회원 인증</a></li>
                    </ul>
                </div>
            </div>
        </div>
        <!-- 광고  -->
		<jsp:include page="/WEB-INF/views/common/adArea.jsp" />
	</div>
	
	<!-- footer -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />

</body>
</html>