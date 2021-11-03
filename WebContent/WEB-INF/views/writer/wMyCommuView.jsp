<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://unpkg.com/ress/dist/ress.min.css">
<!-- 외부 스타일 시트 -->
<link href="${ contextPath }/resources/css/writer/wMyCommu.css" rel="stylesheet">
<title>MY 소통게시판</title>
</head>
<body>
	<!-- 메뉴바 -->
	<jsp:include page="/WEB-INF/views/common/menubar.jsp" />
	
	<div class="csarea wrapper">
        <!-- cs 카테고리 -->
		<jsp:include page="/WEB-INF/views/writer/wmyCategory.jsp" />
        
        <div class="content">
        	<header class="wcommu_header">
                <div>MY 소통게시판</div>
                <div class="wcommu_commu">
                    <button onclick="location.href='${ contextPath }/commu'">전체<br>소통게시판</button>
                </div>
            </header>
        
            <div class="wcommu_area1">
                <span>소통 리스트</span>
                <!-- <span>
                    <input type="checkbox" name="mylist" value=""><label>내가 쓴 글만 보기</label>
                    <button type="button">글 작성</button>
                </span> -->
            </div>

            <div class="wcommu_area2">
                <div class="wcommu_listarea">
                    <ul class="wcommu_listtop">
                        <li class="wcommu_no">번호</li>
                        <li class="wcommu_writer">작가</li>
                        <li class="wcommu_title">제목</li>
                        <li class="wcommu_user">작성자</li>
                        <li class="wcommu_date">등록일</li>
                        <li class="wcommu_status">상태</li>
                    </ul>
                    <!-- 반복문 -->
                    <ul class="wcommu_list" onclick="location.href='${ contextPath }/w-commu/detail'">
                        <li class="wcommu_no">100</li>
                        <li class="wcommu_writer">반복문</li>
                        <li class="wcommu_title title2">반복문</li>
                        <li class="wcommu_user">반복문</li>
                        <li class="wcommu_date">반복문</li>
                        <li class="wcommu_status">미답변</li>
                    </ul>
                    <ul class="wcommu_list" onclick="">
                        <li class="wcommu_no">100</li>
                        <li class="wcommu_writer">반복문</li>
                        <li class="wcommu_title title2">반복문</li>
                        <li class="wcommu_user">반복문</li>
                        <li class="wcommu_date">반복문</li>
                        <li class="wcommu_status">답변완료</li>
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