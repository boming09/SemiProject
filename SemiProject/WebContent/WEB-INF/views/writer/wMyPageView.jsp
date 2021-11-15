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
<link href="${ contextPath }/resources/css/writer/wMyPage.css" rel="stylesheet">
<title>작가회원 마이페이지</title>
</head>
<body>
	<!-- 메뉴바 -->
	<jsp:include page="/WEB-INF/views/common/menubar.jsp" />
	
	<div class="csarea wrapper">
		<!-- cs 카테고리 -->
		<jsp:include page="/WEB-INF/views/writer/wmyCategory.jsp" />
		
		<div class="content">
		 	<div class="wmy_header">MY 정보</div>

            <!-- 회원 정보 영역 -->
            <form class="wmy_info">
            
	            <div class="wmy_pro">
	            	<c:choose>
	            		<c:when test="${ !empty wprofile }">
	            			<img src="${ contextPath }${ wprofile.file_path }${ wprofile.change_file }">
	            			<div class="wmy_self">
			                	<span>&nbsp;자기소개</span>
			                	<textarea rows="6" cols="60" readonly>${ wprofile.greeting }</textarea>
	              			</div>
	            		</c:when>
	            		<c:otherwise>
	            			<img src="${ contextPath }/resources/images/writer/prodefault.png">
	                		<div class="wmy_self">
		                		<span>&nbsp;자기소개</span>
		                		<textarea rows="6" cols="60" placeholder="독자들에게 자기소개 해주세요." readonly></textarea>
	               			</div>
	            		</c:otherwise>
	            	</c:choose>
	                	                
	            </div>
	            
                <div class="wmy_idarea">
                    <span class="wmy_id">아이디</span>
                    <span class="wmy_id2">${ writer.userId }</span>
                </div>
    
                <div class="wmy_pwarea">
                    <span class="wmy_pw">비밀번호</span>
                    <span class="wmy_pw2">********</span>
                </div>
    
                <div class="wmy_namearea">
                    <span class="wmy_name">이름</span>
                    <span class="wmy_name2">${ writer.userName }</span>
                </div>
    
                <div class="wmy_phonearea">
                    <span class="wmy_phone">휴대전화</span>
                    <span class="wmy_phone2">${ writer.userPhone }</span>
                </div>
    
                <div class="wmy_emailarea">
                    <span class="wmy_email">이메일</span>
                    <span class="wmy_email2">${ writer.userEmail }</span>
                </div>
              
              	<!-- 주소 문자열 자르기 -->
	     		<c:set var="address" value="${ writer.userAddress }"/> 
				<c:set var="adressArr" value="${ fn:split(address, '|') }"/>
				
                <div class="wmy_addressarea">
                    <span class="wmy_address">주소</span>
                    <div class="wmy_address2">
                    	<c:forEach var="i" items="${ adressArr }">
                    		<input type="text" readonly value="${ i }">
                    	</c:forEach>
                    </div>
                </div>
    
                <div class="wmy_agree">
                	<span>봄숲 약관 동의 내역</span>
                    <ul> 
                        <li>봄숲 이용약관 : [${ writer.enrollDate }] 에 동의 하셨습니다.</li>
                        <li>봄숲 커뮤니티 이용약관 : [${ writer.enrollDate }] 에 동의 하셨습니다.</li>
                        <li>개인정보 수집 및 이용 : [${ writer.enrollDate }] 에 동의 하셨습니다.</li>
                    </ul>
                    <span>봄숲 약관 동의 내역</span>
                    <ul>
                        <li>봄숲에서 제공하는 서비스의 특성상 회원 가입시 필수 동의 항목 중 일부 항목의 철회는 불가합니다.</li>
                        <li>동의 철회를 하시려면 현제 페이지 아래에 있는 "회원탈퇴"을 클릭해 주시기 바랍니다.</li>
                    </ul>
                </div>
    
                <div class="wmy_btn">
                    <button type="button" onclick="location.href='${ contextPath }/w-mypage/update'">정보수정</button>
                    
                    <button type="button" id="deleteBtn" onclick="myDelete()">회원탈퇴</button>
                </div>
            </form>
        </div>
		<!-- 광고  -->
		<jsp:include page="/WEB-INF/views/common/adArea.jsp" />	
	</div>
	
	<!-- footer -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	<script>
		// 탈퇴하기
		function myDelete() {
			if(confirm("정말로 탈퇴하시겠습니까?")) {
				location.href='${ contextPath }/w-mypage/delete';
			}
		}
	</script>
</body>
</html>