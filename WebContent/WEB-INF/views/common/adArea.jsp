<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ad Area</title>
<style>
	.ad_area {
		width : 10%;
		display : block;
		height : 500px;
	}
	
	.ad_area img {
		display : block;
		width : 100%;
		height : 160px;
		border : 1px solid lightgray;
		margin-bottom : 5px;
		
	}
</style>
</head>
<body>
	<div class="ad_area">
		<img id="ad1" src="<%= request.getContextPath() %>/resources/images/ad2.png">
		<img id="ad2" src="<%= request.getContextPath() %>/resources/images/ad4.png">
		<img id="ad3" src="<%= request.getContextPath() %>/resources/images/ad5.png">
	</div>
</body>
</html>