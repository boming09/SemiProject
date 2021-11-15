<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>order</title>
<link rel="stylesheet" href="https://unpkg.com/ress/dist/ress.min.css">
<!-- 외부 스타일 시트 -->
<link href="<%= request.getContextPath() %>/resources/css/order/order.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
</head>
<body>
	<!-- 메뉴바 -->
	<%@ include file="/WEB-INF/views/common/menubar.jsp" %>
	
	<div class="ct_wrapper content">
		<div id="orderForm">
		<div class="cart_bl">
            <div id="order">주문하기 </div>
               
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
					
						<b>${cart.amount}</b>
           		
					</div>
					
			</c:forEach>
					
					

		</div>
			 <script>
				 function clearInput(){
					let allInputs = $(":input");
					 /* 텍스트박스 지우는 부분 */
					if (document.getElementsByName("rd_address")[1].checked == true) {
					// var el = document.getElementsByName('rd_address');
	
					// for(var i=0; i<el.length; i++){
					 // allInputs.value = null;
					// }
					
					  $(orderForm).find('input[type=text]').each(function(){ $(this).val(''); });
					  // 텍스트 박스까지 지워버림
					  //	$(orderForm).find('input[type=text]').each(function(){ $(this).detach(); });
				  }
				}
				
				function makeChk(){
					//$("#textP1").text("* 문앞 출입 방법");
					$("#needPass").show();
					$("#free").show();
				}
				
				function hideChk(){
					//$("#textP1").hide();
					$("#needPass").hide();
					$("#free").hide();
					document.getElementById("bigBox").setAttribute("type", "hidden");
					$("#textP2").hide();
				}
				
				function makeaBox(){
					document.getElementById("bigBox").setAttribute("type", "text");
				//	$("#textP2").text("비밀번호가 정확하지 않으면 공동현관 앞 또는 경비실 앞에 배송될 수 있습니다.")
				
				} 
	
				function hideaBox(){
					document.getElementById("bigBox").setAttribute("type", "hidden");
					$("#textP2").hide();
				} 

				
				
			 </script> 
			  
			           

        	<div class="od_info">배송지 정보 입력</div>

        	<div class="od_tt top_tt">
        		<div class="o_item">
        			<div><b>배송지 선택</b></div>
        		</div>
        		<div class="o_item">
        			<span class="address"><input type="radio" name="rd_address" value="same_info" checked><b>주문 고객 정보와 동일</b> </span>
        			<span class="address"><input type="radio" name="rd_address" value="new_address" onclick="clearInput()"><b>새로운 배송지 입력</b></span>
        		</div>
        	</div>
        	
        		<%
				 	String[] address;
				 	if(loginUser.getUserAddress() != null) {
						address = loginUser.getUserAddress().split("\\|");				 		
				 	} else {
				 		address = new String[] {"", "", ""}; //주소값 없는경우 null 표시 방지 
				 		//address1,2,3으로 나눠도 갠찮니?
				 	}
				 %>
        	
        		<%
        		  String email;
        		  if(loginUser.getUserEmail() != null) {
        				email = loginUser.getUserEmail();
        		  } else {
        			  email = "email";
        		  }
        		%>
        		<input type="hidden" name="email" value="email">

        	<div class="od_tt">
        		<div class="o_item">
        			<div><b>주문인 *</b></div>
        		</div>
        		<div class="o_item">
        			<span class="address name"><input type="text" name="order_name" value="${loginUser.userName}" class="nm_area" required> </span>
        		</div>
        	</div>
        	
    
        	<div class="od_tt">
        		<div class="o_item">
        			<div><b>받으시는 분 *</b></div>
        		</div>
        		<div class="o_item">
        			<span class="address name"><input type="text" id="remove" name="receive_name" value="${loginUser.userName}" class="nm_area" required> </span>
        		</div>
        	</div>
        	
 
        	<div class="od_tt">
        		<div class="o_item">
        			<div><b>주소 *</b></div>
        		</div>
        		<div class="o_item">
	        		<span class="address name"><input type="text" name="address1" class="postcodify_postcode5 nm_area" value="<%= address[0] %>" readonly></span>
					<button type="button" id="postcodify_search_button"><b>검색</b></button>
				</div>
				<div class="o_item">
					<div></div>
				</div>
				<div class="o_item">
					<span class="address name"><input type="text" name="address2" class="postcodify_address add_area" value="<%= address[1] %>" readonly></span>
				</div>
				<div class="o_item">
					<div></div>
				</div>
				<div class="o_item">
				<span class="address name"><input type="text" name="address3" class="postcodify_details add_area" value="<%= address[2] %>" required></span>
        		</div>
        	</div>
        	
        	<div class="od_tt">
        		<div class="o_item">
        			<div><b>휴대전화 *</b></div>
        		</div>
        		<div class="o_item">
	        	<span class="address name"><input type="text" maxlength="11" name="phone" value="${loginUser.userPhone} "
											placeholder="(-없이)01012345678" class="nm_area" required></span>
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
	        	<span class="address"><input type="radio" name="del_loca" value="문앞" onclick="makeChk()" checked>문앞 </span><!-- 문앞선택시 출입방법 입력 -->
	        	<span class="address"><input type="radio" name="del_loca" value="본인" onclick="hideChk()">본인</span>
	        	<span class="address"><input type="radio" name="del_loca" value="경비실" onclick="hideChk()">경비실</span>
	        	<span class="address"><input type="radio" name="del_loca" value="택배함" onclick="hideChk()">택배함</span>
	        	<span class="address"><input type="radio" name="del_loca" value="직접 입력" onclick="makeaBox()">직접 입력 </span>
	        	<br><br>
	        	
	        	<span class="address" id="needPass"><input type="radio" name="enter_door" value="공동 현관 비밀번호" onclick="makeaBox();" checked>공동 현관 비밀 번호</span>
	        	<span class="address" id="free"><input type="radio" name="enter_door" value="자유 출입 가능" onclick="hideaBox();">자유 출입 가능</span>
	        	
	        	<br><br>
	        	<input type="text" id="bigBox" name="enter_pass" class="big_text">
	        	<br><br>
	        	<p id="textP2">비밀번호가 정확하지 않으면 공동현관 앞 또는 경비실 앞에 배송될 수 있습니다.</p>
	        	
        		</div>
        	</div>
     		
     		<button id="ct_order_btn">다음 단계 </button>
     		<!--  <input type="hidden" value="${ cartOrderList }">-->
     		
     	  	 <c:forEach var="cart" items="${ cartOrderList }">
     			 <input type="hidden" name="book_id" value="${cart.book_id}">
				 <input type="hidden" name="sale_price" value="${cart.sale_price}">
				 <input type="hidden" name="amount" value="${cart.amount}">	
				 <input type="hidden" name="cart_no" value="${cart.cart_no}">		
			</c:forEach> 
			<!-- "" 이 사이에 절대 공백 넣지 말것 -->
		
     		
     		  		<!-- 총 상품 가격 계산 -->
	         <!--    	<c:set var="sum" value="0"/>
     				<c:forEach var="cart" items="${ cartOrderList }">
     					<c:set var="sum" value="${sum + cart.sale_price * cart.amount}"/>
     				</c:forEach>
     					<input type="hidden" name="sum" value=${ sum }>   -->
     				
     				<!-- 총 상품수 계산 -->
     		<!--  		<c:set var="amounts" value="0"/>
     				<c:forEach var="cart" items="${ cartOrderList }">
     					<c:set var="amounts" value="${ amounts + cart.amount }"/>
     				</c:forEach>
     					<input type="hidden" name="amounts" value=${ amounts }>   -->
     		
     		
     		
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