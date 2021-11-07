<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bomsoup login</title>
    <link rel="stylesheet" href="https://unpkg.com/ress/dist/ress.min.css">
    <!-- favicon (Real Favicon Generator 등에서 가공 필요) -->
    <link rel="icon" type="image/x-icon" href="resources/image/khfavicon.ico">
    <!-- 외부 스타일 시트 -->
    <link href="<%= request.getContextPath() %>/resources/css/mypage/mypage-orchca.css" rel="stylesheet">
</head>
<body>
    <!-- 메뉴바 -->
	<%@ include file="/WEB-INF/views/common/menubar.jsp" %>
        
    <div class="csarea wrapper">
		<!-- mypage-category 카테고리 추가 -->
		<%@ include file="/WEB-INF/views/mypage/mypage-category.jsp" %>		
		<!-- 헤더 div -->
		<div class="content">            
           	<h2 id="hi">${ loginUser.userNickname } 고객님, 안녕하세요.</h2><br>
           	<div class="content_li">
           		<ul>
           			<li>배송 문의 : 익일택배 OO택배(1588-0000) / 당일택배 XX택배 (1588-1111) / 편의점 택배(1588-2222)</li>
           			<li>(배송 방법 : 주문조회 / 변경 / 취소 클릭후 확인)</li>
           		</ul>
           	</div>
           	<br><br>
            <header>
            	<div class="hdcenter">
            		<div class="left">
            		<h3>멤버십 등급 : 일반</h3>
            		봄숲 멤버십 회원이 되신걸 환영합니다.<br>
            		구매 금액의 1~3% 추가 마일리지 및 쿠폰 혜택을 받으실수 있습니다.
            		</div>
            		<div class="right">
            		<h3>내 문의 사항</h3>
            		내문의 사항 내용을 볼수 있습니다.
            		</div>
            	</div>
            </header>
            
            <!-- center div -->
            <br>
            <br>
            <h4>전체 주문내역</h4>
            <br>
            <div class="center">
            	<div class="center0">
	            	<div class="cenleft">
		            	<div class="centerdiv1">
		            		<select class="selectbox" id="sb1" name="sb1">
		                        <option value="">전체보기</option>
		                        <option value="">제목</option>
		                        <option value="">내용</option>
		                    </select>                
		            		<select class="selectbox" id="sb2" name="sb2">
		                        <option value="">전체보기</option>
		                        <option value="">제목</option>
		                        <option value="">내용</option>
		                    </select>
		                </div>
		                <div class="centerdiv3">
		                <label>주문검색</label>
		            		<select class="selectbox" id="sb3" name="sb3">
		                        <option value="">주문상품</option>
		                        <option value="">제목</option>
		                        <option value="">내용</option>
		                    </select>                
		            		<select class="selectbox" id="sb4" name="sb4">
		                        <option value=""></option>
		                        <option value="">제목</option>
		                        <option value="">내용</option>
		                    </select>
		                </div>
	                </div>
	                <div class="cenright">
		                <div class="centerdiv5">
		                	<label>판매자별 조회</label>
		            		<select class="selectbox" id="sb5" name="sb5">
		                        <option value="">전체보기</option>
		                        <option value="">제목</option>
		                        <option value="">내용</option>
		                    </select>
		                </div>
		                <div class="centerdiv6">
		                <label>배송 상태별 조회</label>
		            		<select class="selectbox" id="sb6" name="sb6">
		                        <option value="">전체보기</option>
		                        <option value="">제목</option>
		                        <option value="">내용</option>
		                    </select>
		                </div>
	                </div>
	            </div>
	                <div class="searchbut"><a href="">찾기</a></div>
            </div>
            <br>
            <br>
            <div class="df1">
            	<div id="df1">주문일</div>
            	<div id="df2">주문번호</div>
            	<div id="df3">수령인</div>
            	<div id="df4">주문상품</div>
            	<div id="df5">조회 및 증빙 서류</div>
            	<div id="df6">비고</div>
            </div>
            <div class="df2">
            	<div id="df2-1"></div>
            	<div id="df2-2"></div>
            	<div id="df2-3"></div>
            	<div id="df2-4"></div>
            	<div id="df2-5"></div>
            	<div id="df2-6"></div>
            </div>
            <br>
            <h2 id="hi2">영수증 출력(카드 매출 전표 출력)</h2>
            <br>
            <div class="content_li">
            	<ul>
            		<li>'영수증'과 '카드전표'버튼을 클릭하세요(단, 발송 이후의 주문만 가능하며, 선물 주문의 영수증은 주문인 이름으로 발급합니다.)</li>
            		<li>결제된 카드매출전표는 Aladin의 신용카드 결제대행에서 제공하는 화면으로 Aladin에서의 구입내역을 해당카드로 결제하였음을 확인</li>
            		<li>하는 자료로 사용하실 수 있습니다.</li>
            	</ul>
            </div>
            <br>
            
        </div>        
        <!-- 광고  -->
		<%@ include file="/WEB-INF/views/common/adArea.jsp" %>
	</div>	
    <!-- footer -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>