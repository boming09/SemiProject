<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.stockList{
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
.board_header {
	background: #282A35;
	color: white;
	font-weight: bold;
}
.board_list>ul {
	border-bottom: 1px solid #f3f5f7;
	height: 35px;
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
.board_list .book {
	width: 550px;
	overflow: hidden;
	text-overflow: ellipsis;
	text-align: center;
}

.board_list .stock {
	width: 80px;
	overflow: hidden;
	text-overflow: ellipsis;
	text-align: left;
}

.board_list .plus {
	width: 130px;
	text-align: center;
	display: flex;
}
</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/menubar.jsp" />
<div class="csarea wrapper">
<jsp:include page="/WEB-INF/views/adminpage/adminCategory.jsp" />

<div class="stockList">
<br>
	<h2>재고 추가</h2>
<br>
	<hr />
	<div class="board_list">
		<ul class="board_header">
			<li class="book">책 목록</li>
			<li class="stock">재고</li>
			<li class="plus">추가</li>
		</ul>
		<hr />
		<ul class="board_ul">
			<li class="book">
				<select name="category" onchange="bselectTest(this.value);" style="background: rgb(196, 217, 195); text-align: center; border: 1px solid black; width: 250px; font-weight: bold; margin-left: 5px;" required>
						<option value="" hidden>책 목록▼</option>
						<c:forEach var="c" items="${bookList}">
							<option value="${c.bid}">${c.btitle}</option>
						</c:forEach>
				</select>
			</li>
			<li class="stock">
				<input name="stockBB" type="text" readonly value="">
			</li>
			<form method="post" action="${ contextPath }/admin/stockinsert">
			<input type="hidden" name="stockId" value="">
			<li class="plus">
			<input type="number" name="pstock" style="width: 70px; border: 1px solid black;">
			<input type="submit" style="border: 1px solid black; margin-left: 3px;" value="등록">
			</li>
			</form>
		</ul>
	</div>
	
	
	
	
	
	
</div>








</div>
<script>
	
	function bselectTest(obj){
		var $target = $("input[name=stockBB]");
		var $targetid = $("input[name=stockId]");
		$.ajax({
			url : "${ pageContext.servletContext.contextPath }/admin/stockajax",
			data : { bNo : obj },
			dataType : "json",
			type : "get",
			success : function(stock){
				$target.val(stock.stock + '권');
				$targetid.val(stock.bid);
			},
			error : function(e){
				console.log(e);
			}
		});
	}
	
	
	
	
</script>
</body>
</html>