<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            </header>
			
            <div class="wbook_area">도서 리스트</div>
            <div class="wbook_listarea2">
	           	<table class="wbook_listarea">
	                <tr class="wbook_listtop">
	                    <th class="wb_no">도서번호</th>
	                    <th class="wb_name">도서명</th>
	                    <th class="wb_pub">출판사</th>
	                    <th class="wb_date">등록일</th>
	                    <th class="wb_review">리뷰</th>
	                </tr>
	
	                <!-- 반복문 돌릴 애들 -->
	                <c:forEach var="wbook" items="${ wbookList }">
		                <tr class="wbook_content">
		                    <td class="wb_no">${ wbook.bid }</td>
		                    <td class="wb_name">
			                    <div class="wb_namearea" onclick="detailView(${ wbook.bid })">
			                    	<a>
				                        <img class="wb_img" src="${ contextPath }${ wbook.bimg }">
				                        <span>${ wbook.btitle }</span>
			                    	</a>
			                    </div>
		                   
		                    </td>
		                    <td class="wb_pub">${ wbook.publisher }</td>
		                    <td class="wb_date">${ wbook.publicationDate }</td>
		                    <td class="wb_review">${ wbook.reviewCount }</td>
		                </tr>
	                </c:forEach>
	            </table>
            </div>
            
            <div class="pagingarea">
            	 <ul class="wmybook_paging">
	            	<!-- 앞으로 이동하는 버튼(<) -->
	            	<li>
					<c:choose>
						<c:when test="${ pi.page > 1 }">
							<a href="${ contextPath }/w-mybook?page=${ pi.page - 1}">&lt;</a>
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
									<a href="${ contextPath }/w-mybook?page=${ p }">${ p }</a>
								</c:otherwise>
							</c:choose>
						</li>
					</c:forEach>
	            	
	            	<!-- 다음 페이지로(>) -->                     
					<li>
						<c:choose>
							<c:when test="${ pi.page < pi.maxPage }">
								<a href="${ contextPath }/w-mybook?page=${ pi.page + 1}">&gt;</a>
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
	
	<script>
		function detailView(bid) {
			location.href = "${ contextPath }/book/detail?bid=" + bid;
		}
	</script>
</body>
</html>