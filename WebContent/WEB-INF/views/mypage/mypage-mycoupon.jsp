<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://unpkg.com/ress/dist/ress.min.css">
<!-- 외부 스타일 시트 -->
<link href="${ contextPath }/resources/css/kwang/mypage-mycoupon.css" rel="stylesheet">
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
                	쿠	폰
                </header>
                <div class="area2_center">
                	<div class="coupon_no">보유 쿠폰 : <label id="coupon_number"><a href="#">1</a>장</label></div>
                	<div class="coupon_button"><a href="<%= request.getContextPath() %>/mypagemycoupon2"><input type="button" id="cbut" value="쿠폰조회/적용"></a></div>
                	<div class="coupon_discount">할인금액 : <lebel id=""></lebel></div>
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