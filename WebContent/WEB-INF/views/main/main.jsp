<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="main.model.vo.Recommend"%>
<%
	Recommend recommend = (Recommend)session.getAttribute("recommend");
			
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SemiProject</title>
<style>
.wrapper2 {
	max-width: 1100px;
	margin: 0 auto;
	height: 80vh;
}
</style>
</head>
<body>
	<!-- 메뉴바 -->
	<%@ include file="/WEB-INF/views/common/menubar.jsp" %>
	
	
	<!-- 메인은 content wrapper로 영역 잡기!!! -->
	<div class="content wrapper2">
		<!-- 메인/카테고리 -->
		<%@ include file="/WEB-INF/views/common/category.jsp" %>

		<!-- 메인 컨텐츠 -->
		<%@ include file="/WEB-INF/views/common/mainContents2.jsp" %>
		<!-- 광고 -->
		<%@ include file="/WEB-INF/views/common/adArea.jsp" %>
	</div>	
	<!-- footer -->
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>

</body>
</html>