<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://unpkg.com/ress/dist/ress.min.css">
<!-- 외부 스타일 시트 -->
<link href="${ contextPath }/resources/css/writer/wMyBook.css" rel="stylesheet">
<title>MY 도서</title>
</head>
<body>
	<!-- 메뉴바 -->
	<jsp:include page="/WEB-INF/views/common/menubar.jsp" />
	
	<div class="csarea wrapper">
		<!-- cs 카테고리 -->
		<jsp:include page="/WEB-INF/views/writer/wmyCategory.jsp" />
		
		<div class="content">
		 	<header class="wbook_header">
                <div>MY 도서</div>
                <div class="wbook_unreview">
                    <button onclick="location.href='${ contextPath }/w-unreview'">미답변 리뷰</button>
                </div>
            </header>
			
            <div class="wbook_area">도서 리스트</div>
            
           	<table class="wbook_listarea">
                <tr class="wbook_listtop">
                    <th class="wb_no">번호</th>
                    <th class="wb_name">도서명</th>
                    <th class="wb_pub">출판사</th>
                    <th class="wb_date">등록일</th>
                    <th class="wb_amount">판매수</th>
                    <th class="wb_review">리뷰</th>
                </tr>

                <!-- 반복문 돌릴 애들 -->
                <tr class="wbook_content">
                    <td class="wb_no">100</td>
                    <td class="wb_name">
	                    <div class="wb_namearea">
	                    	<a href="#">
		                        <img class="wb_img" src="${ contextPath }/resources/images/writer/testbook.jpg">
		                        <span>HTML + CSS + 자바스크립트 웹표dd안녕하세요 ddddddddddd래ㅔㄱ가ㅗㄱㄹ란꼰거 준의 정석 완전 긴 책이름</span>
	                    	</a>
	                    </div>
                   
                    </td>
                    <td class="wb_pub">이지스퍼블리싱 어쩌고 ㅎㅎㅎㅎㅎㅎㅎ아아아</td>
                    <td class="wb_date">2021-10-04</td>
                    <td class="wb_amount">10권</td>
                    <td class="wb_review">5개</td>
                </tr>
            </table>
            
            <div class="wbook_page">
                <!-- 페이지 바 영역 => 나중에 작성 -->
            </div>
		</div>
		
		<!-- 광고  -->
		<jsp:include page="/WEB-INF/views/common/adArea.jsp" />	
	</div>
	
	<!-- footer -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>