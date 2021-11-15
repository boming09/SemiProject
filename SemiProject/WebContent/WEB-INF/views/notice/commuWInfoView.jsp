<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://unpkg.com/ress/dist/ress.min.css">
<!-- 외부 스타일 시트 -->
<link href="${ contextPath }/resources/css/notice/commuWInfo.css" rel="stylesheet">
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<title>고객센터_소통게시판</title>
</head>
<body>
	<!-- 고객센터 사이드 FAQ-주문/결제 클릭시 첫 화면 -->
	<!-- 메뉴바 -->
	<jsp:include page="/WEB-INF/views/common/menubar.jsp" />
	
	<div class="csarea wrapper">
		<!-- cs 카테고리 -->
		<jsp:include page="/WEB-INF/views/notice/csCategory.jsp" />
		
		<div class="content">
			<header class="winfo_header">
                <div>봄숲 작가 소개</div>
                <div class="winfo_search">
                    <form class="winfo_search" action="${ contextPath }/commu/w-info">
	                    <input type="text" placeholder="작가 검색" name="w_name" value="${ param.w_name }"></input>
	                    <button type="submit">
	                    	<img src="${ contextPath }/resources/images/notice/magnifier.png">
	                   	</button>
                	</form>
                </div>
            </header>
            <div class="winfo_mentarea">
                <ul class="winfo_ment">
                    <li>봄숲에서 활동하고 있는 작가님들 입니다.</li>
                    <li>작가님께 궁금한 점이 있다면 소통게시판을 이용해보세요.</li>
                </ul>
                <div class="winfo_commu_btn">
                    <button type="button" onclick="location.href='${ contextPath }/commu'">소통 게시판</button>
                </div>
            </div>
			
			<c:forEach var="writer" items="${ writerList }">
	            <div class="w_profilearea">
                	<c:choose>
                		<c:when test="${ !empty writer.file_path }">
			                <div class="w_profile">
			                	<img src="${ contextPath }${ writer.file_path }${ writer.change_file }">
			                </div>
			                <div class="w_introduce">
			                    <span>${ writer.writer_name }&nbsp;작가님&nbsp;<i class="fas fa-check-circle"></i></span>
			                    <span>${ writer.greeting }</span>
			                </div>
                		</c:when>
                		<c:otherwise>
                			<div class="w_profile">
			                	<img src="${ contextPath }/resources/images/writer/prodefault.png">
			                </div>
			                <div class="w_introduce">
			                    <span>${ writer.writer_name }&nbsp;작가님&nbsp;<i class="fas fa-check-circle"></i></span>
			                    <span>아직 자기소개가 없습니다.</span>
			                </div>
                		</c:otherwise>
                	</c:choose>
	            </div>
			</c:forEach>
           
            <!-- 작가 검색어 입력시==파라미터에 w_name이 있다면 -->
			<c:if test="${ !empty param.w_name }">
				<c:set var="searchParam" value="&w_name=${ param.w_name }"/>
			</c:if> 
           
            <div class="pagingarea">
            	<ul class="commu_paging">
	            	<!-- 앞으로 이동하는 버튼(<) -->
	            	<li>
					<c:choose>
						<c:when test="${ pi.page > 1 }">
							<a href="${ contextPath }/commu/w-info?page=${ pi.page - 1}${ searchParam }">&lt;</a>
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
									<a href="${ contextPath }/commu/w-info?page=${ p }${ searchParam }">${ p }</a>
								</c:otherwise>
							</c:choose>
						</li>
					</c:forEach>
	            	
	            	<!-- 다음 페이지로(>) -->                     
					<li>
						<c:choose>
							<c:when test="${ pi.page < pi.maxPage }">
								<a href="${ contextPath }/commu/w-info?page=${ pi.page + 1}${ searchParam }">&gt;</a>
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
		
		
	</script>



</body>
</html>