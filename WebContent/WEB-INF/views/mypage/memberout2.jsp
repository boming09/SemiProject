<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.Member"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>
<style>
	.outer{
		width:90%;
		min-width : 450px;
		margin:auto;
		he
	}
	
	.outer h1 {
		text-align:center;
	}
	
	#searchIdForm {
		width : 300px;
		margin:auto;
	}
	
	.input_area {
	    border: solid 1px #dadada;
	    padding : 10px 10px 14px 10px;
	    background : white;
	    border-radius: 10px;
	}
	
	.input_area input:focus {
		outline: none;
	}
	
	.input_area input{
		width : 270px;
		height : 30px;
		border: 0px;
	}
	
	#userName{
		color : black;
		text-align : center;
		font-size : 15px;
	}
	
	#userId{
		text-align : center;
		font-size : 15px;
	}
	
	.btnArea {
		text-align:center;
		padding : 30px;
	}
	
	button:hover {
		cursor:pointer
	}
	
	button {
		width : 150px;
		height : 40px;
		border : 0px;
		border-radius: 10px;
		color:white;
		font-weight: bold;
		font-size: 20px;
		background:#497d42;
		margin : 5px;
		cursor : pointer;
	}
</style>
</head>
<body>
	<!-- 메뉴바 -->
	<%@ include file="/WEB-INF/views/common/menubar.jsp" %>    

	<div class="outerid">
	<h1 id="searchh1">회원탈퇴</h1>
	<!-- 
	<form id="updateSearchIdForm" action="<%= request.getContextPath() %>/password"
	method="post" onsubmit="return searchId();">
	 -->
			<div class="wrap">
				<div id="userId">정말로 회원 탈퇴하시겠습니까 ?<br>
				
				</div>
				
				<div class="btnArea">
				<button id="updatePwdBtn" onclick="confirmAccountDelete();">회원탈퇴</button>
				</div>
			</div>
	<!--  </form> -->
	</div>
	<!-- footer -->
	<jsp:include page="/WEB-INF/views/member/footer.jsp" />
	<script>
	function confirmAccountDelete(){
			if(confirm("정말로 탈퇴하시겠습니까?"))
				location.href='<%= request.getContextPath () %>/accountDelete';
		}
	</script>
</body>
</html>