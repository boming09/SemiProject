<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.reList{
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

.board_list .amount {
	width: 60px;
}

.board_list .title {
	width: 230px;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
	text-align: center;
}


.board_list .status {
	width: 160px;
	text-align: center;
}
</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/menubar.jsp" />
<div class="csarea wrapper">
<jsp:include page="/WEB-INF/views/adminpage/adminCategory.jsp" />

	<div class="reList">
<br>
	<h2>환불 관리</h2>
<br>
	<hr />
	<div class="board_list">
				<ul class="board_header">
					<li class="id">아이디</li>
					<li class="nickname">닉네임</li>
					<li class="name">이름</li>
					<li class="title">상품명</li>
					<li class="amount">수량</li>
					<li class="status">상태</li>
				</ul>
			<hr />
			
			<c:forEach var="refund" items="${ refundList }">
				<ul class="board_ul">
					<li class="id">${refund.userId }</li>
					<li class="nickname">${refund.userNickName }</li>
					<li class="name">${refund.userName }</li>
					<li class="title">${refund.bookName }</li>
					<li class="amount">${refund.amount }</li>
					<li class="status">
					<form method="post" action="${contextPath}/admin/refundupdate">
					<input type="hidden" name="oNo" value="${refund.orderNo }">
						<select name="statusa" style="border: 1px solid rgb(196, 217, 195);">
						<c:choose>
						<c:when test='${refund.orderChange eq 10}'>
							<option value="" selected hidden>주문 취소 대기</option>
							<option value="1">취소 완료</option>
							</c:when>
							<c:when test='${refund.orderChange eq 20}'>
							<option value="" selected hidden>주문 교환 대기</option>
							<option value="1">교환 완료</option>
							</c:when>
							<c:when test='${refund.orderChange eq 30}'>
							<option value="" selected hidden>주문 반품 대기</option>
							<option value="1">반품 완료</option>
							</c:when>
						</c:choose>
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