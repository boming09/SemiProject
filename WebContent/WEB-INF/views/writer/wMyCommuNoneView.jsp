<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://unpkg.com/ress/dist/ress.min.css">
<!-- 외부 스타일 시트 -->
<link href="${ contextPath }/resources/css/writer/wMyCommuNone.css" rel="stylesheet">
<title>MY 소통게시판</title>
</head>
<body>
	<!-- 메뉴바 -->
	<jsp:include page="/WEB-INF/views/common/menubar.jsp" />
	
	<div class="csarea wrapper">
		<!-- cs 카테고리 -->
		<jsp:include page="/WEB-INF/views/writer/wmyCategory.jsp" />
		
		<div class="content">
		    <header class="wcommu_header">
		        <div>MY 소통게시판</div>
                <div class="wcommu_commu">
                    <button onclick="location.href='${ contextPath }/commu'">전체<br>소통게시판</button>
                </div>
		    </header>
		    
		    <div class="wcommu_none_ment">
		        <span class="none_span1">소통게시판 미답변 게시글 내역이 없습니다.</span>
		        <span class="none_span2">전체 소통게시판을 이용해 보세요.</span>
		    </div>
		</div>
		<!-- 광고  -->
		<jsp:include page="/WEB-INF/views/common/adArea.jsp" />
	</div>
	
	<!-- footer -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />

</body>
</html>