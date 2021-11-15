<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://unpkg.com/ress/dist/ress.min.css">
<!-- 외부 스타일 시트 -->
<link href="${ contextPath }/resources/css/mypage/mypage-orderNone.css" rel="stylesheet">
<title>마이페이지-주문내역</title>
</head>
<body>
	<!-- 메뉴바 -->
	<jsp:include page="/WEB-INF/views/common/menubar.jsp" />
	
	<div class="csarea wrapper">
		
		<%@ include file="/WEB-INF/views/mypage/mypage-category.jsp" %>		
		<div class="content">
		    <header class="wcommu_header">
		        <div>주문조회</div>
		    </header>
		    
		    <div class="wcommu_none_ment">
		        <span class="none_span1">주문하신 내역이 없습니다.</span>
		        <span class="none_span2">봄숲에서 원하시는 도서를 구매해 보세요.</span>
		    </div>
		</div>
		<!-- 광고  -->
		<jsp:include page="/WEB-INF/views/common/adArea.jsp" />
	</div>
	
	<!-- footer -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />

</body>
</html>