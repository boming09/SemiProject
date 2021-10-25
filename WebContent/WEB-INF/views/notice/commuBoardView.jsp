<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://unpkg.com/ress/dist/ress.min.css">
<!-- 외부 스타일 시트 -->
<link href="<%= request.getContextPath() %>/resources/css/commuBoard.css" rel="stylesheet">
<title>commuBoardview</title>
</head>
<body>
	<!-- 고객센터 사이드 FAQ-주문/결제 클릭시 첫 화면 -->
	<!-- 메뉴바 -->
	<%@ include file="/WEB-INF/views/common/menubar.jsp" %>
	
	<div class="csarea wrapper">
		<!-- cs 카테고리 -->
		<%@ include file="/WEB-INF/views/notice/csCategory.jsp" %>
		
		<div class="content">
            <header class="commu_header">
                <div>소통게시판</div>
                <div class="commun_writerinfo">
                    <button type="button" onclick="location.href='<%= request.getContextPath() %>/w-info'">작가 소개</button>
                </div>
            </header>
            <div class="commu_ment">
                <ul>
                    <li>이 게시판은 작가와 소통할 수 있는 봄숲만의 특별한 게시판 입니다.</li>
                    <li>작가에게 그동안 궁금했던 질문들을 직접 질문해 보세요.</li>
                </ul>
            </div>

            <div class="commu_area1">
                <span>목록</span>
                <span>
                    <input type="checkbox" name="mylist" value=""><label>내가 쓴 글만 보기</label>
                    <button type="button">글 작성</button>
                </span>
            </div>

            <div class="commu_area2">
                <div class="commu_listarea">
                    <ul class="commu_listtop">
                        <li class="commu_no">번호</li>
                        <li class="commu_writer">작가</li>
                        <li class="commu_title">제목</li>
                        <li class="commu_user">작성자</li>
                        <li class="commu_date">등록일</li>
                        <li class="commu_status">상태</li>
                    </ul>
                    <ul class="commu_list">
                        <li class="commu_no">100</li>
                        <li class="commu_writer">반복문</li>
                        <li class="commu_title">반복문</li>
                        <li class="commu_user">반복문</li>
                        <li class="commu_date">반복문</li>
                        <li class="commu_status">답변완료</li>
                    </ul>
                </div>
                
                <div class="commu_page">
                    <!-- 페이지 바 영역 => 나중에 작성 -->
                </div>
                
            </div>
    	</div>
    	<!-- 광고  -->
		<%@ include file="/WEB-INF/views/common/adArea.jsp" %>
	</div>
	<!-- footer -->
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	
</body>
</html>