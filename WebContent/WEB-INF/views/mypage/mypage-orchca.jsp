<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
    <link href="<%= request.getContextPath() %>/resources/css/mypage/mypage-orchca.css" rel="stylesheet">
</head>
<body>
<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application"/>
    <!-- 메뉴바 -->
	<%@ include file="/WEB-INF/views/common/menubar.jsp" %>
        
    <div class="csarea wrapper">
		<!-- mypage-category 카테고리 추가 -->
		<%@ include file="/WEB-INF/views/mypage/mypage-category.jsp" %>		
		<!-- 헤더 div -->
		<div class="content">            
           	<header class="orderheader"><h3>주문조회 / 취소</h3></header>
        	<div class="hArea">
	            <h4>주문 리스트</h4>
	            <h5>배송상태 : 상품준비중(주문취소 가능) / 배송중, 배송완료(주문취소 불가)</h5>          
        	</div>
            <div class="order">
            	<div class="date">주문일</div>
            	<div class="orderNo">주문번호</div>
            	<div class="orderInfo">주문내역</div>
            	<div class="delivery">배송상태</div>
            	<div class="deliveryNum">운송장번호</div>
            	<!-- <div class="change">주문취소</div> -->
            </div>
            <c:forEach var="order" items="${ orderList }">
	            <div class="order">
	            	<div class="date2">${ order.order_date }</div>
	            	<div class="orderNo2">${ order.order_no }</div>
	            	<div class="orderInfo2">대표도서 외 ${ order.detailCount }</div>
	            	<div class="delivery2">${ order.delivery }</div>
	            	<div class="deliveryNum2">${ order.delivery_number }</div>
	            	<!-- <div class="change2">주문취소</div> -->
	            </div>
            </c:forEach>
       
    
       
        </div>        
        <!-- 광고  -->
		<%@ include file="/WEB-INF/views/common/adArea.jsp" %>
	</div>	
    <!-- footer -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>