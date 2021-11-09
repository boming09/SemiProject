<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.gradeList{
	position: inherit;
	text-align: center;
	display: inline-block;
	width: 90vh;
	height: 60vh;
	margin: 5px;
}
hr{
	border: 1px solid rgb(196, 217, 195);
}
.board_list {
	margin: 3px 5px;
	min-height: 600px;
}

.board_list>ul {
	border-bottom: 1px solid #f3f5f7;
	height: 30px;
	line-height: 30px;
	display: flex;
	justify-content: space-around;
	list-style: none;
}

.board_list>ul.last {
	border: 0;
}

.board_list>ul>li {
	text-align: left;
	border-right: 1px solid rgb(196, 217, 195);
}

.board_list>ul>li:last-child {
	border-right: none;
}

.board_header {
	background: #282A35;
	color: white;
	font-weight: bold;
}

.board_list .id {
	width: 100px;
	overflow: hidden;
	text-overflow: ellipsis;
}

.board_list .nickname {
	width: 90px;
	overflow: hidden;
	text-overflow: ellipsis;
}

.board_list .name {
	width: 70px;
}

.board_list .gender {
	width: 40px;
}

.board_list .title {
	width: 230px;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}

.board_list .phone {
	width: 120px;
}

.board_list .date {
	width: 80px;
}

.board_list .status {
	width: 100px;
}
</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/menubar.jsp" />
<div class="csarea wrapper">
<jsp:include page="/WEB-INF/views/adminpage/adminCategory.jsp" />

	<div class="gradeList">
<br>
	<h2>등업 신청</h2>
<br>
	<hr />
	<div class="board_list">
				<ul class="board_header">
					<li class="title">제목</li>
					<li class="id">아이디</li>
					<li class="nickname">닉네임</li>
					<li class="name">이름</li>
					<li class="date">등록일</li>
					<li class="status">상태</li>
				</ul>
			<hr />
			<c:forEach var="grade" items="${ gradeList }">
				<ul class="board_ul">
					<li class="title">${ grade.title }</li>
					<li class="id">${ grade.userId }</li>
					<li class="nickname">${ grade.userNickName }</li>
					<li class="name">${ grade.userName }</li>
					<li class="date">${ grade.create_date }</li>
					<li class="status">
					<form method="post" action="${contextPath}/admin/gradeupdate">
						<input type="hidden" name="wNo" value="${ grade.wNo }">
						<input type="hidden" name="uNo" value="${ grade.uNo }">
						<select name="statusa" style="border: 1px solid rgb(196, 217, 195);">
							<option value="1" selected hidden>등업신청</option>
							<option value="10">승인</option>
							<option value="20">거부</option>
						</select>
						<button input type="submit" style="border: 1px solid rgb(196, 217, 195); border-radius: 10px;">변경</button>						
					</form>
					</li>
					
				</ul>
			</c:forEach>
	</div>
</div>


</div>
</body>
</html>