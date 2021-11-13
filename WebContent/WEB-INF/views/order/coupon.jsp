<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>coupon jsp</title>
<style>
  body { background : #F2F9F0; }
  
 /* 전체 글꼴 */
@font-face {
    font-family: 'ChosunGu';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@1.0/ChosunGu.woff') format('woff');
    font-weight: normal;
    font-style: normal;
} 
  * {  font-family: 'ChosunGu';}
 .wrap { 
 /*	background : #f3f3f3; 
 	width : 610px;
 	text-align:center;*/
 		}
 #title {width:100%; font-family: 'ChosunGu'; font-size:1.2rem;  margin:140px;}
 table{ /*margin-left:3%; margin-bottom:10%; */
 	width: 100%;
 	font-weight:bold;
 	/*height:80px;*/
 	text-align:center;
 	font-size:0.9rem;
}

.btn {
	border:1px solid gray;
	padding:4px;
	background : #F2F9F0;
	font-size: 0.9rem;
	font-weight: bold;
	background:white;
/*	background:rgba(73, 125, 78, 1);
	color:white;*/
	/*position:absolute;*/

   /* left:57%;*/
   /* transform:translate(-50%,-50%);  */

}

.dd {
	margin-left:180px;
	margin-top:40px;
}


.green{
	color:rgba(73, 125, 78, 1);
}

th,td {
  padding:5px;
 }



</style>
</head>
<body>
<br>
    <b id="title"><span class="green">봄숲 보유 쿠폰 조회</span></b>
    <br><br>
    <hr style="border:1px solid gray;">
    <div class="wrap">
	    <table>
	      
	      	<tr>
	      		<th>번호</th>
	      		<th>이름</th>
	      		<th>쿠폰 내용</th>
	      		<th>할인율</th>
	      		<th>사용 기한</th>
	      	</tr>
	      	<c:forEach var="coupon" items="${ couponList }">
	    	<tr>
	    		<td>${coupon.couponNo}</td>
	    		<td>${coupon.couponNm}</td>
	    		<td>${coupon.couponCtt}</td>
	    		<td>${coupon.couponDis}%</td>
	    		<td>${coupon.cExpDate}</td>
	    		<td><input type=radio name="checkCoupon" id="checkCoupon" value="${coupon.couponNo}"></td>
	    	</tr>
	    	<!--  <input type="hidden" id="couponDis" value="${coupon.couponDis}">
			<input type="hidden" id="couponNo" value="${coupon.couponNo}">-->
	    	   </c:forEach>
	    </table>
 	 </div>

 
  	<!--    <input type="text" id="cInput"><br><br>--> <!-- 얘는 왜.. -->
       <script>
        function setParentText(){
        	
             opener.document.getElementById("aInput").value = document.getElementById("checkCoupon").value
             opener.document.getElementById("bInput").value = document.getElementById("couponDis").value
        
       //이러면 첫번째꺼 밖에 안넘어감 어차피
        }
        
        
       /* function setParentText(){
        	var obj_length = document.getElementsByName("checkCoupon").length;
  	      
            for (var i=0; i<obj_length; i++) {
            	if (document.getElementsByName("checkCoupon")[i].checked == true) {
            		
		             opener.document.getElementById("pInput").value = document.getElementById("checkCoupon")[i].value
            	}
            }
  
        }*/
        
        function popupSubmit() {

            window.opener.name = "parentForm"; // 부모창의 이름 설정

            document.popForm.target = "parentForm"; // 타켓을 부모창으로 설정

            document.popForm.action = "${contextPath}/payment" //부모창에 호출될 url 
//"/target/parentPage2.do"; 
            
            document.popForm.submit();

            self.close();

        }


        
        
        
        function test2() { // 체크된 목록 넘기기
	           var obj_length = document.getElementsByName("checkCoupon").length;
	      
	            for (var i=0; i<obj_length; i++) {
	                if (document.getElementsByName("checkCoupon")[i].checked == true) {
	                    //alert(document.getElementsByName("cart_chk")[i].value);
	                    //알러트 말고 태그에 어떻게 넣니
	                
	                   var input = document.createElement('input'); 

			           input.setAttribute("type", "hidden");
			           input.setAttribute("name", "checkCoupon"); 
			           input.setAttribute("value", document.getElementsByName("checkCoupon")[i].value); 

			           chekCp.appendChild(input);

			           document.body.appendChild(chekCp); 

			           chekCp.submit();
	           	 	}
	        	}
	        }
	        
        
        
        
   		</script>




	   
	    <form name="popForm" method="post">
	    <!-- 이안에 체크된거 넣을 스크립트 작성 -->
	    <!-- 히든으로 쿠폰넘버랑 가격값은 보이게 넘겨 -->
	    <c:forEach var="coupon" items="${ couponList }">
	 		<input type="hidden" name="couponDis" id="couponDis" value="${coupon.couponDis}">
			<input type="hidden" name="couponNo" id="couponNo" value="${coupon.couponNo}">
	   </c:forEach>
	   <div class="dd"> 
	   <button type="submit" class="btn" onclick="popupSubmit()">적용</button>
	 <!--    <button type="submit" class="btn" onclick="setParentText()">적용</button> -->
	<!--    <input type="submit" class="btn" value="적용" onclick="window.close()">-->  
	    <input type="button" class="btn" value="창닫기" onclick="window.close()">
	   </div>
	    </form>
	
</body>
</html>