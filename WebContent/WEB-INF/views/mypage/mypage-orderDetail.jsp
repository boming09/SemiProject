<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>cart</title>
<link rel="stylesheet" href="https://unpkg.com/ress/dist/ress.min.css">
<!-- 외부 스타일 시트 -->
<link href="<%= request.getContextPath() %>/resources/css/mypage/mypage-orderDetail.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
</head>
<body>
<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application"/>
	<!-- 메뉴바 -->
	<%@ include file="/WEB-INF/views/common/menubar.jsp" %>
	
	<div class="ct_wrapper content">
		
		<div class="cart_bl">
            <div id="order">주문 내역 </div>
     	    <div class="od_info">주문 상품 정보</div>
     	    
		    <div class="od_contain">
		  		<div class="item1">상품명</div>
		  		<div class="item2">가격</div>
		  		<div class="item3 amount">수량</div>
			</div>
			<div class="od_container">
				<c:forEach var="detail" items="${ myorder.myDetail }">
					<div class="detail_list">
						<div class="item1 titleArea">
							<div class="detail_img"><img src="${ contextPath }${ detail.book_img }"></div>
							<div class="title">
								<div><b>[${ detail.category_name }] ${ detail.book_name }</b></div>
								<div class="d_author">저자 : ${ detail.author }</div>
								<div class="d_publisher">출판사 : ${ detail.publisher }</div>
							</div>
						</div>
						<div class="item2">
							<b class="d_price"><fmt:formatNumber value="${ detail.sale_price }" type="number"/> 원</b> / <fmt:parseNumber value="${ detail.price * 0.05 }" integerOnly="true" />원(5%)
						</div>
						<div class="item3">
							<b>${ detail.amount }</b>
						</div>
					</div>
				</c:forEach>
				<!-- 총 금액 영역 -->
				<div>
					<span class="sumArea">
						<label>총 결제 금액 :</label> 
						<c:set var="sum"/>
						<c:forEach var="price" items="${ myorder.myDetail }">
							<c:set var="sum" value="${ sum + price.sale_price * price.amount }"/>	
						</c:forEach>
						<fmt:formatNumber value="${ sum }" type="number"/> 원						
					</span>
				</div>
			</div>
        	
 
 			
        	<div class="od_tt top_tt">
        		<div class="o_item text">
        			<div><b>주문인 *</b></div>
        		</div>
        		<div class="o_item">
        			<span class="address name"><input type="text" value="${ loginUser.userName }" class="nm_area" readonly></span>
        		</div>
        	</div>
        	
    
        	<div class="od_tt">
        		<div class="o_item text">
        			<div><b>받으시는 분 *</b></div>
        		</div>
        		<div class="o_item">
        			<span class="address name"><input type="text" id="remove" value="${ loginUser.userName }" class="nm_area" readonly></span>
        		</div>
        	</div>
        	
        	<%
			 	String[] address;
			 	if(loginUser.getUserAddress() != null) {
					address = loginUser.getUserAddress().split("\\|");				 		
			 	} else {
			 		address = new String[] {"", "", ""}; 
			 	}
			 %>
 
        	<div class="od_tt">
        		<div class="o_item text">
        			<div><b>주소 *</b></div>
        		</div>
        		<div class="o_item addressArea">
	        		<span class="address name"><input type="text" value="<%= address[0] %>" readonly></span>
					<span class="address name"><input type="text" value="<%= address[1] %>" readonly></span>
					<span class="address name"><input type="text" value="<%= address[2] %>" readonly></span>
				</div>
				
        	</div>
        	
        	<div class="od_tt">
        		<div class="o_item text">
        			<div><b>휴대전화 *</b></div>
        		</div>
        		<div class="o_item">
	        		<span class="address name">
	        			<input type="text" value="${loginUser.userPhone}" class="nm_area" readonly>
					</span>
        		</div>
        	</div>
        	
        	<div class="od_tt btm_line">
        		<div class="o_item text">
        			<div><b>전화번호</b></div>
        		</div>
        		<div class="o_item">
	        		<span class="address name">
	        			<input type="tel" maxlength="11" name="tel" class="nm_area" readonly>
	        		</span>
        		</div>
        	</div>
        	
	   		<div class="btnArea">
	    		<button id="ct_order_btn" onclick="location.href='${ contextPath }/myorder'">목록으로</button>
	   			<c:if test="${ myorder.delivery == '상품준비중' }">
	   				<button id="ct_order_btn" onclick="location.href='#'">주문 취소</button>
	   			</c:if>
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

	<!-- jQuery와 Postcodify를 로딩한다 -->
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
	<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
	<!-- 여러 버전의 제이쿼리 넣지 말아라 3버전 넣고싶으면 첫번째꺼 지우셈 -->

</body>
</html>