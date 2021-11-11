<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.Member"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
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
	<div class="outer">
	<h1>아이디 찾기</h1>
	
	<form id="updateSearchIdForm" action="<%= request.getContextPath() %>/searchid"
	method="post" onsubmit="return searchId();">
			<div class="wrap">
				<div id="userId">${ loginUser.userName }님의 아이디는 ${ member.userId } 입니다.</div>
				
				<div class="btnArea">
				<button id="updatePwdBtn" onclick="location.href='/views/member/password.jsp'">비밀번호 찾기</button>
				</div>
			</div>
	</form>
	</div>
	<!-- 
	<script>
		function searchId(){
			var userName = document.getElementById("userName").value;
			var userEmail = document.getElementById("userEmail").value;
			if(userName == "" && userEmail == ""){
				alert("이름과 이메일을 입력해주세요.")
				return;
			}
			
			var url = "/id";
			
			var title="searchId";
			
			var status = "left=50%, top=50%, height=400px, menubar-no, status=no, scrollbar=yes";
			
			var popup = window.open("", title, status);
			
			searchFrm.userName.value=userName;
			searchFrm.userEmail.value=userEmail;
			
			searchFrm.target = title;
			searchFrm.action = url;
			searchFrm.method="post";
			
			searchFrm.submit();			
		}
	</script>	
	 -->
</body>
</html>