<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        name : '결제',
        amount : '1',
        buyer_email : '구매자 이메일',
        buyer_name : '구매자 이름',
        buyer_tel : '구매자 번호',
        buyer_addr : '구매자 주소',
        buyer_postcode : '구매자 주소',
        m_redirect_url : 'redirect url'
    }, function(rsp) {
        if ( rsp.success ) {
            var msg = '결제가 완료되었습니다.';
            location.href='<%= request.getContextPath() %>/order/complete';
        } else {
            var msg = '결제에 실패하였습니다.';
            rsp.error_msg;
            location.href='<%= request.getContextPath() %>/payment';
            
        }
    });


    </script>
</body>
</html>