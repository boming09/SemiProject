<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	pageContext.setAttribute("newReply", "\n");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://unpkg.com/ress/dist/ress.min.css">
<!-- 외부 스타일 시트 -->
<link href="${ contextPath }/resources/css/writer/wMyUnreviewInsert.css" rel="stylesheet">
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
            </header>
            
            <div class="unreview_area">리뷰 내용</div>
            <div class="unreview_conarea">
                <table>
                    <tr class="liarea">
                        <th class="unre_name">도서명</th>
                        <td class="name">
                            <div>${ review.book_name }</div>
                        </td>
                        <th class="unre_date">등록일</th>
                        <td class="date">${ review.create_date }</td>
                    </tr>
                    <tr class="liarea">
                        <th class="unre_user">작성자</th>
                        <td class="user">${ review.user_id }</td>
                        <th class="unre_rating">별점</th>
                        <td class="rating">${ review.rating } 점</td>
                    </tr>
                    <tr class="liarea2">
                        <th class="unre_content">내용</th>
                        <td class="rcontent" colspan="3">${ fn:replace(review.content, newReply, '<br>')}</td>
                    </tr>
                </table>
            </div>
            
            <form method="post" action="${ contextPath }/w-unreview/insert?review_no=${ review.review_no }">
            	<input type="hidden" name="book_id" value="${ review.book_id }">
	            <div class="unreview_area">답변 작성</div>
	            <div class="unre_reply">
	                <textarea name="reply"></textarea>
	            </div>
	            
	            <div class="unre_btn">
	                <button type="button" onclick="location.href='${ contextPath }/w-unreview/detail?review_no=${ review.review_no }'">취소</button>
	                <button type="submit">등록하기</button>
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