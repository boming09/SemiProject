<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://unpkg.com/ress/dist/ress.min.css">
<!-- 외부 스타일 시트 -->
<link href="${ contextPath }/resources/css/wMyUnreviewDetail.css" rel="stylesheet">
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
                <div class="wb_detailpage">
                    <button onclick="location.href='#'">도서<br>상세페이지</button>
                </div>
            </header>
            
            <div class="unreview_area">리뷰 내용</div>
            <div class="unreview_conarea">
                <table>
                    <tr class="liarea">
                        <th class="unre_name">도서명</th>
                        <td class="name">
                            <div>도서제목인데 오나전ㅇdgdgdgddfdfddddsefedcxcvdsfegdxcvcxxsdawwwwwwwww라ㅓ길수도 있지요~~ㅇ하ㅓ오혀다</div>
                        </td>
                        <th class="unre_date">등록일</th>
                        <td class="date">2021-10-04</td>
                    </tr>
                    <tr class="liarea">
                        <th class="unre_user">작성자</th>
                        <td class="user">user01</td>
                        <th class="unre_rating">별점</th>
                        <td class="rating">@@@@@</td>
                    </tr>
                    <tr class="liarea2">
                        <th class="unre_content">내용</th>
                        <td class="rcontent" colspan="3">문의.unre_date, .unre_rating오랑너ㅗ여ㅑ니엉느누나te, .unre_rating오랑너ㅗ여ㅑ니엉느누나te, .unre_rating오랑너ㅗ여ㅑ니엉느누나te, .unre_rating오랑너ㅗ여ㅑ니엉느누나ㅡ우라ㅣㄴ여ㅗㄹㄴ열널이ㅏ</td>
                    </tr>
                </table>
            </div>
            <div class="unre_btn">
                <button type="button" onclick="location.href='${ contextPath }/w-unreview'">취소</button>
                <button type="button" onclick="location.href='${ contextPath }/w-unreview/insert'">답변작성</button>
            </div>
            
		</div>
		
		<!-- 광고  -->
		<jsp:include page="/WEB-INF/views/common/adArea.jsp" />	
	</div>
	
	<!-- footer -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>