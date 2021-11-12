<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bomsoup login</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://unpkg.com/ress/dist/ress.min.css">
    <!-- favicon (Real Favicon Generator 등에서 가공 필요) -->
    <link rel="icon" type="image/x-icon" href="resources/image/khfavicon.ico">
    <!-- 외부 스타일 시트 -->
    <link href="<%= request.getContextPath() %>/resources/css/member/login-style.css" rel="stylesheet">
</head>
<body>
	<!-- 메뉴바 -->
	<%@ include file="/WEB-INF/views/common/menubar.jsp" %>    
        
        <form name="searchFrm">
        	<input type="hidden" name="userName">
        	<input type="hidden" name="userEmail">
        </form>
        <div class="id0">
        <div class="id1">
            	<h1 id="emailh1">아이디 찾기</h1>
            <div class="id2">
                <ul> 
                    <li>봄숲 에서는 E-Mail주소로 로그인할 수 있습니다.<br></li>
                    <li>이름과 E-Mail 주소를 입력 후 "가입 여부 확인하기"<br>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                       	 버튼을 클릭해 주시면 가입 여부를 알려드립니다.</li><br>
                </ul>
                <div class="topline">
                </div>
                <br>
                
                <form name="idfindscreen" action="<%= request.getContextPath() %>/id"
				method="post" onsubmit="return searchId();">                
                
                <div class="id3">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <label>이름</label> <input type="text" name="userName" class="id1text" size="10" required><br><br>
                    <label>E-mail 주소</label> <input type="text" name="userEmail" class="id1text" size="10" required><br><br>
                    <a href="searchid">
                    <a href="login"><input type="button" id="searchreturn" value="돌아가기"></button></a>
                    <button id="searchIdUpdateForm" onclick="searchId();">가입여부 확인하기</button>
                    </a><br>
                </div>
                </form>
                <br><div class="topline">
                </div><br>
                <label class="servicec">고객센터 1544 - 0000</label>
                              
                <a href="emailconsulting"><button id="emailquestion">E-mail로 문의하기</button></a><br>
                              
                <label id="idnologin">로그인 필요 없음</label>
            </div>
        </div> 
        </div>  
    <!-- footer -->
	<jsp:include page="/WEB-INF/views/member/footer.jsp" />
	
	<script>
		function searchId(){
			var userName = document.getElementById("userName").value;
			var userEmail = document.getElementById("userEmail").value;
			if(userName == "" && userEmail == ""){
				alert("이름과 이메일을 입력해주세요.")
				return;
			}
			/*
			var url = "/searchId";
			
			var title="searchId";
			
			var status = "left=50%, top=50%, height=400px, menubar-no, status=no, scrollbar=yes";
			
			var popup = window.open("", title, status);
			
			searchFrm.userName.value=userName;
			searchFrm.userEmail.value=userEmail;
			
			searchFrm.target = title;
			searchFrm.action = url;
			searchFrm.method="post";
			
			searchFrm.submit();			
			*/
		}
		
		// 사용자 입력 값 유효성 검사용 함수
		function validate(){
			return true;
		}
		
		/*
		// 비밀번호 변경 팝업창 호출
		function openPopup(url, title, width, height) {
			
			var left = (document.body.clientWidth/2)-(width/2);
			//left += window.screenLeft;	// 듀얼 모니터
			var top = (screen.availHeight/2)-(height/2);
			
			var options = "width="+width+",height="+height+",left="+left+",top="+top;
			
			window.open(url, title, options);
		}
		*/
				
	</script>
	<!-- 
	<script>
		$(function(){
			$("#searchIdUpdateForm").click(function(){
				$.ajax({
					url : "${ pageContext.servletContext.contextPath }/id",
					data : { input : $("#searchIdUpdateForm").val() },
					type : "get",
					dataType : "json",
					success : function(obj){
						console.log(obj);
						
						var str = '';
						if(obj){
							str = user.name + "님의 아이디는 : " + user.id + "입니다";
						} else {
							str = '입력한 회원정보가 없습니다 \n 다시 확인해주세요.'
						}
						$("#searchIdUpdateForm").val(str);
					},
					error : function(e){
						console.log(e);
					}
				});
			});
		});
	</script>
	 -->
	
</body>
</html>