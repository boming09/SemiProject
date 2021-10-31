<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://unpkg.com/ress/dist/ress.min.css">
<!-- 외부 스타일 시트 -->
<link href="${ contextPath }/resources/css/wMyPageUpdate.css" rel="stylesheet">
<title>작가회원 마이페이지</title>
</head>
<body>
	<!-- 메뉴바 -->
	<jsp:include page="/WEB-INF/views/common/menubar.jsp" />
	
	<div class="csarea wrapper">
		<!-- cs 카테고리 -->
		<jsp:include page="/WEB-INF/views/writer/wmyCategory.jsp" />
		
		<div class="content">
		 	<div class="wmy_header">회원정보 수정</div>
		 	
		 	<!-- 회원 정보 영역 -->
            <form class="wmy_info">
	            <div class="wmy_pro">
	                <img src="${ contextPath }/resources/images/prodefault.png">
	                <!-- label의 for속성 이름과 input id이름이 같아야 연동된다~~ -->
	                <label for="profile">프로필이미지 변경</label>
	                <input type="file" id="profile">
	                <div class="wmy_self">
	                	<span>&nbsp;자기소개</span>
	                	<textarea rows="6" cols="60">독자들에게 자기소개 해주세요^-^</textarea>
	                </div>
	            </div>
	            
                <div class="wmy_idarea">
                    <span class="wmy_id">아이디</span>
                    <span class="wmy_id2">변경불가</span>
                </div>
    
                <div class="wmy_pwarea">
                    <span class="wmy_pw">비밀번호</span>
                    <span class="wmy_pw2">*********</span>
                    <button type="button">비밀번호 변경</button>
                </div>
    
                <div class="wmy_namearea">
                    <span class="wmy_name">이름</span>
                    <span class="wmy_name2"><input type="text"></span>
                </div>
    
                <div class="wmy_phonearea">
                    <span class="wmy_phone">휴대전화</span>
                    <span class="wmy_phone2"><input type="text"></span>
                </div>
    
                <div class="wmy_emailarea">
                    <span class="wmy_email">이메일</span>
                    <span class="wmy_email2"><input type="text"></span>
                </div>
    
                <div class="wmy_addressarea">
                    <span class="wmy_address">주소</span>
                    <div class="wmy_address2">
                        <span class="">(06234) API 사용~~</span>
                        <span class="">서울특별시 강님구 테헤란로10길 9</span>
                        <span class="">7층 L오후반</span>
                    </div>
                </div>
        
                <div class="wmy_btn">
                    <button type="button" onclick="location.href='${ contextPath }/w-mypage'">취소</button>
                    <button type="button">수정하기</button>
                </div>
            </form>
		</div>
		
		<!-- 광고  -->
		<jsp:include page="/WEB-INF/views/common/adArea.jsp" />	
	</div>
	
	<!-- footer -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	
</body>
</html>