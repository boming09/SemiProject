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
<link href="<%= request.getContextPath() %>/resources/css/order/order.css" rel="stylesheet">

</head>
<body>
	<!-- 메뉴바 -->
	<%@ include file="/WEB-INF/views/common/menubar.jsp" %>
	
	<div class="ct_wrapper content">
		<div class="">
		<div class="cart_bl">
            <div id="order">주문하기</div>
               
 			<!-- 어디로갈지쓰셈 -->

            <form class="order" action="<%= request.getContextPath() %>/payment"
			method="post">
          
     		  <div class="od_info">주문 상품 정보</div>
			  <div class="od_contain">
 		
			  		<div class="item">상품명</div>
			  		<div class="item">가격</div>
			  		<div class="item">수량</div>
		
			  </div>
			  <div class="od_container">
			   <c:forEach var="cart" items="${ cartOrderList }">
					<div class="item">
						<b>[국내도서] ${cart.book_name }</b>
					</div>
			
					<div class="item">
						<b><fmt:formatNumber value="${cart.sale_price}" type="number"/></b> / <fmt:parseNumber value="${cart.price * 0.05}" integerOnly="true" />원(5%)
					</div>
					<div class="item">
					
						<b> ${cart.amount}</b>
           		
					</div>
			</c:forEach>
					
	<!-- 				<div class="item">
						<b>[국내도서] 어떻게 쓰지 않을 수 있겠어요2</b>
					</div>
					<div class="item">
						<b>27,000원</b> / 1,485원(5%)
					</div>
					<div class="item">
					
						<b>1</b>
						
					</div>
					
					<div class="item">
						<b>[국내도서] 어떻게 쓰지 않을 수 있겠어요3</b>
					</div>
					<div class="item">
						<b>27,000원</b> / 1,485원(5%)
					</div>
					<div class="item">
					
						<b>1</b>
						
					</div>
					
					<div class="item">
						<b>[국내도서] 어떻게 쓰지 않을 수 있겠어요4</b>
					</div>
					<div class="item">
						<b>27,000원</b> / 1,485원(5%)
					</div>
					<div class="item">
						
						<b>1</b>
						
					</div>
					-->
					

		</div>
			            

        	<div class="od_info">배송지 정보 입력</div>

        	<div class="od_tt top_tt">
        		<div class="o_item">
        			<div><b>배송지 선택</b></div>
        		</div>
        		<div class="o_item">
        			<span class="address"><input type="radio" name="rd_address" value="same_info"><b>주문 고객 정보와 동일</b> </span>
        			<span class="address"><input type="radio" name="rd_address" value="new_address"><b>새로운 배송지 입력</b></span>
        		</div>
        	</div>
        	

        	<div class="od_tt">
        		<div class="o_item">
        			<div><b>주문인 *</b></div>
        		</div>
        		<div class="o_item">
        			<span class="address name"><input type="text" name="order_name" value="주문인" class="nm_area"> </span>
        		</div>
        	</div>
        	
    
        	<div class="od_tt">
        		<div class="o_item">
        			<div><b>받으시는 분 *</b></div>
        		</div>
        		<div class="o_item">
        			<span class="address name"><input type="text" name="receive_name" value="받는사람" class="nm_area"> </span>
        		</div>
        	</div>
        	
 
        	<div class="od_tt">
        		<div class="o_item">
        			<div><b>주소 *</b></div>
        		</div>
        		<div class="o_item">
	        		<span class="address name"><input type="text" name="address" class="postcodify_postcode5 nm_area" readonly></span>
					<button type="button" id="postcodify_search_button"><b>검색</b></button>
				</div>
				<div class="o_item">
					<div></div>
				</div>
				<div class="o_item">
					<span class="address name"><input type="text" name="address" class="postcodify_address add_area" readonly></span>
				</div>
				<div class="o_item">
					<div></div>
				</div>
				<div class="o_item">
				<span class="address name"><input type="text" name="address" class="postcodify_details add_area"></span>
        		</div>
        	</div>
        	
        	<div class="od_tt">
        		<div class="o_item">
        			<div><b>휴대전화 *</b></div>
        		</div>
        		<div class="o_item">
	        	<span class="address name"><input type="tel" maxlength="11" name="phone"
											placeholder="(-없이)01012345678" class="nm_area"></span>
        		</div>
        	</div>
        	
        	<div class="od_tt">
        		<div class="o_item">
        			<div><b>전화번호</b></div>
        		</div>
        		<div class="o_item">
	        	<span class="address name"><input type="tel" maxlength="11" name="tel"
											 class="nm_area"> (선택입력)</span>
        		</div>
        	</div>
        	
        	<div class="od_tt btm_line">
        		<div class="o_item">
        			<div><b>어디에 둘까요? *</b></div>
        		</div>
        		<div class="o_item">
	        	<span class="address"><input type="radio" name="del_loca" value="문앞">문앞 </span><!-- 문앞선택시 출입방법 입력 -->
	        	<span class="address"><input type="radio" name="del_loca" value="본인">본인</span>
	        	<span class="address"><input type="radio" name="del_loca" value="경비실">경비실</span>
	        	<span class="address"><input type="radio" name="del_loca" value="택배함">택배함</span>
	        	<span class="address"><input type="radio" name="del_loca" value="직접 입력">직접 입력 </span>
	        	<br><br>
	        	* 문앞 출입 방법
	        	<br><br>
	        	<span class="address"><input type="radio" name="enter_door" value="공동 현관 비밀번호">공동 현관 비밀 번호</span>
	        	<span class="address"><input type="radio" name="enter_door" value="공동 현관 비밀번호">자유 출입 가능</span>
	        	<br><br>
	        	<input type="text" class="big_text">
	        	<br><br>
	        	비밀번호가 정확하지 않으면 공동현관 앞 또는 경비실 앞에 배송될 수 있습니다.
	        	
        		</div>
        	</div>
     		
     		<button id="ct_order_btn">다음 단계 </button>
     		</form>
     		
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

	<!-- "검색" 단추를 누르면 팝업 레이어가 열리도록 설정한다 -->
	<script> $(function() { $("#postcodify_search_button").postcodifyPopUp(); }); </script>


</body>
</html>