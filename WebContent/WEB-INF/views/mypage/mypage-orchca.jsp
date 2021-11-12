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
	            <p>배송상태 : 상품준비중(주문취소 가능) / 배송중, 배송완료(주문취소 불가)</p>          
        	</div>
        	<div>
	            <ul class="order">
	            	<li class="date">주문일</li>
	            	<li class="orderNo">주문번호</li>
	            	<li class="orderInfo">주문내역</li>
	            	<li class="delivery">배송상태</li>
	            	<li class="deliveryNum">운송장번호</li>
	            	<!-- <div class="change">주문취소</div> -->
	            </ul>
	            <c:forEach var="order" items="${ orderList }">
		            <ul class="orderlist" onclick="myDetail(${ order.order_no })">
		            	<li class="date2">${ order.order_date }</li>
		            	<li class="orderNo2">${ order.order_no }</li>
		            	<li class="orderInfo2">총  ${ order.detailCount }종류의 도서 구매</li>
		            	<c:choose>
			            	<c:when test="${ order.delivery == '상품준비중' }">
			            		<li class="delivery2" style="color:rgb(73, 125, 78);">${ order.delivery }</li>
			            	</c:when>
			            	<c:otherwise>
			            		<li class="delivery2" style="color:#D25832;;">${ order.delivery }</li>
			            	</c:otherwise>
		            	</c:choose>
		            	<li class="deliveryNum2">${ order.delivery_number }</li>
		            </ul>
	            </c:forEach>
        	</div>
       
    		 <div class="pagingarea">
                    <ul class="wcheck_paging">
		            	<!-- 앞으로 이동하는 버튼(<) -->
		            	<li>
						<c:choose>
							<c:when test="${ pi.page > 1 }">
								<a href="${ contextPath }/w-check?page=${ pi.page - 1}${ searchParam }">&lt;</a>
							</c:when>
							<c:otherwise>
								<a href="#">&lt;</a>
							</c:otherwise>
						</c:choose>
						</li>
		            
		            	<!-- 최대5개의 페이지 바 -->
						<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
							<li>
								<c:choose>
									<c:when test="${ p eq pi.page }">
										<a href="#" class="current_page">${ p }</a>
									</c:when>
									<c:otherwise>
										<a href="${ contextPath }/w-check?page=${ p }${ searchParam }">${ p }</a>
									</c:otherwise>
								</c:choose>
							</li>
						</c:forEach>
		            	
		            	<!-- 다음 페이지로(>) -->                     
						<li>
							<c:choose>
								<c:when test="${ pi.page < pi.maxPage }">
									<a href="${ contextPath }/w-check?page=${ pi.page + 1}${ searchParam }">&gt;</a>
								</c:when>
								<c:otherwise>
									<a href="#">&gt;</a>
								</c:otherwise>
							</c:choose>
						</li>
	           		</ul>
               </div>
       
        </div>        
        <!-- 광고  -->
		<%@ include file="/WEB-INF/views/common/adArea.jsp" %>
	</div>	
    <!-- footer -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	
	<script>
		function myDetail(order_no) {
			location.href = "${ contextPath }/myorder/detail?order_no=" + order_no;
		}
	</script>
	
</body>
</html>