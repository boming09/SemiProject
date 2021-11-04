<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bomsoup login</title>
    <link rel="stylesheet" href="https://unpkg.com/ress/dist/ress.min.css">
    <!-- favicon (Real Favicon Generator 등에서 가공 필요) -->
    <link rel="icon" type="image/x-icon" href="resources/image/khfavicon.ico">
    <!-- 외부 스타일 시트 -->
    <link href="<%= request.getContextPath() %>/resources/css/member/login-style.css" rel="stylesheet">    
</head>
<body>    
	<!-- 메뉴바 -->
	<%@ include file="/WEB-INF/views/common/menubar.jsp" %>
	<div class="wrapper">
		<div class="outer">
	    	<form class="lofd" action="<%= request.getContextPath() %>/login"
	    	method="post">
	        	<input type="text" class="textbox" 
	                id="loginid" name="userId" placeholder="아이디를 입력하세요" required>
	            <input type="password" class="textbox" 
	                id="loginps" name="userPwd" placeholder="비밀번호를 입력하세요" required><br>                  
	            <input type="checkbox" id="loemailcheck" name="loemailcheck" 
	                    value="loemailcheck" checked="checked">ID 또는 E-Mail 저장
	                    <a href="id"><input type="button" value="아이디 찾기" class="idb"></a>
	                    <a href="password"><input type="button" value="비밀번호 찾기" class="psb"></a>
	              
	            <a href="joinmembership"><input type="button" value="봄숲 간편 회원가입" class="mbjoin"></a><br>
	            <div class="imgdiv">
	                <a href="kakaoLogin();"><img class="naverlogo" src="<%= request.getContextPath() %>/resources/images/member/naver.jpg" alt="naver logo"></a>   
	                <a href="#"><img class="kakaologo" src="<%= request.getContextPath() %>/resources/images/member/kakao.jpg" alt="kako logo"></a>
	            </div>             
	        <input type="submit" id="lobut" value="로그인">
	        </from>
		</div>
	</div>
    <!-- footer -->
	<jsp:include page="/WEB-INF/views/member/footer.jsp" />
	<!-- 카카오 간편로그인 -->
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	<script>
		// dfeffb0d0cd1f04335779fda1d08bc4f
		window.Kakao.init("dfeffb0d0cd1f04335779fda1d08bc4f");
		
		function kakaoLogin(){
			window.Kakao.Auth.login({
				scope: 'profile, account_email, gender',
				success: function(authObj){
					console.log(authObj);
					window.Kakao.API.request({
						url:'/v2/user/me',
						success: res => {
							const kakao_account = res.kakao_account;
							console.log(kakao_account)
						}
					});
				}
			});
		}
	</script>
</body>
</html>
