<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://unpkg.com/ress/dist/ress.min.css">
<!-- 외부 스타일 시트 -->
<link href="${ contextPath }/resources/css/wMyUnreview.css" rel="stylesheet">
<title>MY 도서</title>
</head>
<body>
	<!-- 메뉴바 -->
	<jsp:include page="/WEB-INF/views/common/menubar.jsp" />
	
	<div class="csarea wrapper">
		<!-- cs 카테고리 -->
		<jsp:include page="/WEB-INF/views/writer/wmyCategory.jsp" />
		
		<div class="content">
            <header class="unreview_header">
                <div>MY 도서</div>
                <div class="unreview_wbook">
                    <button onclick="location.href='${ contextPath }/w-mybook'">도서 리스트</button>
                </div>
            </header>

            <div class="unreview_area">리뷰 리스트</div>
			<div class="unreview_listarea">
	            <table>
	                <tr class="unreview_listtop">
	                    <th class="unre_no">번호</th>
	                    <th class="unre_name">도서명</th>
	                  <!--   <th class="unre_content">리뷰 내용</th> -->
	                    <th class="unre_user">작성자</th>
	                    <th class="unre_date">등록일</th>
	                    <th class="unre_status">상태</th>
	                </tr>
	
	                <!-- 반복문 돌릴 애들 -->
	                <tr class="unreview_content" onclick="location.href='${ contextPath }/w-unreview/detail'">
	                    <td class="unre_no">100</td>
	                    <td class="unre_name">
	                    	<div>HTML + CSS + 자바스크아오녈ㅇ나ㅓ혼이ㅏㅗ녀저어ㅏ아ㅓ아ㅓㄴ아ㅓㅗㄴ아ㅓ로나러ㅗ댜ㅕㄴ오라ㅓㄴ외ㅏ펕추프ㅜ나어ㅗ루나ㅣ어로디ㅑㅕㅗ지ㅏ러ㅗ디라ㅓ도으ㅏㅜㅌ아ㅓ춮니아ㅓㅚㅏㅓㅚㅏㅓㅗㅕㅚㅏ립트 긴 책이름</div>
	                    </td>
	                    <!-- <td class="unre_content">리뷰내용 어쩌고</td> -->
	                    <td class="unre_user">user01</td>
	                    <td class="unre_date">2021-10-04</td>
	                    <td class="unre_status">미답변</td>
	                </tr>
	            </table>
			</div>

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