<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="order.model.vo.Cart"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>pay</title>
<link rel="stylesheet" href="https://unpkg.com/ress/dist/ress.min.css">
<!-- 외부 스타일 시트 -->
<link href="<%= request.getContextPath() %>/resources/css/order/payment.css" rel="stylesheet">
<!-- <script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script> -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
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
		
  			<script>
					function coupon(){
						window.open("couponPopup.jsp", "coupon", "width=640, height=400")
					}
  			
  			</script>
  			
       		
     		  <div class="od_info">추가 할인 받기</div>
     		  <div class="tst">
	     		  <div class="discount">
	     		  	<span class="align_ct"><b>쿠폰</b></span><hr><br>
	     		  	<span class="align_ct"><b>보유 쿠폰</b><br></span>
	     		  	<!-- <button class="dis_btn" id="couponBtn" onclick="openChild();">쿠폰 조회/적용</button><br>-->
	     		  	<button class="dis_btn" id="couponBtn" onclick="openPopup('<%= request.getContextPath()%>/coupon', 'coupon', 480, 210);">쿠폰 조회/적용</button><br>
	     		  	<span class="align_ct bold"> 할인액:<span><input id="bInput">원</span></span>
	     		  </div>
	     		<!--   <div class="discount white">
	     		  	<span class="align_ct"><b>적립금</b></span><hr><br>
	     		  	<span class="align_ct"><b>보유액: <span>0</span>원</b><br></span>
	     		  	<span class="align_ct"><a href="#" class="bold">내역보기</a><br></span>
	     		  	<span class="align_ct"><input type="text" value="0" class="dis">
	     		  	<button class="dis_btn" id="infullBtn">전액</button><button class="dis_btn" id="pointPayBtn">결제</button></span>
	     		  </div> -->
     		</div>
   

        	
        	<!-- <form name="order" class="order" action="<%= request.getContextPath() %>/order/paying" method="post">-->
        	<form name="order" class="order" method="post">
        	<div class="od_info">결제 내역 확인</div>
        	<div class="pay_tt">
        		<div class="o_item">
        			<div>주문 상품 금액 정보</div>
        		</div>
        		<div class="o_item">
        			<span class="address">총 ${odr.amount}권,
        			<!--<c:forEach var="cart" items="${ amounts }">-->
        			
        			<!--</c:forEach>-->
        			 <fmt:formatNumber value="${ odr.sale_price }" type="number"/>원 </span>
        		</div>
        	</div>
        	
        	<div class="od_ttt">
        		<div class="o_item">상품 주문 총액</div>
        		<div class="o_item br"><fmt:formatNumber value="${ odr.sale_price }" type="number"/>원</div>
        		<div class="o_item">쿠폰 할인 금액</div>
        		<div class="o_item "><input id="dInput">원</div>
        		<div class="o_item">배송료</div>
        		<div class="o_item br">0원</div>
        		<div class="o_item"></div>
        		<div class="o_item"></div>
        		<div class="o_item">결제 총액</div>
        		<div class="o_item">

        		<fmt:formatNumber value="${ odr.sale_price }" type="number"/>원</div> <!-- 할인 있으면 차감해 -->
        	</div>

        	<!-- <span id="valueA">1</span>
        	<span id="valueB">2</span>
        	<span id="valueC">3</span> -->
        	
        	<div class="od_ttt fs">
        		<div class="o_item">
        			<div><b>남은 결제 금액</b></div>
        		</div>
        		<div class="o_item">
        		<!--c:when 해가지고 뭔가 체크 됐을때 빼기할가  cpn 세션에 저장됨-->
        		<b><span id="test11">${odr.sale_price}</span>원</b>

        		</div>
        	</div>
        	
        	<div class="od_info">결제 수단 선택</div>

        	<div class="pay">
        		<div><b>일반 결제</b></div>
        		<div><strong>
	        		<span><input type="radio" name="pay" id="kakao" value="kakaopay">카카오페이</span>
	        		<span><input type="radio" name="pay" id="credit" value="credit">신용카드</span>
        			</strong>
        		</div>
        	</div>
        	

			<div class="agree">
				<div class="agree_dt">구매조건을 확인하였으며 결제에 동의합니다.</div>
				<div class="agree_dt2">
					<p>주문 상품의 상품명, 가격, 배송 정보를 확인하였으며, 구매에 동의합니다.<input type="checkbox" id="agreebox" name="agree" value="agree" required></p>
				</div>
			</div>
			
			<input type="hidden" id="aInput" name="coupon_no">
     		<button id="ct_order_btn" type="submit">결제하기 </button>
     		</form>
     		<script>
     			$("#ct_order_btn").click(function(){
     				 if($("#agreebox").is(":checked") == false){ 
      					alert("구매에 동의하셔야 결제가 진행됩니다.");
      					return;
     				 } /*else if($("#agreebox").is(":checked") == true){
     					if($("#kakao").is(":checked") == true){
         					location.href="${contextPath}/order/paying";
         					order.submit();
         				 } else if($("#credit").is(":checked") == true) {
         					location.href="${contextPath}/order/paying2";
         					order.submit();
         				 } 
     				 }*/
     				
     			});
     			
     			$("#ct_order_btn").click(function(){
     				 if($("#kakao").is(":checked") == true){
     					document.forms.order.action="${ contextPath }/order/paying";
     			    	document.forms.order.submit();
     				 } else if($("#credit").is(":checked") == true) {
     					document.forms.order.action="${ contextPath }/order/paying2";
     			    	document.forms.order.submit();
     				 } else if($("#kakao").is(":checked") == false){
     					 alert("결제 수단을 선택하세요");
     					 return;
     				 }
     			});
     			
     			
     	     /*   var openWin;
     	       
     	        function openChild(){
     	            // window.name = "부모창 이름"; 
     	            window.name = "parentForm";
     	            // window.open("open할 window", "자식창 이름", "팝업창 옵션");
     	            openWin = window.open("coupon",
     	                    "childForm", "width=640, height=350, resizable = no, scrollbars = no");    
     	        }
     	        
     	        function setChildText(){
     	            openWin.document.getElementById("checkCoupon").value = document.getElementById("aInput").value;
     	           openWin.document.getElementById("couponDis").value = document.getElementById("bInput").value;
     	          openWin.document.getElementById("couponNo").value = document.getElementById("dInput").value;
     	        }*/

     				 
     	      // 쿠폰할인
     	       	function couponDis(){
     	       	  var dis = document.getElementById("aInput").value;
     	       	  var to = ${ odr.sale_price };
     	       	var todi = to * dis / 100;
     	       document.getElementById("cInput").value = todi;
     	     
     	       	  
     	      }
     	      
     	      function openPopup(url, title, width, height) {
     	    	  
     	    	  var left = (document.body.clientWidth/2)-(width/2);
     	    	  left += window.screenLeft; //듀얼 모니터
				  var top = (screen.availHeight/2) - (height/2);
     	    	  
     	    	  var options = "width="+width+",height="+height+",left="+left+",top="+top;
     	    	  
     	    	  window.open(url, title, options);
     	    	  
     	      }
     	      
     	      
     			
     		</script>
 
     		
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