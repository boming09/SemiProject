<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.insertList{
	position: absolute;
	display: inline-block;
	width: 800px;
	height: 600px;
	border: 3px solid rgb(196, 217, 195);
	justify-content: center;
	left: 30%;
	right: 30%;
	margin: 10px;
}
hr{
	border: 1px solid rgb(196, 217, 195);
}
.board_content{
	border: solid 1px #dadada;
	padding: 10px 10px 14px 10px;
	background: black;
	color: white;
}
.board_content .content {
	margin-bottom: 5px;
}
.input_content{
	margin: 20px;
	background: white;
	border: 1px solid white;
	display: inherit;
}
.title_span{
	
}
</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/menubar.jsp" />

<br>
	<h2>책 등록</h2>
<br>
	<hr />
<div class="insertList">
	<div class="board_content">
		<form>	
			<div class="content">
				<h4>
					<span class="title_span">&nbsp;</span> 도서 명
				</h4>
				<span class="input_content"> <input type="text" name="title"
					required>
				</span>
			</div>
		</form>
	</div>
</div>
</body>
</html>