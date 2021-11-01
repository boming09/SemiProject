<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>cart</title>
<link rel="stylesheet" href="https://unpkg.com/ress/dist/ress.min.css">
<!-- 외부 스타일 시트 -->
<link href="<%= request.getContextPath() %>/resources/css/payment.css" rel="stylesheet">

</head>
<body>
	<!-- 메뉴바 -->
	<%@ include file="/WEB-INF/views/common/menubar.jsp" %>
	
	<div class="ct_wrapper content">
		<div class="">
		<div class="cart_bl">
            <div id="order">주문하기</div>
               
 			<!-- 어디로갈지쓰셈 -->

            <!--<form class="order" action="<%= request.getContextPath() %>/api"
			method="post">  -->
			<form class="order" action="<%= request.getContextPath() %>/order/complete"
			method="post">
            
       		
     		  <div class="od_info">추가 할인 받기</div>
     		  <div class="tst">
	     		  <div class="discount">
	     		  	<span class="align_ct"><b>쿠폰</b></span><hr><br>
	     		  	<span class="align_ct"><b>보유 쿠폰: <span>0</span>장</b><br></span>
	     		  	<button class="dis_btn">쿠폰 조회/적용</button><br>
	     		  	<span class="align_ct">할인금액:<span>0</span></span>
	     		  </div>
	     		  <div class="discount">
	     		  	<span class="align_ct"><b>적립금</b></span><hr><br>
	     		  	<span class="align_ct"><b>보유액: <span>0</span>원</b><br></span>
	     		  	<span class="align_ct"><a href="#">내역보기</a><br></span>
	     		  	<span class="align_ct"><input type="text" value="0" class="dis">
	     		  	<button class="dis_btn">전액</button><button class="dis_btn">결제</button></span>
	     		  </div>
     		</div>
     	
   
			            
           
        <!--  <hr style="border: outset 10px #f3f3f3;">   -->
        
        	
        	<div class="od_info">결제 내역 확인</div>
        	<hr style="border: solid 1px gray;">
        	<div class="pay_tt">
        		<div class="o_item">
        			<div>주문 상품 금액 정보</div>
        		</div>
        		<div class="o_item">
        			<span class="address">총 2권, 41,400원 </span>
        		</div>
        	</div>
        	
        	<hr style="border: solid 1px gray;">
        	<div class="od_ttt">
        		<div class="o_item">상품 주문 총액</div>
        		<div class="o_item br">41,400원</div>
        		<div class="o_item">쿠폰 할인 금액</div>
        		<div class="o_item ">0원</div>
        		<div class="o_item">배송료</div>
        		<div class="o_item br">0원</div>
        		<div class="o_item">적립금 결제 금액</div>
        		<div class="o_item">0원</div>
        		<div class="o_item">결제 총액</div>
        		<div class="o_item">41,400원</div>
        	</div>
        	
        	
        	<hr style="border: solid 1px gray;">
        	<div class="od_ttt">
        		<div class="o_item">
        			<div><b>남은 결제 금액</b></div>
        		</div>
        		<div class="o_item">
        		
        			<b>41,400원</b>
        		</div>
        	</div>
        	<hr style="border: solid 1px gray;">
        	
        	<div class="od_info">결제 수단 선택</div>
        	<hr style="border: solid 1px gray;">
        	<div class="pay">
        		<div><b>일반 결제</b></div>
        		<div><strong>
	        		<span><input type="radio" name="pay" value="naverpay">네이버페이</span>
	        		<span><input type="radio" name="pay" value="kakaopay">카카오페이</span>
	        		<span><input type="radio" name="pay" value="credit">신용카드</span>
        			</strong>
        		</div>
        	</div>
        	<hr style="border: solid 1px gray;">
        	

			<div class="agree">
				<div class="agree_dt">구매조건을 확인하였으며 결제에 동의합니다.</div>
				<div class="agree_dt2">
					<p>주문 상품의 상품명, 가격, 배송 정보를 확인하였으며, 구매에 동의합니다.</p>
				</div>
			</div>
			
			
     		<button id="ct_order_btn">결제하기 </button>
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