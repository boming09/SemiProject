<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://unpkg.com/ress/dist/ress.min.css">
<!-- 외부 스타일 시트 -->
<link href="${ contextPath }/resources/css/writerCheck.css" rel="stylesheet">
<title>작가인증게시판</title>
</head>
<body>
	<!-- 메뉴바 -->
	<jsp:include page="/WEB-INF/views/common/menubar.jsp" />
	
	<div class="csarea wrapper">
		<!-- cs 카테고리 -->
		<jsp:include page="/WEB-INF/views/notice/csCategory.jsp" />
		
		 <div class="content">
            <div class="wcheck_header">작가 인증게시판</div>
            <div class="wcheck_ment">
                <ul>
                    <li>평일 오후 5시 이후 신청은 당일 확인이 어려울 수 있습니다.</li>
                    <li>토, 일요일 및 공휴일 신청은 평일 운영 시간 내 순차적으로 확인해드리겠습니다.</li>
                    <li>작가 인증 확인시 다소 시간이 걸릴 수도 있으니 이점 양해바랍니다.</li>
                </ul>
            </div>

            <div class="wcheck_area1">
                <span>목록</span>
                <span>
                    <input type="checkbox" name="mylist" value=""><label>내가 쓴 글만 보기</label>
                    <button type="button" onclick="location.href='${ contextPath }/w-check/insert'">글 작성</button>
                </span>
            </div>

            <div class="wcheck_area2">
                <div class="wcheck_listarea">
                    <ul class="wcheck_listtop">
                        <li class="wcheck_no">번호</li>
                        <li class="wcheck_title">제목</li>
                        <li class="wcheck_user">작성자</li>
                        <li class="wcheck_date">등록일</li>
                        <li class="wcheck_status">상태</li>
                    </ul>
                    <ul class="wcheck_list">
                        <li class="wcheck_no">100</li>
                        <li class="wcheck_title">반복문</li>
                        <li class="wcheck_user">반복문</li>
                        <li class="wcheck_date">반복문</li>
                        <li class="wcheck_status">확인중</li>
                    </ul>
                </div>
                
                <div class="wcheck_page">
                    <!-- 페이지 바 영역 => 나중에 작성 -->
                </div>
 
            </div>
        </div>
        <!-- 광고  -->
		<jsp:include page="/WEB-INF/views/common/adArea.jsp" />
	</div>
	
	<div class="footer2">
		<!-- footer -->
		<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	</div>
	
</body>
</html>