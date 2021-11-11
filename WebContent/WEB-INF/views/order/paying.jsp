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

	List<OrderDetail> orderDt = (ArrayList<OrderDetail>)session.getAttribute("orderDt");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script>
  

    var IMP = window.IMP; 
    IMP.init('imp38325940'); 
    IMP.request_pay({
    	pg : "kakaopay", 
        pay_method : 'card',
        merchant_uid : 'merchant_' + new Date().getTime(),
        name : '봄숲 결제',
        amount : '1', //여기가 가격임
        buyer_email : '${orderEmail}', 
        buyer_name : '${orderName}',
        buyer_tel : '${orderPhone}',
        buyer_addr : '${orderAddr}',
        buyer_postcode : '${postCode}',
        m_redirect_url : 'redirect url'
    }, function(rsp) {
        if ( rsp.success ) {
            var msg = '결제가 완료되었습니다.';
            location.href='<%= request.getContextPath() %>/order/complete';
            buyerInfo.submit();
        } else {
            var msg = '결제에 실패하였습니다.';
            rsp.error_msg;
            location.href='<%= request.getContextPath() %>/payment';
            
        }
    });


    </script>
    <form name="buyerInfo" action="${contextPath}/order/complete">
    <input type="hidden" name="address" value="${orderAddr}">
 	<input type="hidden" name="phone" value="${orderPhone}">
 	<!--<c:forEach var="orderDt" items="${ OrderDt }">
 	<input type="hidden" name="orderbookId" value="${orderDt.bookId}">
 	<input type="hidden" name="orderDt" value="${orderDt.amounts}">
 	<input type="hidden" name="orderDt" value="${orderDt.amounts},${orderDt.bookId}">
 	</c:forEach>-->
    </form>
</body>
</html>