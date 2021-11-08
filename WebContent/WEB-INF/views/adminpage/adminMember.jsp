<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.memberList{
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
	width: 50px;
}

.board_list .gender {
	width: 40px;
}

.board_list .address {
	width: 150px;
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

<div class="memberList">
<br>
	<h2>탈퇴 신청</h2>
<br>
	<hr />
	<div class="board_list">
				<ul class="board_header">
					<li class="id">아이디</li>
					<li class="nickname">닉네임</li>
					<li class="name">이름</li>
					<li class="gender">성별</li>
					<li class="address">주소</li>
					<li class="phone">전화번호</li>
					<li class="date">가입일</li>
					<li class="status">관리</li>
				</ul>
			<hr />
			<c:forEach var="board" items="${ adminMemberList }">
				<ul class="board_ul">
					<li class="id"></li>
					<li class="nickname"></li>
					<li class="name"></li>
					<li class="gender"></li>
					<li class="address"></li>
					<li class="phone"></li>
					<li class="date"></li>
					<form method="get" action="${ contextPath }">
					<li class="status">
						<select name="statusa" style="border: 1px solid rgb(196, 217, 195);">
							<option selected>탈퇴신청</option>
							<option value="10">신청취소</option>
							<option value="20">탈퇴</option>
						</select>
						<button input type="submit" style="border: 1px solid rgb(196, 217, 195); border-radius: 10px;">변경</button>						
					</li>
					</form>
				</ul>
			</c:forEach>
	</div>
</div>








</div>
</body>
</html>