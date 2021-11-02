<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://unpkg.com/ress/dist/ress.min.css">
<!-- 외부 스타일 시트 -->
<link href="${ contextPath }/resources/css/mypage/mypage-mycoupon2.css" rel="stylesheet">
<title>내 쿠폰</title>
</head>
<body>
	<!-- 메뉴바 -->
	<jsp:include page="/WEB-INF/views/common/menubar.jsp" />
	
	<div class="csarea wrapper">
        <!-- mypage-category 카테고리 추가 -->
		<%@ include file="/WEB-INF/views/mypage/mypage-category.jsp" %>
        
        <div class="content">
        	<header class="coupon_header">
                <div>내쿠폰</div>
                <!-- 
                <div class="review_commu">
                    <button onclick="location.href='${ contextPath }/commu'">전체<br>소통게시판</button>
                </div>
                 -->
            </header>
        
            <div class="coupon_area1">
                <span>내쿠폰 목록</span>                
            </div>

            <div class="coupon_area2">
                <header class="coupon_area2_hdader">
	                <!-- <label id="area2_coupon">쿠폰</label> -->
                	쿠폰적용
                </header>
                <div class="area2_center">
                	봄숲 쿠폰<br>
                	상품금액 : <label class="bookware"></label> - 할인금액 : <label class="disamount"></label><br>
                	<input type="checkbox"> 선택 안 함
                </div>
                <div class="coupon_center">
	                <div class="coupon_no">
	                	<div class="left">
	                		<div class="left_ckeck">
	                			<input type="checkbox">
	                		</div>
	                		<div class="left_coupon">
	                			<h4>신규 가입 할인 쿠폰</h4>                			
	                			<p>
		                			<ul>
		                				<li>9000원 이상 결제시</li>
		                				<li>2022년 11월 1일 까지</li>
		                				<li>쿠폰 한 장당 1회만 결제 가능</li>
		                			</ul>
		                		</p>
	                		</div>
	                	</div>
	                	<div class="right">
	                		<div class="right_left">
	                			10% 할인
	                		</div>
	                		<div class="right_right">
	                			10%할인<br>
	                			<small>bomsoop</small>
	                		</div>
	                	</div>
	                </div>
                </div>
            </div>
        </div>	
        
        <!-- 광고  -->
		<jsp:include page="/WEB-INF/views/common/adArea.jsp" />	
	</div>
	
	<!-- footer -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>