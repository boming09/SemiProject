<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://unpkg.com/ress/dist/ress.min.css">
<!-- 외부 스타일 시트 -->
<link href="${ contextPath }/resources/css/writer/wMyUnreviewList.css" rel="stylesheet">
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
	                    <th class="unre_user">작성자</th>
	                    <th class="unre_date">등록일</th>
	                    <th class="unre_status">상태</th>
	                </tr>
	
	                <!-- 반복문 돌릴 애들 -->
	                <c:forEach var="review" items="${ reviewList }">
	                	<c:if test="${ review.review_no != review.ref_no  }">
			                <tr class="unreview_content" onclick="location.href='${ contextPath }/w-unreview/detail?review_no=${ review.review_no }'">
			                    <td class="unre_no">${ review.review_no }</td>
			                    <td class="unre_name"><div>${ review.book_name }</div></td>
			                    <td class="unre_user">${ review.user_id }</td>
			                    <td class="unre_date">${ review.create_date }</td>
			                    <td class="unre_status status2" style="color:red;">미답변</td>
			                </tr>
	                	</c:if>
	                </c:forEach>
	            </table>
			</div>

            <div class="pagingarea">
                 <ul class="unreview_paging">
	            	<!-- 앞으로 이동하는 버튼(<) -->
	            	<li>
					<c:choose>
						<c:when test="${ pi.page > 1 }">
							<a href="${ contextPath }/w-unreview?page=${ pi.page - 1}">&lt;</a>
						</c:when>
						<c:otherwise>
							<a href="#">&lt;</a>
						</c:otherwise>
					</c:choose>
					</li>
	            
	            	<!-- 최대5개의 페이지 바 -->
					<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
						<li>
							<c:choose>
								<c:when test="${ p eq pi.page }">
									<a href="#" class="current_page">${ p }</a>
								</c:when>
								<c:otherwise>
									<a href="${ contextPath }/w-unreview?page=${ p }">${ p }</a>
								</c:otherwise>
							</c:choose>
						</li>
					</c:forEach>
	            	
	            	<!-- 다음 페이지로(>) -->
					<li>
						<c:choose>
							<c:when test="${ pi.page < pi.maxPage }">
								<a href="${ contextPath }/w-unreview?page=${ pi.page + 1}">&gt;</a>
							</c:when>
							<c:otherwise>
								<a href="#">&gt;</a>
							</c:otherwise>
						</c:choose>
			 		</li>
           		 </ul>	
            </div>
        </div>
		
		<!-- 광고  -->
		<jsp:include page="/WEB-INF/views/common/adArea.jsp" />	
	</div>
	
	<!-- footer -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>