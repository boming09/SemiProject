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
	    		<div class="loginArea">
		    		<div>
			        	<input type="text" class="textbox" 
			                id="loginid" name="userId" placeholder="아이디를 입력하세요" required>
			            <input type="password" class="textbox" 
			                id="loginps" name="userPwd" placeholder="비밀번호를 입력하세요" required>                  
		    		</div>
		    		
		       		 <input type="submit" id="lobut" value="로그인">
	    		</div>
	           	<div class="loginArea2">
		            <input type="checkbox" id="remember" name="remember">&nbsp;ID 또는 E-Mail 저장
                    <a href="id"><input type="button" value="아이디 찾기" class="idb"></a>
                    <a href="password"><input type="button" value="비밀번호 찾기" class="psb"></a>
	           	</div>
	           	<div class="loginArea2">
		            <a href="joinmembership"><input type="button" value="봄숲 간편 회원가입" class="mbjoin"></a>
	           	</div>
	            <div class="imgdiv">
	                <a href="#"><img class="naverlogo" src="<%= request.getContextPath() %>/resources/images/member/naverlogo.png" alt="naver logo"></a>   
	                <a href="kakaoLogin();"><img class="kakaologo" src="<%= request.getContextPath() %>/resources/images/member/kakaologo.png" alt="kako logo"></a>
	            </div>
	            <div id="kakaoLogin">  
				    <a id="kakao-login-btn"></a>
				    <a href="http://developers.kakao.com/logout">
				    <img class="kakaologo" src="<%= request.getContextPath() %>/resources/images/member/kakaologo.png" alt="kako logo"></a>
				</div>       
	        </from>
		</div>
	</div>
    <!-- footer -->
	<jsp:include page="/WEB-INF/views/member/footer.jsp" />
	<!-- 쿠키 사용하여 아이디 기억하기 기능 -->
	<scripit src="<%= request.getContextPath() %>/resources/js/login/rememberUserId.js"></scripit>	
	
	<!-- 카카오 간편로그인 -->
	<!-- 
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
	 -->
	 
	 <script type='text/javascript'>
    // 사용할 앱의 JavaScript 키를 설정해 주세요.
    Kakao.init('javascript key');
    // 카카오 로그인 버튼을 생성합니다.
    Kakao.Auth.createLoginButton({
      container: '#kakao-login-btn',
      success: function(authObj) {
          
          //로그인 성공시, kakao API를 호출한다.(카카오에 있는 데이터 불러옴)
          Kakao.API.request({
              url: '/v2/user/me',
              success: function(res){
                  console.log(res);
                  console.log(res.id);
                  console.log(res.kakao_account);
                  console.log(JSON.stringify(res.properties.nickname));
                  console.log(JSON.stringify(res.kakao_account.email));
                  console.log(JSON.stringify(res.kakao_account.gender));
                  console.log(JSON.stringify(res.kakao_account.birthday));
                 $.ajax({
                    url:"<%=request.getContextPath()%>/member/kakaoLogin",
                    data:{"id":res.id, "name":JSON.stringify(res.properties.nickname)},
                    Type:"post",
                    success:function(data){
                        //성공적으로 하고나면 이동할 url
                        location.href="<%=request.getContextPath()%>/";
                    }
                    
                 });
              },
              fail: function(error){
                  alert(JSON.stringify(error));
              }
          });
         //접속된 회원의 토큰값 출력됨
        //alert(JSON.stringify(authObj));
        
      },
      fail: function(err) {
         alert(JSON.stringify(err));
      }
    });
</script>
</body>
</html>
