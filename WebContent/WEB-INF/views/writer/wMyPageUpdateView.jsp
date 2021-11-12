<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://unpkg.com/ress/dist/ress.min.css">
<!-- 외부 스타일 시트 -->
<link href="${ contextPath }/resources/css/writer/wMyPageUpdate.css" rel="stylesheet">
<title>작가회원 마이페이지</title>
</head>
<body>
	<!-- 메뉴바 -->
	<%@ include file="/WEB-INF/views/common/menubar.jsp" %>
	
	<div class="csarea wrapper">
		<!-- cs 카테고리 -->
		<jsp:include page="/WEB-INF/views/writer/wmyCategory.jsp" />
		
		<div class="content">
		 	<div class="wmy_header">MY 정보 수정</div>
		 	
		 	<!-- 회원 정보 영역 -->
            <form class="wmy_info" action="${ contextPath }/w-mypage/update" method="post" enctype="multipart/form-data">
	            <div class="wmy_pro">
	            	<c:choose>
	            		<c:when test="${ !empty wprofile }">
	            			<!-- 수정전 파일 이름 가져가기 -->
	            			<input type="hidden" name="change_file" value="${ wprofile.change_file }">
	            			<div class="image_area">
		               			<img src="${ contextPath }${ wprofile.file_path }${ wprofile.change_file }">
	            			</div>
	            			<!-- label의 for속성 이름과 input id이름이 같아야 연동된다~~ -->
			                <label for="upprofile">프로필이미지 변경</label>
			                <input type="file" name="upprofile" id="upprofile">
			                <div class="wmy_self">
			                	<span>&nbsp;자기소개</span>
			                	<textarea rows="6" cols="60" name="upgreeting">${ wprofile.greeting }</textarea>
			                </div>
	            		</c:when>
	            		<c:otherwise>
	            			<div class="image_area">
				                <img src="${ contextPath }/resources/images/writer/prodefault.png">
			            	</div>
			                <!-- label의 for속성 이름과 input id이름이 같아야 연동된다~~ -->
			                <label for="inprofile">프로필이미지 변경</label>
			                <input type="file" name="inprofile" id="inprofile" name="profile" required>
			                <div class="wmy_self">
			                	<span>&nbsp;자기소개</span>
			                	<textarea rows="6" cols="60" name="ingreeting" placeholder="독자들에게 자기소개 해주세요." required></textarea>
			                </div>
	            		</c:otherwise>
	            	</c:choose>
	            </div>
	            
                <div class="wmy_idarea">
                    <span class="wmy_id">아이디</span>
	                <input class="wmy_id2" type="text" readonly value="${ writer.userId }">
                </div>
    
                <div class="wmy_pwarea">
                    <span class="wmy_pw">비밀번호</span>
                    <span class="wmy_pw2">********</span>
                    <button type="button" id="wPwdUpdateBtn"
                    onclick="openPopup('<%= request.getContextPath() %>/pwdModify', 'pwdModify', 500, 500);">비밀번호 변경</button>
                </div>
    
                <div class="wmy_namearea">
                    <span class="wmy_name">이름</span>
                    <span class="wmy_name2">
                    	<input type="text" name="name" value="${ writer.userName }" required>
                    </span>
                </div>
    
                <div class="wmy_phonearea">
                    <span class="wmy_phone">휴대전화</span>
                    <span class="wmy_phone2">
                    	<input type="text" name="phone" value="${ writer.userPhone }" required>
                    </span>
                </div>
    
                <div class="wmy_emailarea">
                    <span class="wmy_email">이메일</span>
                    <span class="wmy_email2">
                    	<input type="email" name="email" value="${ writer.userEmail }" required>
                    </span>
                </div>
    			
    			<% 
           			String[] address;
           			if(loginUser.getUserAddress() != null){
          					address = loginUser.getUserAddress().split("[|]");
           			} else {
           				address = new String[] {"", "", ""};
           			}
           		%>
                <div class="wmy_addressarea">
                    <span class="wmy_address">주소</span>
                    <div class="wmy_address2">
                    	<div class="wmy_address3">
	                        <input type="text" name="address" id="finput" class="postcodify_postcode5" readonly value="<%= address[0] %>">
	                        <button type="button" id="waddress_btn">검색</button>
                    	</div>
                        <input type="text" name="address" class="postcodify_address" readonly value="<%= address[1] %>">
                        <input type="text" name="address" class="postcodify_extra_details" value="<%= address[2] %>">
                    </div>
                </div>
        
                <div class="wmy_btn">
                    <button type="button" onclick="location.href='${ contextPath }/w-mypage'">취소</button>
                    <button type="submit">수정하기</button>
                </div>
            </form>
		</div>
		
		<!-- 광고  -->
		<jsp:include page="/WEB-INF/views/common/adArea.jsp" />	
	</div>
	
	<!-- footer -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	
	<!-- jQuery와 Postcodify를 로딩한다 -->
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
	<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
	<script>
		// 주소 검색
		$(function() {
			$("#waddress_btn").postcodifyPopUp();
		});
	
		// 사용자 입력 값 유효성 검사용 함수
		function validate(){
			return true;
		}
		
		// 비밀번호 변경 팝업창 호출
		function openPopup(url, title, width, height) {
			
			var left = (document.body.clientWidth/2)-(width/2);
			//left += window.screenLeft;	// 듀얼 모니터
			var top = (screen.availHeight/2)-(height/2);
			
			var options = "width="+width+",height="+height+",left="+left+",top="+top;
			
			window.open(url, title, options);
		}
	</script>
	
	<!-- preview -->
	<script>
		/* input type file 요소들  */
		const fileElements = document.querySelectorAll("[type=file]");
		/* div image_area 요소들 */
		const imageArea = document.querySelectorAll(".image_area");
		/* input type file 요소에 change 이벤트 발생 시(파일 첨부 발생) */
		fileElements.forEach(item => item.addEventListener('change', preview));
		
		function preview() {
			let index = Array.from(fileElements).indexOf(this);
			
			if(this.files && this.files[0]) {
				let reader = new FileReader();
				reader.readAsDataURL(this.files[0]);
				reader.onload = function(){
					imageArea[index].innerHTML = "<img src='" + reader.result + "'>"; 
				}
			}
		}
		
		
	</script>
</body>
</html>