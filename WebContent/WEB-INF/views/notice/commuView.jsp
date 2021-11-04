<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://unpkg.com/ress/dist/ress.min.css">
<!-- 외부 스타일 시트 -->
<link href="${ contextPath }/resources/css/notice/commu.css" rel="stylesheet">
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
            <header class="commu_header">
                <div>소통게시판</div>
                <div class="commun_writerinfo">
                    <button type="button" onclick="location.href='${ contextPath }/commu/w-info'">작가 소개</button>
                </div>
            </header>
            <div class="commu_ment">
                <ul>
                    <li>이 게시판은 작가와 소통할 수 있는 봄숲만의 특별한 게시판 입니다.</li>
                    <li>작가에게 그동안 궁금했던 질문들을 직접 질문해 보세요.</li>
                </ul>
            </div>

            <div class="commu_area1">
                <span>목록</span>
                <span>
                    <input type="checkbox" name="mylist" value=""><label>내가 쓴 글만 보기</label>
                    <button type="button" onclick="location.href='${ contextPath }/commu/insert'">글 작성</button>
                </span>
            </div>

            <div class="commu_area2">
                <div class="commu_listarea">
                    <ul class="commu_listtop">
                        <li class="commu_no">번호</li>
                        <li class="commu_writer">소통작가</li>
                        <li class="commu_title">제목</li>
                        <li class="commu_user">작성자</li>
                        <li class="commu_date">등록일</li>
                        <li class="commu_status">상태</li>
                    </ul>
                    <c:forEach var="commu" items="${ commuList }">
	                    <ul class="commu_list" onclick="detailView(${ commu.commu_no })">
	                        <li class="commu_no">${ commu.commu_no }</li>
	                        <li class="commu_writer writer2">${ commu.cwriter_name }</li>
	                        <li class="commu_title title2">${ commu.ctitle }</li>
	                        <li class="commu_user user2">${ commu.user_no }</li>
	                        <li class="commu_date">${ commu.create_date }</li>
	                        <li class="commu_status" id="commuStatus" value="${ commu.status }">
	                        	<c:choose>
		                        	<c:when test="${ commu.status == 'N' }">미답변</c:when>
		                        	<c:otherwise>답변완료</c:otherwise>
		                        </c:choose>
	                        </li>
	                    </ul>                    
                    </c:forEach>
                </div>
                
                <div class="pagingarea">
                    <ul class="commu_paging">
		            	<!-- 앞으로 이동하는 버튼(<) -->
		            	<li>
						<c:choose>
							<c:when test="${ pi.page > 1 }">
								<a href="${ contextPath }/commu?page=${ pi.page - 1}">&lt;</a>
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
										<a href="${ contextPath }/commu?page=${ p }">${ p }</a>
									</c:otherwise>
								</c:choose>
							</li>
						</c:forEach>
		            	
		            	<!-- 다음 페이지로(>) -->                     
						<li>
							<c:choose>
								<c:when test="${ pi.page < pi.maxPage }">
									<a href="${ contextPath }/commu?page=${ pi.page + 1}">&gt;</a>
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
	
	
	<script>
		function detailView(communo){
			location.href='${ contextPath }/commu/detail?commu_no=' + communo;
		}
		
		
		
		
		
		
		
	</script>
	
	<!-- 로그인 유저 생기면~~~ -->
	<%-- <c:choose>
		<c:when test="${ !empty loginUser }">
			<script>
				function detailView(bid){
					location.href='${ contextPath }/board/detail?bid=' + bid;
				}
			</script>
		</c:when>
		<c:otherwise>
			<script>
				function detailView(bid){
					alert("로그인 후 이용 가능합니다.");
					location.href='${ contextPath }/login'
				}
			</script>
		</c:otherwise>
	</c:choose> --%>
</body>
</html>