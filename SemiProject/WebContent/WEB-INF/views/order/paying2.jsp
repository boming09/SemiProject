<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*,order.model.vo.OrderDetail" %>
<%
	String orderEmail = (String)session.getAttribute("orderEmail");
	String postCode = (String)session.getAttribute("postCode");
	String orderName = (String)session.getAttribute("orderName");
	String orderAddr = (String)session.getAttribute("orderAddr");
	String orderPhone = (String)session.getAttribute("orderPhone");
	//String pay = (String)session.getAttribute("pay");
	
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<script>
IMP.init('imp38325940');

IMP.request_pay({
    pg : 'html5_inicis',
    pay_method : 'card',
    merchant_uid : 'merchant_' + new Date().getTime(),
    name : '주문명:결제테스트',
    amount : '100', //판매 가격
    buyer_email : '${orderEmail}',
    buyer_name : '${orderName}',
    buyer_tel : '${orderPhone}',
    buyer_addr : '${orderAddr}',
    buyer_postcode : '${postCode}',
}, function(rsp) {
    if ( rsp.success ) {
        var msg = '결제가 완료되었습니다.';
        msg += '고유ID : ' + rsp.imp_uid;
        msg += '상점 거래ID : ' + rsp.merchant_uid;
        msg += '결제 금액 : ' + rsp.paid_amount;
        msg += '카드 승인번호 : ' + rsp.apply_num;
        
        location.href='<%= request.getContextPath() %>/order/complete';
        buyerInfo.submit();
    } else {
        var msg = '결제에 실패하였습니다.';
        msg += '에러내용 : ' + rsp.error_msg;
        location.href='<%= request.getContextPath() %>/payment';
    }
    alert(msg);
});


    </script>
    <form name="buyerInfo" action="${contextPath}/order/complete" method="post">
    <input type="hidden" name="address" value="${orderAddr}">
 	<input type="hidden" name="phone" value="${orderPhone}">
 	<input type="hidden" name="pay" value="${pay}">
 	<!--<c:forEach var="orderDt" items="${ OrderDt }">
 	<input type="hidden" name="orderbookId" value="${orderDt.bookId}">
 	<input type="hidden" name="orderDt" value="${orderDt.amounts}">
 	<input type="hidden" name="orderDt" value="${orderDt.amounts},${orderDt.bookId}">
 	</c:forEach>-->
    </form>
</body>
</html>