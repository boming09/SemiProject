<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String msg = (String)request.getAttribute("message");
%>
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
    <link href="<%= request.getContextPath() %>/resources/css/member/login-style.css" rel="stylesheet">    
</head>
<body>    
	<!-- 메뉴바 -->
	<%@ include file="/WEB-INF/views/common/menubar.jsp" %>
	<div id="errorcenter">
		<div id="imageArea">
			<img id="errorImage"
			src="<%= request.getContextPath() %>/resources/images/logo.png">
		</div>
	<h1 id="msgArea"><%= msg %></h1>
	</div>
	<br><br><br>
    <!-- footer -->
	<jsp:include page="/WEB-INF/views/member/footer.jsp" />
</body>
</html>
