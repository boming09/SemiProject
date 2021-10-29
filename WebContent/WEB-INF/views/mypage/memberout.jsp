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
    <link href="<%= request.getContextPath() %>/resources/css/memberout.css" rel="stylesheet">
</head>
<body>
    <!-- 메뉴바 -->
	<%@ include file="/WEB-INF/views/common/menubar.jsp" %>
        
    <div class="csarea wrapper">
		<!-- mypage-category 카테고리 추가 -->
		<%@ include file="/WEB-INF/views/mypage/mypage-category.jsp" %>		
		<!-- 헤더 div -->
		<div class="content">            
            <div class="hd1">
	            <header>
	           	<h3>회원탈퇴</h4>
	            	<ul class="heul">
	            		<li id="hi1li1">회원 탈퇴시 적립금, 예치금, 쿠폰, 마일리지, 봄숲 상품권 등의 통장이 자동삭제 됩니다</li>
	            		<li id="hi1li2">출고 이전 주문이 있을 경우 상품 배송처리 문제로 탈퇴 불가능 합니다(주문 취소 혹은 출고 이후 탈퇴 가능)</li>
	            		<li id="hi1li3">고객님의 거래내역은 전자상거래 등에서의 소비자보호에 관한 법류 제 6조 및 동법 시행령 제 6조에 의거하여
	            						표시 및 광고에 관한 기록은 6월,<br>계약 또는 청약 철회 등에 관한 기록은 5년, 대금결제 및 재화 공급 등의 공급에 관한
	            						기록은 5년, 소비자 불만 또는 분쟁처리에 관한 기록은 3년간 기록됩니다.</li>
	            	</ul>
	            	<p>
	            	<a href="#"><img class="#" src="<%= request.getContextPath() %>/resources/images/#.png" alt="warning"></a>
	            	로그인할 때 사용하시는 이메일 주소를 직접 변경할 수 있습니다. <input type="button" value="이메일주소 변경하기">
	            	</p>
	            </header>
            </div>
            <div class="topline">
        	</div>
            <!-- center div -->
            <br>
            <h4>고객님께서 느끼신 봄숲의 부족한 점을 지적해 주세요.<br>
            	소중하게 반영하겠습니다.</h4>
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
            <div class="df">
            	<div id="df1">주문일</div>
            	<div id="df2">주문번호</div>
            	<div id="df3">수령인</div>
            	<div id="df4">주문상품</div>
            	<div id="df5">조회 및 증빙 서류</div>
            	<div id="df6">비고</div>
            </div>
            <br>
            <h4>비밀번호 : <input type="text"> <input type="button" value="탈퇴확인"></h4>
            <br>            
        </div>
        
        <!-- 광고  -->
		<%@ include file="/WEB-INF/views/common/adArea.jsp" %>
	</div>	
    <!-- footer -->
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>