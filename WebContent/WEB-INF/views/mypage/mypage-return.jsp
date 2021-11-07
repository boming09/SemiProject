<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://unpkg.com/ress/dist/ress.min.css">
<!-- 외부 스타일 시트 -->
<link href="${ contextPath }/resources/css/mypage/mypage-return.css" rel="stylesheet">
<title>반품/교환내역 조회</title>
</head>
<body>
	<!-- 메뉴바 -->
	<jsp:include page="/WEB-INF/views/common/menubar.jsp" />
	
	<div class="csarea wrapper">
        <!-- mypage-category 카테고리 추가 -->
		<%@ include file="/WEB-INF/views/mypage/mypage-category.jsp" %>
        
        <div class="content">
        	<header class="return_header">
                <div id="header_name">반품/교환내역 조회</div>
                <div class="ul_div">
	                <ul class="return_header_ul">
	                	<li>접수하신 반품 혹은 교환(하자상품)내역의 처리상태 및 정보를 조회 변경(취소)할 수 있습니다.</li>
	                	<li>접수내역의 취소 변경(추가)은 현재 처리상태에 따라 불가능 할 수 있습니다.<br>
	                	이 경우(1:1문의하기)를 이용해 신청해주세요</li>
	                	<li>반품 환불:접수시 선택한 회송방법을 통해 상품이 도착되면 상품취소 및 환불 됩니다.<br>
	                	반송시(지정택배사 이용시)/쿠폰사용액 차감 후 나머지만 환불되어, 환불예정액과 환불완료액이 다를수 있습니다.</li>
	                	<li>교환/추가배송/회수 : 교환상품 재배송 편에 하자상품 회수가 이루어집니다.</li>
	                	<li>환불 완료 및 교환상품 출고 완료시 확인 메일을 보내드립니다.</li>
	                </ul>
                </div>
            </header>
            <br><br><br>
            <div class="center_to">
            	<input type="radio" name="tabment" id="tab01" checked>
            	<label for="tab01">반품 / 환불내역</label>           	
            	
            	<input type="radio" name="tabment" id="tab02">
            	<label for="tab02">교환 / 추가배송(누락) / 회수내역</label>
            </div>
            	<div class="topline2"></div>
            	<br><br>     
        
            <div class="returnlabel">
               	 <label class="returnlabel">신청하신 반품/환불 내역이 없습니다</label>             
            </div>
            <br><br>
            <div class="return_area2">
                <div class="return_listarea">
                    <ul class="return_listtop">
                        <li class="return_receipt">접수일</li>
                        <li class="return_division">구분</li>
                        <li class="return_return">반품시한</li>
                        <li class="return_no">원주문번호</li>
                        <li class="return_product">상품명</li>
                        <li class="return_forward">회송방법</li>
                        <li class="return_refund">환불방법</li>
                        <li class="return_process">처리상태</li>
                        <li class="return_change">조회/변경/취소</li>                
                    </ul>
                    <!-- 반복문 -->
                    <ul class="return_list" onclick="#">
                        <li class="return_receipt">2021-11-2</li>
                        <li class="return_division">반품</li>
                        <li class="return_return">2021-11-16</li>
                        <li class="return_no">21211102-123456</li>
                        <li class="return_product">JSP</li>
                        <li class="return_forward">택배</li>
                        <li class="return_refund">결제취소</li>
                        <li class="return_process">처리중</li>
                        <li class="return_change">취소</li>  
                    </ul>                   
                </div>
                
                <div class="wcommu_page">
                    <!-- 페이지 바 영역 => 나중에 작성 -->
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