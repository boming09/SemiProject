<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>cart</title>
<link rel="stylesheet" href="https://unpkg.com/ress/dist/ress.min.css">
<!-- 외부 스타일 시트 -->
<link href="<%= request.getContextPath() %>/resources/css/cart.css" rel="stylesheet">

</head>
<body>
	<!-- 메뉴바 -->
	<%@ include file="/WEB-INF/views/common/menubar.jsp" %>
	
	<div class="ct_wrapper content">
		<div class="">
		<div class="cart_bl">
            <div id="cart">장바구니</div>
               
 			<!-- 어디로갈지쓰셈 -->

            <form class="cart" action="<%= request.getContextPath() %>/order"
			method="post">
            
       		 <label class="hidden"> cart_select</label>
       		 
       		 <button id="delete_btn">선택상품삭제</button>
       		 
       			<select id="cart_sel"name="cart_sel">
           		 <option value="new" selected>최근담은순</option>
           		 <option value="low">저가격순</option>
            	 <option value='high'>고가격순</option>
            	 <option value="name">이름순</option>
            	 <option value="rel">출간일순</option>
        	    </select>
    	    
            
           <!--   <hr style="border: inset 10px #f3f3f3;"> -->
     
			  <div class="ct_container">
			  		<div class="item"></div>
			  		<div class="item">상품명</div>
			  		<div class="item">가격</div>
			  		<div class="item">수량</div>
			  		<div class="item">선택</div>
			  		<div class="item">chk</div>
			
					<div class="item">
						<span class="thum"><img class="cart_thum" src="<%= request.getContextPath() %>/resources/images/thisweek3.png"></span>	
					</div>
					<div class="item">
						<strong class="title_item">[국내도서] 어떻게 쓰지 않을 수 있겠어요</strong>
						<p class="desc_item">작가:홍길동<br>출판사:봄숲</p>
					</div>
					<div class="item">
						<strong class="title_item">정가:37000원</strong>
						<p class="desc_item">판매가:26000원<br>마일리지:1000원</p>
					</div>
					<div class="item">
						<strong class="title_item">
						<span> 
							<select name="amount" class="ct_input">
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="5">5</option>
								<option value="6">6</option>
								<option value="7">7</option>
								<option value="7">8</option>
								<option value="7">9</option>
								<option value="7">10</option>
							</select>
						</span>
						</strong>
						<p class="desc_item"></p>
					</div>
				    <div class="item">
						<strong class="title_item">
						<button class="ct_del">삭제</button>
						</strong>
					</div>
					<div class="item">
						<input type="checkbox">
					</div>

		
					<div class="item">
						<span class="thum"><img class="cart_thum" src="<%= request.getContextPath() %>/resources/images/thisweek3.png"></span>	
					</div>
					<div class="item">
						<strong class="title_item">[국내도서]책 1</strong>
						<p class="desc_item">작가:홍길동<br>출판사:봄숲</p>
					</div>
					<div class="item">
						<strong class="title_item">정가:30000원</strong>
						<p class="desc_item">정가:20000원<br>마일리지:1000원</p>
					</div>
					<div class="item">
						
						<strong class="title_item">
						<span> 
							<select name="amount" class="ct_input">
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="5">5</option>
								<option value="6">6</option>
								<option value="7">7</option>
								<option value="7">8</option>
								<option value="7">9</option>
								<option value="7">10</option>
							</select>
						</span>
						</strong>
					
					</div>
				    <div class="item">
						<strong class="title_item">
						<button class="ct_del">삭제</button>
						</strong>
				
					</div>
					<div class="item">
						<input type="checkbox">
					</div>

					
					<div class="item">
						<span class="thum"><img class="cart_thum" src="<%= request.getContextPath() %>/resources/images/thisweek3.png"></span>	
					</div>
					<div class="item">
						<strong class="title_item">[국내도서]책 1</strong>
						<p class="desc_item">작가:홍길동<br>출판사:봄숲</p>
					</div>
					<div class="item">
						<strong class="title_item">정가:30000원</strong>
						<p class="desc_item">정가:20000원<br>마일리지:1000원</p>
					</div>
					<div class="item">
						
						<strong class="title_item">
						<span> 
							<select name="amount" class="ct_input">
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="5">5</option>
								<option value="6">6</option>
								<option value="7">7</option>
								<option value="7">8</option>
								<option value="7">9</option>
								<option value="7">10</option>
							</select>
						</span>
						</strong>
					</div>
				    <div class="item">
						<strong class="title_item">
						<button class="ct_del">삭제</button>
						</strong>
					</div>
					<div class="item">
						<input type="checkbox">
					</div>
					<div class="item">
						<span class="thum"><img class="cart_thum" src="<%= request.getContextPath() %>/resources/images/thisweek3.png"></span>	
					</div>
					<div class="item">
						<strong class="title_item">[국내도서]책 1</strong>
						<p class="desc_item">작가:홍길동<br>출판사:봄숲</p>
					</div>
					<div class="item">
						<strong class="title_item">정가:30000원</strong>
						<p class="desc_item">정가:20000원<br>마일리지:1000원</p>
					</div>
					<div class="item">
						
						<strong class="title_item">
						<span> 
							<select name="amount" class="ct_input">
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="5">5</option>
								<option value="6">6</option>
								<option value="7">7</option>
								<option value="7">8</option>
								<option value="7">9</option>
								<option value="7">10</option>
							</select>
						</span>
						</strong>
					</div>
				    <div class="item">
						<strong class="title_item">
						<button class="ct_del">삭제</button>
						</strong>
					</div>
					<div class="item">
						<input type="checkbox">
					</div>
	  
			</div>
			            
           
        <!--  <hr style="border: outset 10px #f3f3f3;">   -->
        
        	<hr style="border: solid 1px gray;">
        	<div class="ct_tt">
	            <div class="c_item">
		            <div>총 상품 가격 : <span>53,200원</span> (총 <span>2</span>권 <span>5320원</span> 할인) + 배송비 <span>0원</span> </div>
		            <div>적립 예상 마일리지 : 상품 구매(<span>2,660원</span>)</div>
		            <div>수령 예상일: 지금 주문하면 <span>내일</span> 받을 수 있습니다.</div>
		        </div>
     		</div>
     		<hr style="border: solid 1px gray;">
     		<div class="ct_tt">
     			<div class="c_item">
     				<div>총 상품 가격 : 53,200원</div>
     				<div>배송비 : 0원</div>
     				<div>총 주문 상품수 : 2권</div>
     				<div>총 결제 예상 금액 : 53,200원</div>
     			</div>
     			<div class="c_item">
     				<div>상품 마일리지 : 2,660원</div>
     				<div>총 적립 예상 마일리지 : 2660원</div>
     			</div>
     		</div>
     		<hr style="border: solid 1px gray;">
     		<button id="ct_order_btn">선택한 상품 주문하기</button>
     		</form>
     		
         </div>
		</div>
	</div>

	<!-- footer -->
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>

</body>
</html>