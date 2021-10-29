<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SemiProject</title>
</head>
<body>
	<!-- 메뉴바 -->
	<%@ include file="/WEB-INF/views/common/menubar.jsp" %>
	
	
	<!-- 메인은 content wrapper로 영역 잡기!!! -->
	<div class="content wrapper">
		<!-- 메인/카테고리 -->
		<%@ include file="/WEB-INF/views/common/category.jsp" %>
		
		<!-- 메인 컨텐츠 -->
		<%@ include file="/WEB-INF/views/common/mainContents.jsp" %>
	
		<!-- 광고 -->
		<%@ include file="/WEB-INF/views/common/adArea.jsp" %>
	</div>	
	
	<!-- footer -->
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	
</body>
</html>