<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://unpkg.com/ress/dist/ress.min.css">
<!-- 외부 스타일 시트 -->
<link href="${ contextPath }/resources/css/kwang/mypage-review.css" rel="stylesheet">
<title>마이리뷰</title>
</head>
<body>
	<!-- 메뉴바 -->
	<jsp:include page="/WEB-INF/views/common/menubar.jsp" />
	
	<div class="csarea wrapper">
        <!-- mypage-category 카테고리 추가 -->
		<%@ include file="/WEB-INF/views/mypage/mypage-category.jsp" %>
        
        <div class="content">
        	<header class="review_header">
                <div>마이리뷰</div>
                <!-- 
                <div class="review_commu">
                    <button onclick="location.href='${ contextPath }/commu'">전체<br>소통게시판</button>
                </div>
                 -->
            </header>
        
            <div class="review_area1">
                <span>마이리뷰 목록</span>
                <!-- <span>
                    <input type="checkbox" name="mylist" value=""><label>내가 쓴 글만 보기</label>
                    <button type="button">글 작성</button>
                </span> -->
            </div>

            <div class="review_area2">
                <div class="review_listarea">
                    <ul class="review_listtop">
                        <li class="review_no">번호</li>
                        <li class="review_writer">작가</li>
                        <li class="review_title">책제목</li>
                        <li class="review_recommend">추천수</li>
                        <li class="review_date">등록일</li>
                        <li class="review_status">평점</li>
                    </ul>
                    <!-- 반복문 -->
                    <ul class="review_list" onclick="#">
                        <li class="review_no">2</li>
                        <li class="review_writer">OOO</li>
                        <li class="review_title title2">자바</li>
                        <li class="review_recommend">15</li>
                        <li class="review_date">2021-11-1</li>
                        <li class="review_status">5</li>
                    </ul>
                    <ul class="review_list" onclick="#">
                        <li class="review_no">1</li>
                        <li class="review_writer">ㅁㅁㅁ</li>
                        <li class="review_title title2">JS</li>
                        <li class="review_recommend">20</li>
                        <li class="review_date">2021-11-1</li>
                        <li class="review_status">4</li>
                    </ul>
                </div>
                
                <div class="wcommu_page">
                    <!-- 페이지 바 영역 => 나중에 작성 -->
                </div>
                
            </div>
        </div>	
        
        <!-- 광고  -->
		<jsp:include page="/WEB-INF/views/common/adArea.jsp" />	
	</div>
	
	<!-- footer -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>