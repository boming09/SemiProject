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
<link href="<%= request.getContextPath() %>/resources/css/order/cart.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
</head>
<body>
	<!-- 메뉴바 -->
	<%@ include file="/WEB-INF/views/common/menubar.jsp" %>
	
	<div class="ct_wrapper content">
		<div class="">
		<div class="cart_bl">
            <div id="cart">장바구니</div>
               
 			
            
       		 <label class="hidden"> cart_select</label>
       		 
       		 <button id="delete_btn" onclick="deleteChecked()">선택상품삭제</button>
      
       			<select id="cart_sel"name="cart_sel" onchange="sortList()">
           		 <option value="new" selected>최근담은순</option>
           		 <option value="low">저가격순</option>
            	 <option value='high'>고가격순</option>
            	 <option value="name">이름순</option>
            	 <option value="rel">출간일순</option>
        	    </select>
    	    
    	    <!-- <form name="orderby" action="<%= request.getContextPath() %>/cart/sort" method="post">-->
    	    <form name="orderby" action="<%= request.getContextPath() %>/cart" method="get">
    	    </form>
    	    
    	    
    	    <!-- 어디로갈지쓰셈 -->
    	    
    
        
     
			  <div class="ct_container">
			  		<div class="item"></div>
			  		<div class="item">상품명</div>
			  		<div class="item">가격</div>
			  		<div class="item">수량</div>
			  		<div class="item">선택</div>
			  		<div class="item"><input type='checkbox' onclick='selectAll(this)' checked/></div>
			  	
			<c:forEach var="cart" items="${ cartList }">
	
					<div class="item">
						<span class="thum"><img class="cart_thum" src="<%= request.getContextPath() %>${cart.book_img}"></span>	
					</div>
					<div class="item">
						<strong class="title_item">
							<c:choose>
								<c:when test="${cart.category_id eq '1'}"> [국내도서] </c:when>
								<c:when test="${cart.category_id eq '2'}"> [국외도서] </c:when>
							</c:choose>
							${cart.book_name }
						</strong>
						<p class="desc_item">작가:${cart.author}<br>출판사:${cart.publisher}<br>
							<c:choose>
								<c:when test="${cart.stock gt '100'}"> 내일 배송 가능 </c:when>
								<c:when test="${cart.stock lt '100'}"> 모레 배송 가능</c:when>
							</c:choose></p>
					</div>
					<div class="item">
						<strong class="title_item">
							판매가:<span class="price"><fmt:formatNumber value="${cart.sale_price}" type="number"/></span>원
						</strong>
						<p class="desc_item">정가:<span class="lth"><fmt:formatNumber value="${cart.price}" type="number"/></span>원
						<br>마일리지:<span class="green"><fmt:parseNumber value="${cart.price * 0.05}" integerOnly="true" /></span>원(5%)</p>
					</div>
					
					<form class="cart" action="<%= request.getContextPath() %>/cart/update"
					method="post">
					<input type="hidden" name="cart_no" value="${cart.cart_no}">
					<div class="item">
						<strong class="title_item">
						<span> 
							<select name="amount" class="ct_input"  onchange="this.form.submit()">
								<option value="1" <c:if test="${ cart.amount eq 1}">selected</c:if>>1</option>
								<option value="2" <c:if test="${ cart.amount eq 2}">selected</c:if>>2</option>
								<option value="3" <c:if test="${ cart.amount eq 3}">selected</c:if>>3</option>
								<option value="4" <c:if test="${ cart.amount eq 4}">selected</c:if>>4</option>
								<option value="5" <c:if test="${ cart.amount eq 5}">selected</c:if>>5</option>
								<option value="6" <c:if test="${ cart.amount eq 6}">selected</c:if>>6</option>
								<option value="7" <c:if test="${ cart.amount eq 7}">selected</c:if>>7</option>
								<option value="8" <c:if test="${ cart.amount eq 8}">selected</c:if>>8</option>
								<option value="9" <c:if test="${ cart.amount eq 9}">selected</c:if>>9</option>
								<option value="10" <c:if test="${ cart.amount eq 10}">selected</c:if>>10</option>
							</select> 
							
							<!--  <select class="form-control" id="test" name="amount" onchange="this.form.submit()">
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
							    <c:forEach items="${amount}" var="amountList">
							      <option value="${amountList.amountNo}" ${amountList.amountNo == 1 ? 'selected="selected"' : ''}>${amountList.amountNo}</option>
							    </c:forEach>
							</select>-->
							
							<!-- <select name="amount" class="ct_input" id="test" onchange="this.form.submit()">
							    <option value="1" ${amount == '0' ? 'selected="selected"' : '' }>1</option>
							    <option value="2" ${amount == '1' ? 'selected="selected"' : '' }>2</option>
							    <option value="3" ${amount == '2' ? 'selected="selected"' : '' }>3</option>
							</select> -->
							
						</span>
						</strong>
						<p class="desc_item"></p>
					</div>
					</form>
					

					
				    <div class="item">
						<strong class="title_item">
						<button class="ct_del" onclick="deleteCart(${cart.cart_no})">삭제</button>
						</strong>
					</div>
				
				
				
					<div class="item">
						<input type="checkbox" name="cart_chk" value="${ cart.cart_no }" checked>
					</div>			
			
		
					
			</c:forEach>
			
			<script>
				function deleteCart(cart_no) {
					location.href= '${ contextPath }/cart/delete?cart_no=' + cart_no;
				}
				
			
				
				function selectAll(selectAll)  {
					  const checkboxes 
					     = document.querySelectorAll('input[type="checkbox"]');
					  
					  checkboxes.forEach((checkbox) => {
					    checkbox.checked = selectAll.checked
					  })
					}
				
				
				function checkCheck() {
					  document.forms.chekchk.action="${contextPath}/order";
						document.forms.chekchk.submit();
				
					
				}
				
				var chkList = document.querySelectorAll("input[name=cart_chk]:checked");
				chkList.forEach(function (ch) {
				    console.log(ch.value);
				});
				
				
				
	//		        function accessName(){
	//		            let cart_chk = document.getElementsByName('cart_chk');
	//		            let checkedItems = '';
	//		            for(let ch of cart_chk) { //hb 변수: 하나의 인풋 타입 체크박스
	//		                if(ch.checked){ // 체크 박스가 체크 되어 있다면 true 리턴
	//		                    checkedItems += ch.value + " 선택함\n";
	//		                }
	//		            }
	//		            alert(checkedItems);
	//		        }
		
			        
	//		        function test() {
	//		           var obj_length = document.getElementsByName("cart_chk").length;
	//		      
	//		            for (var i=0; i<obj_length; i++) {
	//		                if (document.getElementsByName("cart_chk")[i].checked == true) {
	//		                    //alert(document.getElementsByName("cart_chk")[i].value);
	//		                    //알러트 말고 태그에 어떻게 넣니
	//		                    var cartChecked = document.getElementsByName("cart_chk")[i].value
	//		                    //document.getElementById('cart_check').value = document.getElementsByName("cart_chk")[i].value;
	//		                    $('input[name=cart_check]').attr('value', cartChecked);
	//		                }
	//		            }
	//		        }
		
			        
		//	        function fnAddElement(fNm, nm, value){
		//	        	var obj_length = document.getElementsByName("cart_chk").length;
		//	        	var cartChecked = null;
		//	        	 for (var i=0; i<obj_length; i++) {
		//		                if (document.getElementsByName("cart_chk")[i].checked == true) {
		//		                    //alert(document.getElementsByName("cart_chk")[i].value);
		//		                    //알러트 말고 태그에 어떻게 넣니
		//		                    //cartChecked = document.getElementsByName("cart_chk")[i].value
		//				        	var theForm = document.forms[chekchk]; 
		//				        	if ( theForm.elements[cart_check] == null){
		//				        		var input   = document.createElement('input'); 
		//				        		input.type   = 'hidden'; 
		//				        		input.name  = 'cart_check'; 
		//				        		input.id  = nm 
		//				        		input.value  = document.getElementsByName("cart_chk")[i].value
		//				        		theForm.appendChild(input); 
		//				        	}else{
		//				        		$("#" + cart_check).val(document.getElementsByName("cart_chk")[i].value);
		//				        	}
		//		                }
		//	        	
		//	        }
		//	        }
			        
			        
			        
			        
			        
			        function test2() { // 체크된 목록 넘기기
			           var obj_length = document.getElementsByName("cart_chk").length;
			      
			            for (var i=0; i<obj_length; i++) {
			                if (document.getElementsByName("cart_chk")[i].checked == true) {
			                    //alert(document.getElementsByName("cart_chk")[i].value);
			                    //알러트 말고 태그에 어떻게 넣니
			                
			                   var input = document.createElement('input'); 

					           input.setAttribute("type", "hidden");
					           input.setAttribute("name", "cart_check"); 
					           input.setAttribute("value", document.getElementsByName("cart_chk")[i].value); 
		
					           chekchk.appendChild(input);
		
					           document.body.appendChild(chekchk); 
		
					           chekchk.submit();
			           	 	}
			        	}
			        }
			        
			        
			    	function sortList() { //정렬
			    		
		    	   	   var sort =  $("#cart_sel option:selected").val();
		    	   	 
		    	   	   console.log(sort);
		    	   	   var input = document.createElement('input'); 

				           input.setAttribute("type", "hidden");
				           input.setAttribute("name", "orderby"); 
				           input.setAttribute("value", sort); 
				           
				           orderby.appendChild(input);
				   		
				           document.body.appendChild(orderby); 
		    	   	 	
		    	   	 	orderby.submit();
			    	}
		    	 
			    	function deleteChecked() { //선택삭제
			    		 var obj_length = document.getElementsByName("cart_chk").length;
					      
				            for (var i=0; i<obj_length; i++) {
				                if (document.getElementsByName("cart_chk")[i].checked == true) {
				                    //alert(document.getElementsByName("cart_chk")[i].value);
				                    //알러트 말고 태그에 어떻게 넣니
				                
				                   var input = document.createElement('input'); 

						           input.setAttribute("type", "hidden");
						           input.setAttribute("name", "cart_check"); 
						           input.setAttribute("value", document.getElementsByName("cart_chk")[i].value); 
			
						           chkDel.appendChild(input);
			
						           document.body.appendChild(chkDel); 
			
						           chkDel.submit();
				           	 	}
				        	}
			    		
			    	}
		    	    
			</script>
			<form name="chekchk" method="post" action="${contextPath}/order">
				<!--  <input type="hidden" id="cart_check" name="cart_check" value=""/>-->
			
			</form> 

			<form name="chkDel" method="post" action="${contextPath}/cart/delete">
				<!--  <input type="hidden" id="cart_check" name="cart_check" value=""/>-->
			
			</form> 
	  
			</div>
			            
     
        	<div class="ct_tt">
	            <div class="c_item">
	            
	           	    <!-- 총 상품 가격 계산 -->
	            	<c:set var="sum" value="0"/>
     				<c:forEach var="cart" items="${ cartList }">
     					<c:set var="sum" value="${sum + cart.sale_price * cart.amount}"/>
     				</c:forEach>
     				
     				<!-- 총 마일리지 계산 -->
	           	    <c:set var="msum" value="0"/>
     				<c:forEach var="cart" items="${ cartList }">
     					<c:set var="msum" value="${ msum + cart.price * cart.amount }"/>
     				</c:forEach>	
     				
     				<!-- 총 상품수 계산 -->
     				<c:set var="amounts" value="0"/>
     				<c:forEach var="cart" items="${ cartList }">
     					<c:set var="amounts" value="${ amounts + cart.amount }"/>
     				</c:forEach>
     				
     				<!-- 총 할인 계산 -->
     				<c:set var="discounts" value="0"/>
     				<c:forEach var="cart" items="${ cartList }">
     					<c:set var="discounts" value="${ discounts + (cart.price - cart.sale_price) }"/>
     				</c:forEach>
	            
		            <div>총 상품 가격 : <span class="price"><fmt:formatNumber value="${sum}" type="number"/></span>원 (총 <span> ${amounts}</span>권 <span><fmt:formatNumber value="${discounts}" type="number"/> </span> 할인) + 배송비 <span>0원</span> </div>
		            <div>적립 예상 마일리지 : 상품 구매(<span class="green"><fmt:formatNumber value="${msum div 20}" type="number"/>원</span>)</div>
		            <div>수령 예상일: 지금 주문하면 <span class="price">내일</span> 받을 수 있습니다.</div>
		        </div>
     		</div>
     
     		<div class="ct_tt">
     			<div class="d_item">
     				<div>총 상품 가격 : <span class="price"><fmt:formatNumber value="${sum}" type="number"/></span>원 </div>
     				<div>배송비 : <span class="price">0원</span></div>
     				<div>총 주문 상품수 : ${amounts}권</div>
     				<div>총 결제 예상 금액 : <span class="price"><fmt:formatNumber value="${sum}" type="number"/></span>원</div>
     			</div>
     			<div class="d_item">
     				<div>상품 마일리지 : <b><fmt:formatNumber value="${msum div 20}" type="number"/>원</b></div>
     				<div>총 적립 예상 마일리지 : <span class="price"><fmt:formatNumber value="${msum div 20}" type="number"/></span>원</div>
     			</div>
     		</div>
     	<!-- 	<form name="totalPrices" action="${contextPath}/payment">
     			<input type="hidden" name="totalPrice" value="${sum}">
     			<input type="hidden" name="totalamount" value="${amounts}">
     		</form> -->
     		<button id="ct_order_btn" type="button" onclick="test2();">선택한 상품 주문하기</button>
     	
     		
         </div>
		</div>
	</div>

	<!-- footer -->
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>

</body>
</html>