<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://unpkg.com/ress/dist/ress.min.css">
<!-- 외부 스타일 시트 -->
<link href="${ contextPath }/resources/css/notice/oneQuestionList.css" rel="stylesheet">
<title>고객센터_1:1문의</title>
</head>
<body>
	<!-- 메뉴바 -->
	<jsp:include page="/WEB-INF/views/common/menubar.jsp" />
	
	<div class="csarea wrapper">
        <!-- cs 카테고리 -->
		<jsp:include page="/WEB-INF/views/notice/csCategory.jsp" />
        
        <div class="content">
        	<header class="one_header">
                <div>1:1 문의내역</div>
                <div class="one_question">
                    <button onclick="location.href='${ contextPath }/one/insert'">1:1문의하기</button>
                </div>
            </header>
             <div class="one_ment">
                <ul>
                    <li>평일 오후 5시 이후 문의는 당일 답변이 어려울 수 있습니다.</li>
                    <li>토, 일요일 및 공휴일 문의는 평일 운영 시간 내 순차적으로 답변드리겠습니다.</li>
                </ul>
            </div>
        
            <div class="one_area1">
                <span>문의 리스트</span>
            </div>

            <div class="one_area2">
                <div class="one_listarea">
                    <ul class="one_listtop">
                        <li class="one_no">번호</li>
                        <li class="one_title">제목</li>
                        <li class="one_date">등록일</li>
                        <li class="one_status">상태</li>
                    </ul>
                    <!-- 반복문 -->
                    <c:forEach var="one" items="${ oneList }">
	                    <%-- <c:set var="index" value="${ index + 1 }"/> --%>
	                    <ul class="one_list" onclick="detailView(${ one.one_no })">
	                        <li class="one_no">${ one.one_no }</li>
	                        <li class="one_title title2">${ one.otitle }</li>
	                        <li class="one_date">${ one.odate }</li>
	                        <li class="one_status">
		                        <c:choose>
		                        	<c:when test="${ one.status == 'N' }">미답변</c:when>
		                        	<c:otherwise>답변완료</c:otherwise>
		                        </c:choose>
	                        </li>
	                    </ul>
                    </c:forEach>
                </div>
                
                
                <div class="pagingarea">
                    <ul class="one_paging">
		            	<!-- 앞으로 이동하는 버튼(<) -->
		            	<li>
						<c:choose>
							<c:when test="${ pi.page > 1 }">
								<a href="${ contextPath }/one?page=${ pi.page - 1}">&lt;</a>
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
										<a href="${ contextPath }/one?page=${ p }">${ p }</a>
									</c:otherwise>
								</c:choose>
							</li>
						</c:forEach>
		            	
		            	<!-- 다음 페이지로(>) -->
						<li>
							<c:choose>
								<c:when test="${ pi.page < pi.maxPage }">
									<a href="${ contextPath }/one?page=${ pi.page + 1}">&gt;</a>
								</c:when>
								<c:otherwise>
									<a href="#">&gt;</a>
								</c:otherwise>
							</c:choose>
						</li>
	           		</ul>
                </div>
            </div>
        </div>
        <!-- 광고  -->
		<jsp:include page="/WEB-INF/views/common/adArea.jsp" />	
	</div>
	
	<!-- footer -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	
	<!-- 여기는 로그인유저와 작성자와 같은지 확인 필요 없음 -->
	<script>
		function detailView(oneno){
			location.href='${ contextPath }/one/detail?one_no=' + oneno;
		}
	</script>
	
</body>
</html>