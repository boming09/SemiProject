<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin Page</title>
<link rel="stylesheet" href="https://unpkg.com/ress/dist/ress.min.css">
<link href="<%= request.getContextPath() %>/resources/css/adminPage.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/menubar.jsp" />
	<div class="csarea wrapper">
	<jsp:include page="/WEB-INF/views/adminpage/adminCategory.jsp" />
	</div>
</body>
</html>