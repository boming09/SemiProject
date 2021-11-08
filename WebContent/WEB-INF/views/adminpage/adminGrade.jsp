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
	border: 3px solid rgb(196, 217, 195);
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

.board_list .pwd {
	width: 100px;
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
	width: 80px;
}

.board_ul:hover {
	background: #f3f5f7;
	cursor: pointer;
}

.board_paging {
	height: 50px;
	line-height: 50px;
	display: flex;
	justify-content: center;
	list-style: none;
	width: 480px;
	margin: auto;
}

.board_paging a {
	text-decoration: none;
	color: #282A35;
	width: 40px;
	display: block;
	text-align: center;
}

.board_paging a.current_page {
	border-bottom: 2px solid #282A35;
	font-weight: bold;
}

.search_area {
	text-align: center;
	padding: 30px;
}

.search_area select {
	width: 150px;
	height: 30px;
	border: 0px;
}

.input_area {
	border: solid 1px #dadada;
	padding: 10px 10px 14px 10px;
	margin-right: 20px;
	background: white;
}

.input_area input {
	width: 250px;
	height: 30px;
	border: 0px;
}

.input_area input:focus, .search_area select:focus {
	outline: none;
}

.search_area button {
	width: 100px;
	height: 35px;
	border: 0px;
	color: white;
	background: #282A35;
	margin: 5px;
}
</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/menubar.jsp" />
<div class="csarea wrapper">
<jsp:include page="/WEB-INF/views/adminpage/adminCategory.jsp" />

<div class="gradeList">
<br>
	<h2>등급 관리</h2>
<br>
	<hr />
	<div class="board_list">
				<ul class="board_header">
					<li class="id">아이디</li>
					<li class="pwd">비밀번호</li>
					<li class="name">이름</li>
					<li class="gender">성별</li>
					<li class="address">주소</li>
					<li class="phone">전화번호</li>
					<li class="date">가입일</li>
					<li class="status">회원등급</li>
				</ul>
			<hr />
				<ul class="board_ul">
					<li class="id">admin</li>
					<li class="pwd">admin</li>
					<li class="name">관리자</li>
					<li class="gender">남</li>
					<li class="address">서울시 양천구 목동 어쩌고 저쩌고</li>
					<li class="phone">010-1212-3434</li>
					<li class="date">2021-11-04</li>
					<li class="status"></li>
				</ul>
				<ul class="board_ul">
					<li class="id">admin</li>
					<li class="pwd">admin</li>
					<li class="name">관리자</li>
					<li class="gender">남</li>
					<li class="address">서울시 양천구 목동 어쩌고 저쩌고</li>
					<li class="phone">010-1212-3434</li>
					<li class="date">2021-11-04</li>
					<li class="status"></li>
				</ul>
				<ul class="board_ul">
					<li class="id">admin</li>
					<li class="pwd">admin</li>
					<li class="name">관리자</li>
					<li class="gender">남</li>
					<li class="address">서울시 양천구 목동 어쩌고 저쩌고</li>
					<li class="phone">010-1212-3434</li>
					<li class="date">2021-11-04</li>
					<li class="status"></li>
				</ul>
				<ul class="board_ul">
					<li class="id">admin</li>
					<li class="pwd">admin</li>
					<li class="name">관리자</li>
					<li class="gender">남</li>
					<li class="address">서울시 양천구 목동 어쩌고 저쩌고</li>
					<li class="phone">010-1212-3434</li>
					<li class="date">2021-11-04</li>
					<li class="status"></li>
				</ul>
				<ul class="board_ul">
					<li class="id">admin</li>
					<li class="pwd">admin</li>
					<li class="name">관리자</li>
					<li class="gender">남</li>
					<li class="address">서울시 양천구 목동 어쩌고 저쩌고</li>
					<li class="phone">010-1212-3434</li>
					<li class="date">2021-11-04</li>
					<li class="status"></li>
				</ul>
				<ul class="board_ul">
					<li class="id">admin</li>
					<li class="pwd">admin</li>
					<li class="name">관리자</li>
					<li class="gender">남</li>
					<li class="address">서울시 양천구 목동 어쩌고 저쩌고</li>
					<li class="phone">010-1212-3434</li>
					<li class="date">2021-11-04</li>
					<li class="status"></li>
				</ul>
				<ul class="board_ul">
					<li class="id">admin</li>
					<li class="pwd">admin</li>
					<li class="name">관리자</li>
					<li class="gender">남</li>
					<li class="address">서울시 양천구 목동 어쩌고 저쩌고</li>
					<li class="phone">010-1212-3434</li>
					<li class="date">2021-11-04</li>
					<li class="status"></li>
				</ul>
				<ul class="board_ul">
					<li class="id">admin</li>
					<li class="pwd">admin</li>
					<li class="name">관리자</li>
					<li class="gender">남</li>
					<li class="address">서울시 양천구 목동 어쩌고 저쩌고</li>
					<li class="phone">010-1212-3434</li>
					<li class="date">2021-11-04</li>
					<li class="status"></li>
				</ul>
				<ul class="board_ul">
					<li class="id">admin</li>
					<li class="pwd">admin</li>
					<li class="name">관리자</li>
					<li class="gender">남</li>
					<li class="address">서울시 양천구 목동 어쩌고 저쩌고</li>
					<li class="phone">010-1212-3434</li>
					<li class="date">2021-11-04</li>
					<li class="status"></li>
				</ul>
				<ul class="board_ul">
					<li class="id">admin</li>
					<li class="pwd">admin</li>
					<li class="name">관리자</li>
					<li class="gender">남</li>
					<li class="address">서울시 양천구 목동 어쩌고 저쩌고</li>
					<li class="phone">010-1212-3434</li>
					<li class="date">2021-11-04</li>
					<li class="status"></li>
				</ul>
				<ul class="board_ul">
					<li class="id">admin</li>
					<li class="pwd">admin</li>
					<li class="name">관리자</li>
					<li class="gender">남</li>
					<li class="address">서울시 양천구 목동 어쩌고 저쩌고</li>
					<li class="phone">010-1212-3434</li>
					<li class="date">2021-11-04</li>
					<li class="status"></li>
				</ul>
				<ul class="board_ul">
					<li class="id">admin</li>
					<li class="pwd">admin</li>
					<li class="name">관리자</li>
					<li class="gender">남</li>
					<li class="address">서울시 양천구 목동 어쩌고 저쩌고</li>
					<li class="phone">010-1212-3434</li>
					<li class="date">2021-11-04</li>
					<li class="status"></li>
				</ul>
				<ul class="board_ul">
					<li class="id">admin</li>
					<li class="pwd">admin</li>
					<li class="name">관리자</li>
					<li class="gender">남</li>
					<li class="address">서울시 양천구 목동 어쩌고 저쩌고</li>
					<li class="phone">010-1212-3434</li>
					<li class="date">2021-11-04</li>
					<li class="status"></li>
				</ul>
				<ul class="board_ul">
					<li class="id">admin</li>
					<li class="pwd">admin</li>
					<li class="name">관리자</li>
					<li class="gender">남</li>
					<li class="address">서울시 양천구 목동 어쩌고 저쩌고</li>
					<li class="phone">010-1212-3434</li>
					<li class="date">2021-11-04</li>
					<li class="status"></li>
				</ul>
				
			<div style="position: static;">
				<hr />
				<ul class="board_paging">
				<!-- 맨 처음으로 이동하는 버튼(<<) -->	
				<li><a href="">&lt;&lt;</a></li>
				
				<!-- 이전 페이지로(<) -->
				<li>
				<c:choose>
					<c:when test=""><a href="">&lt;</a></c:when>
					<c:otherwise><a href="#">&lt;</a></c:otherwise>
				</c:choose>
				</li>
				
				
				
				
				<!-- 다음 페이지로(>) -->
				<li>
				<c:choose>
					<c:when test=""><a href="">&gt;</a></c:when>
					<c:otherwise><a href ="#">&gt;</a></c:otherwise>
				</c:choose>
				</li>
				
				<!-- 맨 끝으로 이동하는 버튼(>>) -->
            	<li><a href="">&gt;&gt;</a></li>
				</ul>
			</div>
	</div>
</div>









</div>
</body>
</html>