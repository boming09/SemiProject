<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://unpkg.com/ress/dist/ress.min.css">
<!-- 외부 스타일 시트 -->
<link href="${ contextPath }/resources/css/writer/wMyUnreviewNone.css" rel="stylesheet">
<title>MY 도서</title>
</head>
<body>
	<!-- 메뉴바 -->
	<jsp:include page="/WEB-INF/views/common/menubar.jsp" />
	
	<div class="csarea wrapper">
		<!-- cs 카테고리 -->
		<jsp:include page="/WEB-INF/views/writer/wmyCategory.jsp" />
		
		<div class="content">
		    <header class="wcommu_header">
		        <div>MY 도서</div>
                <div class="wcommu_commu">
                     <button onclick="location.href='${ contextPath }/w-mybook'">도서 리스트</button>
                </div>
		    </header>
		    
		    <div class="wcommu_none_ment">
		        <span class="none_span1">MY 도서  미답변 리뷰 내역이 없습니다.</span>
		        <span class="none_span2">도서리스트에서 전체 리뷰를 확인해 보세요.</span>
		    </div>
		</div>
		<!-- 광고  -->
		<jsp:include page="/WEB-INF/views/common/adArea.jsp" />
	</div>
	
	<!-- footer -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />

</body>
</html>