<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://unpkg.com/ress/dist/ress.min.css">
<!-- 외부 스타일 시트 -->
<link href="${ contextPath }/resources/css/kwang/mypage-cancel.css" rel="stylesheet">
<title>취소주문내역</title>
</head>
<body>
	<!-- 메뉴바 -->
	<jsp:include page="/WEB-INF/views/common/menubar.jsp" />
	
	<div class="csarea wrapper">
        <!-- mypage-category 카테고리 추가 -->
		<%@ include file="/WEB-INF/views/mypage/mypage-category.jsp" %>
        
        <div class="content">
        	<header class="review_header">
                <div>취소주문 내역</div>
                <div class="ul_div">
	                <ul class="review_header_ul">
	                	<li>취소 주문 재접수: 해당 주문의&lt;조회&gt;를 누르신후,&lt;주문상품정보&gt;의 "장바구니담기"를 이용해 다시 접수하실수 있습니다.</li>
	                	<li>입금확인 이전의 취소된 주문의 경우, 고객센터로 결제정보를 알려주셔야만 입금 확인 후 환불이 가능합니다.</li>
	                </ul>
                </div>
            </header>
        
            <div class="review_area1">
                <span>취소주문내역</span>                
            </div>

            <div class="review_area2">
                <div class="review_listarea">
                    <ul class="review_listtop">
                        <li class="review_orderdate">주문일</li>
                        <li class="review_orderno">주문번호</li>
                        <li class="review_orderproduct">주문상품</li>
                        <li class="review_cancelinquiry">조회/취소</li>
                        
                    </ul>
                    <!-- 반복문 -->
                    <ul class="review_list" onclick="#">
                        <li class="review_orderdate">2011-11-1</li>
                        <li class="review_orderno">20211101-123456</li>
                        <li class="review_orderproduct title2">Servlet</li>
                        <li class="review_cancelinquiry">취소</li>
                    </ul>                   
                </div>
                
                <div class="wcommu_page">
                    <!-- 페이지 바 영역 => 나중에 작성 -->
                </div>                
            </div>
            <div class="receipt">
                <div>영수증 출력(카드 매출 전표 출력)</div>
                <div class="#">
	                <ul class="receipt_ul">
	                	<li>'영수증'과 '카드전표'버튼을 클릭하세요(단, 발송 이후의 주문만 가능하며, 선물 주문의 영수증은 주문인 이름으로 발급합니다.)</li>
	                	<li>결제된 카드매출전표는 Aladin의 신용카드 결제대행에서 제공하는 화면으로 Aladin에서의 구입내역을 해당 카드로 결제하였음을 확인</li>
	                	<li>하는 자료로 사용하실 수 있습니다.</li>
	                </ul>
                </div>
            </header>
            
            </div>
        </div>	
        
        <!-- 광고  -->
		<jsp:include page="/WEB-INF/views/common/adArea.jsp" />	
	</div>
	
	<!-- footer -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>