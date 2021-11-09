<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.replyList{
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
	width: 80px;
}

.board_ul:hover {
	background: #f3f5f7;
	cursor: pointer;
}
</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/menubar.jsp" />
<div class="csarea wrapper">
<jsp:include page="/WEB-INF/views/adminpage/adminCategory.jsp" />

<div class="replyList">
<br>
	<h2>문의 답변</h2>
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
			<c:forEach var="one" items="${ oneList }">
				<ul class="board_ul" onclick="oneDetailView(${one.oNo})">
					<li class="title">${ one.oTitle }</li>
					<li class="id">${ one.oId }</li>
					<li class="nickname">${ one.oNickName }</li>
					<li class="name">${ one.oName }</li>
					<li class="date">${ one.odate }</li>
					<li class="status">답변대기</li>
				</ul>
			</c:forEach>
	</div>
</div>


</div>



<script>
	function oneDetailView(oNo){
		location.href="${contextPath}/one/detail?one_no=" + oNo;
	}
</script>



</body>
</html>