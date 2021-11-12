<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                    <c:forEach var="wcommu" items="${ wCommuList }">
	                    <ul class="wcommu_list" onclick="location.href='${ contextPath }/w-commu/detail?commu_no=${ wcommu.commu_no }'">
	                        <li class="wcommu_no">${ wcommu.commu_no }</li>
	                        <li class="wcommu_writer">${ wcommu.cwriter_name }</li>
	                        <li class="wcommu_title title2">${ wcommu.ctitle }</li>
	                        <li class="wcommu_user">${ wcommu.user_id }</li>
	                        <li class="wcommu_date">${ wcommu.create_date }</li>
	                        <c:if test="${ wcommu.status == 'N' }" >
	                       		<li class="wcommu_status" value="${ wcommu.status }" style="color:red;">미답변</li>
	                        </c:if>
	                        
	                    </ul>
                    </c:forEach>
                </div>
                
                <div class="pagingarea">
                    <ul class="commu_paging">
	            	<!-- 앞으로 이동하는 버튼(<) -->
	            	<li>
					<c:choose>
						<c:when test="${ pi.page > 1 }">
							<a href="${ contextPath }/w-commu?page=${ pi.page - 1}">&lt;</a>
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
									<a href="${ contextPath }/w-commu?page=${ p }">${ p }</a>
								</c:otherwise>
							</c:choose>
						</li>
					</c:forEach>
	            	
	            	<!-- 다음 페이지로(>) -->
					<li>
						<c:choose>
							<c:when test="${ pi.page < pi.maxPage }">
								<a href="${ contextPath }/w-commu?page=${ pi.page + 1}">&gt;</a>
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
</body>
</html>