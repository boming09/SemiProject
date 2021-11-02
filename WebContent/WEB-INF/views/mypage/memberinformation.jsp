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
    <link href="<%= request.getContextPath() %>/resources/css/memberinformation.css" rel="stylesheet">
</head>
<body>
    <!-- 메뉴바 -->
	<%@ include file="/WEB-INF/views/common/menubar.jsp" %>
        
    <div class="csarea wrapper">
		<!-- mypage-category 카테고리 추가 -->
		<%@ include file="/WEB-INF/views/mypage/mypage-category.jsp" %>		
		<!-- 헤더 div -->
		<div class="content">            
            <header>
            	<div class="hdcenter">
            		<h3>개인정보 수정</h3><br>
            		<ul>
            			<li>변경된 주소나 연락처, 이메일 주소를 수정해주세요.</li>
            			<li>주소 변경 전 접수하신 주문에는 새 주소가 반영되지 않습니다.</li>
            			<li>이미 접수된 주문의 배송주소는 주문별 상세 페이지에서 각각 변경해주세요.</li>
            		</ul>
            	</div>
            </header>
            <br>
            <div class="cen">
	            <table class="ctable" id="table1">
	            	<tr>
	            		<th>아이디</th>
	            		<td>&nbsp;&nbsp;
	            			<input type="text" class="tb3"></td>
	            	</tr>
	            	<tr>
	            		<th>성  명</th>
	            		<td>&nbsp;&nbsp;
	            			<input type="text" class="tb3"></td>
	            	</tr>
	            	<tr>
	            		<th>본인인증</th>
	            		<td>&nbsp;&nbsp;
	            			<input type="text" class="tb3">
	            			&nbsp;&nbsp;&nbsp;&nbsp;
	            			<input type="button" class="tb1" id="tb1phone" value="휴대전화로 본인 인증하기">
	            			&nbsp;&nbsp;&nbsp;&nbsp;
	            			<input type="button" class="tb1" id="tb1ip" value="아이핀 인증하기"></td>
	            	</tr>            	
	            	<tr>
	            		<th rowspan="">서재 닉네임</th>
	            		<td>&nbsp;&nbsp;
	            			<input type="text" class="tb3">
	            			&nbsp;&nbsp;&nbsp;&nbsp;
	            			<input type="button" class="tb2" value="변경하기"><br>
		            		&nbsp;&nbsp;&nbsp;&nbsp;
		            		서재 닉네임은 100자평, 마이리뷰, 이벤트 댓글에 사용됩니다.</td>
	            	</tr>
	            	<tr>
	            		<th>이메일 주소</th>
	            		<td>&nbsp;&nbsp;
	            			<input type="text" class="tb3">
	            			&nbsp;&nbsp;&nbsp;&nbsp;
	            			<input type="button" class="tb2" value="변경하기"></td>
	            	</tr>
	            	<tr>
	            		<th>주   소</th>
	            		<td>&nbsp;&nbsp;
	            			<input type="text" class="tb4" size="15"><br>
	            			&nbsp;&nbsp;
	            			<input type="text" class="tb4" size="29"><br>
	            			&nbsp;&nbsp;
	            			<input type="text" class="tb4" size="29">
	            			&nbsp;&nbsp;&nbsp;&nbsp;
	            			<input type="button" class="tb2" value="변경하기"></td>
	            	</tr>
	            	<tr>
	            		<th>휴대전화</th>
	            		<td>&nbsp;&nbsp;
	            			<input type="text" class="tb3">
	            			&nbsp;&nbsp;&nbsp;&nbsp;
	            			<input type="button" class="tb2" value="변경하기">
	            			&nbsp;&nbsp;&nbsp;&nbsp;
	            			주문배송 SMS, ARS상담시 본인 확인용으로 사용</td>
	            	</tr>
	            	<tr>
	            		<th>전화번호</th>
	            		<td>&nbsp;&nbsp;
	            			<input type="text" class="tb3">
	            			&nbsp;&nbsp;&nbsp;&nbsp;
	            			<input type="button" class="tb2" value="입력하기">
	            	</tr>
	            	<tr>
	            		<th>비밀번호</th>
	            		<td>&nbsp;&nbsp;
	            			<input type="text" class="tb3">
	            			&nbsp;&nbsp;&nbsp;&nbsp;
	            			<input type="button" class="tb2" value="변경하기"></td>
	            	</tr>
	            </table>
	            <br>
	            <h3>계정 연동여부</h3>
	            <br>
	            <table class="ctable" id="table2">
	            	<tr>
	            		<th>카카오</th>
	            		<td>&nbsp;&nbsp;&nbsp;&nbsp;
	            			<input type="button" class="tb2" value="변경하기"></td>
	            		<th>네이버</th>
	            		<td>&nbsp;&nbsp;&nbsp;&nbsp;
	            			<input type="button" class="tb2" value="변경하기"></td>
	            	</tr>
	            </table>
	            <br>
	            <table class="ctable" id="table3">
	            	<tr>
	            		<th><input type="button" class="tb3" value="뉴스레터/문자수신 설정">
	            		 &nbsp;&nbsp;&nbsp;&nbsp;메일, sms 또는 알림톡, 앱 푸시를 통한 신간, 이벤트 정보 수신 여부를
	            			설정할 수 있습니다.
	            	</tr>
	            </table>
	            <br>
	            <h3 class="terms" id="terms">봄숲 약관 동의 내역</h3>
	            <br>
	            <p>
	            	<ul class="pterms">
	            		<li>봄숲 이용약관 : 에 동의 하였습니다.</li>
	            		<li>봄숲 커뮤니티 이용약관 : 에 동의 하였습니다.</li>
	            		<li>봄숲 개인정보 수집 및 이용 : 에 동의 하였습니다.</li>
	            		<li>봄숲 에서 제공하는 서비스의 특성상 회원 가입시 필수 동의 항목 중 일부 항목의 철회는 불가합니다.</li>
	            		<li>동의 철회를 하시려면 현제 페이지 왼쪽에 있는 "회원탈퇴" 메뉴를 이용해주시기 바랍니다.</li>
	            	</ul>
	            </p>
	            </div>
	        </div>
        <!-- 광고  -->
		<%@ include file="/WEB-INF/views/common/adArea.jsp" %>
    	</div>
        
	</div>	
    <!-- footer -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>