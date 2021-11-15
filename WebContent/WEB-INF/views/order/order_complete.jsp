<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*,order.model.vo.Order" %>
<%
	String orderEmail = (String)session.getAttribute("orderEmail");
	String postCode = (String)session.getAttribute("postCode");
	String orderName = (String)session.getAttribute("orderName");
	String orderAddr = (String)session.getAttribute("orderAddr");
	String orderPhone = (String)session.getAttribute("orderPhone");
	String pay = (String)session.getAttribute("pay");
	
	Order order = (Order)session.getAttribute("order"); //엥?
	
%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order complete</title>
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
					<div>001-A03${upOrder.order_no}</div><!-- 인서트 한거 다시 조회해서 가져오기-->
					<div>${upOrder.order_date}<!--2021년 11월 1일 월요일 7시 10분--></div><!-- 날짜포맷 -->
					<div>${upOrder.rel_date}</div>
					<div>${upOrder.receipte_date}</div>
					<div>${upOrder.address}<!--서울 강남구 테헤란로 14길 6 7층 그랑프리 빌딩--></div>
					<div>${orderPhone}</div>
					<div><!-- 카카오페이 ${upOrder.payment}-->
					<c:choose>
						<c:when test="${upOrder.payment eq 'kakaopay'}">카카오페이</c:when>
						<c:when test="${upOrder.payment eq 'credit'}">이니스페이</c:when>
					</c:choose>
					
					</div>
				</div>
			</div>
			
			<div><button id="goOrderDetail" onclick="location.href='${contextPath}/myorder'">주문내역보기</button>
			<button id="gohome" onclick="location.href='${contextPath}/main'">홈으로 가기</button>
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