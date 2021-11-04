<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<a href=""><img src="<%= request.getContextPath() %>/resources/images/member/kakao.jpg"></a>
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