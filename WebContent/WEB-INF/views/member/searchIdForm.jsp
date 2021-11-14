<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.Member"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 삭제 처리</title>
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
			<%
        String id= (String)session.getAttribute("sessionID"); 
        String pw = request.getParameter("password");
        
        // 세션에서 아이디를, DeleteForm.jsp에서 입력받은 비밀번호를 가져온다.
        // 가져온 결과를 가지고 회원정보를 삭제한다. - 삭제결과를 반환
        Member member = new Member();
        member = MemberService().deleteMember(id, pw);
        
        if(member == 1){
            session.invalidate(); // 삭제했다면 세션정보를 삭제한다.
    %>
        <br><br>
        <b><font size="4" color="gray">회원정보가 삭제되었습니다.</font></b>
        <br><br><br>
    
        <input type="button" value="확인" onclick="javascript:window.location='index.jsp'">
    
    <%    
         // 비밀번호가 틀릴경우 - 삭제가 안되었을 경우
        }else{
    %>
        <script>
            alert("비밀번호가 맞지 않습니다.");
            history.go(-1);
        </script>
    <%
        } 
    %>
	<!--  </form> -->
	</div>
	<!-- footer -->
	<jsp:include page="/WEB-INF/views/member/footer.jsp" />
</body>
</html>