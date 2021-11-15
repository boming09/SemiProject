<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.Arrays"%>
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
    <link href="<%= request.getContextPath() %>/resources/css/mypage/memberinformation.css" rel="stylesheet">
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
            	<!-- 
            	<form id="joinForm" action="<%= request.getContextPath() %>/memberinformation"
            	method="post" onsubmit="return validate();">
	             -->
	            <table class="ctable" id="table1">
	            	<tr>
	            		<th class="tbtd">아이디</th>
	            		<td class="privacy"><%= loginUser.getUserId() %></td>
	            	</tr>
	            	<tr>
	            		<th>비밀번호</th>
	            		<td class="privacy"></td>           			
	            	</tr>	            	
	            	<tr>
	            		<th>성  명</th>
	            		<td class="privacy"><%= loginUser.getUserName() %></td>
	            	</tr>
	            	<tr>
	            		<th>휴대전화</th>
	            		<td class="privacy"><%= loginUser.getUserPhone() != null ? loginUser.getUserPhone() : "" %>         			
	            			<label class="detaillabel">
	            			주문배송 SMS, ARS상담시 본인 확인용으로 사용</label></td>
	            	</tr>
	            	<tr>
	            		<th>이메일 주소</th>
	            		<td class="privacy"><%= loginUser.getUserEmail() != null ? loginUser.getUserEmail() : "" %></td>
	            	</tr>
	            	<tr>
	            		<th>성  별</th>
	            		<td class="privacy"><%= loginUser.getGender() %></td>
	            	</tr>
	            	<tr>
	            		<% 
	            			String[] address;
	            			if(loginUser.getUserAddress() != null){
            					address = loginUser.getUserAddress().split("[|]");
	            			} else {
	            				address = new String[] {"", "", ""};
	            			}
	            		%>
	            		<th class="address_name">주   소</th>
	            		<td class="privacy"><%= address[0] %><br>	            			
	            			<%= address[1] %><br>
	            			<%= address[2] %><br></td>
	            	</tr>
	            	<!-- 
	            	<tr>
	            		<th>본인인증</th>
	            		<td class="privacy"></td>
	            	</tr>
	            	 -->            	
	            	<tr>
	            		<th rowspan="">서재 닉네임</th>
	            		<td class="privacy"><%= loginUser.getUserNickname() != null ? loginUser.getUserNickname() : "" %>
		            		<label class="detaillabel">서재 닉네임은 100자평, 마이리뷰, 이벤트 댓글에 사용됩니다.</label></td>
	            	</tr>
	            </table>
	            <br>
	            <!-- 
	            <h3>계정 연동여부</h3>
	            <br>
	            <table class="ctable2" id="table2">
	            	<tr>
	            		<th>카카오</th>
	            		<td></td>
	            		<th>네이버</th>
	            		<td></td>
	            	</tr>
	            </table>
	             -->
	            <br>
	            <table class="ctable" id="table3">
	            	<tr>
	            		<th><input type="button" class="tb5" value="뉴스레터/문자수신 설정">
	            		 &nbsp;&nbsp;&nbsp;&nbsp;메일, sms 또는 알림톡, 앱 푸시를 통한 신간, 이벤트 정보 수신 여부를
	            			설정할 수 있습니다.
	            	</tr>
	            </table>
	            	<div class="btnArea">
						<a href="<%= request.getContextPath() %>/memberinformation"><button id="updateBtn">수정하기</button></a>
						<a href="<%= request.getContextPath() %>/memberout"><button id="deleteBtn" type="button"
						>탈퇴하기</button></a>
				</div> 
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
	<!-- jQuery와 Postcodify를 로딩한다 -->
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
	<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>

	<!-- "검색" 단추를 누르면 팝업 레이어가 열리도록 설정한다 -->
	<script>
		$(function() {
			$("#postcodify_search_button").postcodifyPopUp();
		});
	</script>

	<script>
		// 사용자 입력 값 유효성 검사용 함수
		function validate(){
			return true;
		}
		
		// 비밀번호 변경 팝업창 호출
		function openPopup(url, title, width, height) {
			
			var left = (document.body.clientWidth/2)-(width/2);
			//left += window.screenLeft;	// 듀얼 모니터
			var top = (screen.availHeight/2)-(height/2);
			
			var options = "width="+width+",height="+height+",left="+left+",top="+top;
			
			window.open(url, title, options);
		}		
	</script>
	<script>
		function validate(){
			return true;
		}
	
		$("#nicknameCheck").on('click', function(){
			
			var userNickname = $("[name=userNickname]");
			var isUsable =false;
			
			if(!userNickname || userNickname.val().length < 2){
				alert("닉네임은 최소 2자리 이상이어야 합니다.");
				userId.focus();
			} else {
				$.ajax({
					url : "${contextPath}/NicknameCheck",
					type : "post",
					data : { userNickname : userNickname.val() },
					success : function(result){
						console.log(result);
						if(result == "fail"){
							alert("사용할 수 없는 닉네임 입니다.");
							userNickname.focus();
						} else {
							if(confirm("사용 가능한 닉네임 입니다. 사용하시겠습니까?")){
								userNickname.attr('readonly', true);
								isUsable = true;
							} else {
								userNickname.attr('readonly', false);
								userNickname.focus();
								isUsable = false;
							}
						}
									
						if(isUsable){
							$("#joinBtn").removeAttr("disabled");
						} else {
							$("#joinBtn").attr("disabled", true);
						}
					},
					error : function(e){
						console.log(e);
					}
				});
			}			
		});
		
	</script>
	
	
</body>
</html>