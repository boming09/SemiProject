<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://unpkg.com/ress/dist/ress.min.css">
<!-- 외부 스타일 시트 -->
<link href="<%= request.getContextPath() %>/resources/css/order/payment.css" rel="stylesheet">
</head>
<body>
	<%@ include file="/WEB-INF/views/common/menubar.jsp" %>
	
	
	<div class="ct_wrapper content">
		
		<div class="complete">
			<div class="complete_msg">주문이 <span id="green">완료</span> 되었습니다</div>
			
			<div class="complete_block">
				<div class="cp_item mint">
					<div>주문번호</div>
					<div>주문 접수일</div>
					<div>출고 예상일</div>
					<div>수령 예상일</div>
					<div>배송 주소</div>
					<div>연락처</div>
					<div>결제수단</div>
				</div>
			</div>
			<div class="complete_block2">
				<div class="cp_item">
					<div>001-A03</div>
					<div>2021년 11월 1일 월요일 7시 10분</div>
					<div>11월 2일</div>
					<div>11월 3일</div>
					<div>서울 강남구 테헤란로 14길 6 7층 그랑프리 빌딩</div>
					<div>010-1234-5678</div>
					<div>카카오페이</div>
				</div>
			</div>
			
			
			<div><button id="goOrderDetail">주문내역보기</button>
			<button id="gohome">홈으로 가기</button>
			</div>
			
			
		</div>
	</div>
	
	
	
	<!-- footer -->
	<div class="footer2">
	<footer>
	    <div>
	        <p><small>&copy; 2021. Bomsoop All Rights Reserved.</small></p>
	    </div>
	</footer>
	</div>
</body>
</html>