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
<link rel="icon" type="image/x-icon"
	href="resources/image/khfavicon.ico">
<!-- 외부 스타일 시트 -->
<link href="<%= request.getContextPath() %>/resources/css/mypage/memberout.css"
	rel="stylesheet">
</head>
<body>
	<!-- 메뉴바 -->
	<%@ include file="/WEB-INF/views/common/menubar.jsp"%>

	<div class="csarea wrapper">
		<!-- mypage-category 카테고리 추가 -->
		<%@ include file="/WEB-INF/views/mypage/mypage-category.jsp"%>
		<!-- 헤더 div -->
		<div class="content">
			<div class="hd1">
				<header>
					<h3>회원탈퇴</h3>
					<br>
					<ul class="heul">
						<li id="hi1li1">회원 탈퇴시 적립금, 예치금, 쿠폰, 마일리지, 봄숲 상품권 등의 통장이 자동삭제
							됩니다</li>
						<li id="hi1li2">출고 이전 주문이 있을 경우 상품 배송처리 문제로 탈퇴 불가능 합니다(주문 취소
							혹은 출고 이후 탈퇴 가능)</li>
						<li id="hi1li3">고객님의 거래내역은 전자상거래 등에서의 소비자보호에 관한 법류 제 6조 및 동법
							시행령 제 6조에 의거하여 표시 및 광고에 관한 기록은 6월,<br>계약 또는 청약 철회 등에 관한 기록은
							5년, 대금결제 및 재화 공급 등의 공급에 관한 기록은 5년, 소비자 불만 또는 분쟁처리에 관한 기록은 3년간
							기록됩니다.
						</li>
					</ul>
					<br>
					<p>
						<img class="warnign"
							src="<%= request.getContextPath() %>/resources/images/mypage/warning.png"
							alt="warning"> 로그인할 때 사용하시는 이메일 주소를 직접 변경할 수 있습니다. <input
							type="button" id="emailbut" value="이메일주소 변경하기">
					</p>
					<br>
				</header>
			</div>
			<div class="topline"></div>
			<!-- center div -->
			<br>
			<h4 class="h4go">
				고객님께서 느끼신 봄숲의 부족한 점을 지적해 주세요.<br> 소중하게 반영하겠습니다.
			</h4>
			<br>
			<div class="center">
				<div class="temp-box-left">
					<label>1. 상품관련</label>
				</div>
				<div class="temp-box-right">
					<div class="rightdiv">
						<input type="checkbox"> 가격불만
					</div>
					<div class="rightdiv">
						<input type="checkbox"> 상품 품질 불만
					</div>
					<div class="rightdiv">
						<input type="checkbox"> 찾는 상품 없음
					</div>
					<div class="rightdiv">
						<input type="checkbox"> 상품 정보 부족
					</div>
					<div class="rightdiv">
						<input type="checkbox"> 그외
					</div>
				</div>
				<div class="temp-box-left">
					<label>2. 서비스 관련</label>
				</div>
				<div class="temp-box-right">
					<div class="rightdiv">
						<input type="checkbox"> 결제불안
					</div>
					<div class="rightdiv">
						<input type="checkbox"> 회원 특혜 부족
					</div>
					<div class="rightdiv">
						<input type="checkbox"> 불친절
					</div>
					<div class="rightdiv">
						<input type="checkbox"> 배송 상태 불안
					</div>
					<div class="rightdiv">
						<input type="checkbox"> 배송 시간 지연
					</div>
					<div class="rightdiv">
						<input type="checkbox"> 사이트 불편
					</div>
					<div class="rightdiv">
						<input type="checkbox"> 컨텐츠 불만
					</div>
					<div class="rightdiv">
						<input type="checkbox"> 그외
					</div>
				</div>
				<div class="temp-box-left">
					<label>3. 시스템/기타</label>
				</div>
				<div class="temp-box-right">
					<div class="rightdiv">
						<input type="checkbox"> 시스템 에러
					</div>
					<div class="rightdiv">
						<input type="checkbox"> 상품 검색 불편
					</div>
					<div class="rightdiv">
						<input type="checkbox"><label class="sizeplz">개인정보 & 불안 보안</label>
					</div>
					<div class="rightdiv">
						<input type="checkbox"> 유명도가 낮아서
					</div>
					<div class="rightdiv">
						<input type="checkbox"><label class="sizeplz">봄숲은 사용하지 않음</label>
					</div>
					<div class="rightdiv">
						<input type="checkbox"> 그외
					</div>
				</div>
				<div class="temp-box-left">
					<label>4. 봄숲에 한마디<br>부탁 드립니다.
					</label>
				</div>
				<div class="temp-box-right1">
					<input type="textarea" id="ta">
				</div>
			</div>
			<br> <label class="end">탈퇴하시면 봄숲과 봄숲마켓에서 동시에 계정이 삭제되며,
				나의 계정과 나의 서재 등</label><br> <label class="end">모든 DB가 자동 삭제 됩니다.
				신중하게 선택해 주세요.</label> <br>
			<br>
			<!-- 비밀번호 확인후 탈퇴하기 가능 하면 만들고  못할거 같으면 삭제하고 
				  탈퇴하기 클릭시 탈퇴가능하게 만들예정. -->
			<div class="h5go">
				<h4 class="h5go">
					비밀번호 : <input type="password" id="out"> 
					<button id="deleteBtn" type="button"
					onclick="confirmAccountDelete();">탈퇴하기</button>
				</h4>
			</div>
			<br>
		</div>

		<!-- 광고  -->
		<%@ include file="/WEB-INF/views/common/adArea.jsp"%>
	</div>
	<!-- footer -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	<script>
	function confirmAccountDelete(){
			if(confirm("정말로 탈퇴하시겠습니까?"))
				location.href='<%= request.getContextPath () %>/accountDelete';
		}
	</script>
</body>
</html>