<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://unpkg.com/ress/dist/ress.min.css">
<!-- 외부 스타일 시트 -->
<link href="${ contextPath }/resources/css/notice/writerCheck.css" rel="stylesheet">
<title>작가인증게시판</title>
</head>
<body>
	<!-- 메뉴바 -->
	<jsp:include page="/WEB-INF/views/common/menubar.jsp" />
	
	<div class="csarea wrapper">
		<!-- cs 카테고리 -->
		<jsp:include page="/WEB-INF/views/notice/csCategory.jsp" />
		
		 <div class="content">
            <div class="wcheck_header">작가 인증게시판</div>
            <div class="wcheck_ment">
                <ul>
                    <li>평일 오후 5시 이후 신청은 당일 확인이 어려울 수 있습니다.</li>
                    <li>토, 일요일 및 공휴일 신청은 평일 운영 시간 내 순차적으로 확인해드리겠습니다.</li>
                    <li>작가 인증 확인시 다소 시간이 걸릴 수도 있으니 이점 양해바랍니다.</li>
                </ul>
            </div>

            <div class="wcheck_area1">
                <span>인증 리스트</span>
                <span>
                    <input type="checkbox" id="mypost"><label>내가 쓴 글만 보기</label>
                    <button type="button" onclick="loginCheck()">글 작성</button>
                </span>
            </div>

            <div class="wcheck_area2">
                <div class="wcheck_listarea">
                    <ul class="wcheck_listtop">
                        <li class="wcheck_no">번호</li>
                        <li class="wcheck_title">제목</li>
                        <li class="wcheck_user">작성자</li>
                        <li class="wcheck_date">등록일</li>
                        <li class="wcheck_status">상태</li>
                    </ul>
                    <c:forEach var="wcheck" items="${ wcheckList }">
	                    <%-- <input type="hidden" id="wuser_no" value="${ wcheck.user_no }"> --%>
	                    <ul class="wcheck_list" onclick="loginCheckDetail(${ wcheck.wck_no })">
	                        <li class="wcheck_no">${ wcheck.wck_no }</li>
	                        <li class="wcheck_title">${ wcheck.wtitle }</li>
	                        <li class="wcheck_user">${ wcheck.user_name }</li>
	                        <li class="wcheck_date">${ wcheck.create_date }</li>
	                        <li class="wcheck_status" value="${ wcheck.status }">
	                        	<c:choose>
		                        	<c:when test="${ wcheck.status == 'N' }">미확인</c:when>
		                        	<c:otherwise>확인완료</c:otherwise>
		                        </c:choose>
	                        </li>
	                    </ul>
                    </c:forEach>
                </div>
                
                <div class="pagingarea">
                    <ul class="wcheck_paging">
		            	<!-- 앞으로 이동하는 버튼(<) -->
		            	<li>
						<c:choose>
							<c:when test="${ pi.page > 1 }">
								<a href="${ contextPath }/w-check?page=${ pi.page - 1}">&lt;</a>
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
										<a href="${ contextPath }/w-check?page=${ p }">${ p }</a>
									</c:otherwise>
								</c:choose>
							</li>
						</c:forEach>
		            	
		            	<!-- 다음 페이지로(>) -->                     
						<li>
							<c:choose>
								<c:when test="${ pi.page < pi.maxPage }">
									<a href="${ contextPath }/w-check?page=${ pi.page + 1}">&gt;</a>
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
	
	<!-- 체크박스 클릭시(내가쓴글) 회원번호 넘기기 -->
	<form name="mypostForm" method="get">
			<input type="hidden" name="userNo" value="${ loginUser.userNo }">
	</form>
	
	<!-- 로그인 체크 -->
	<c:choose>
		<c:when test="${ !empty loginUser }">
			<script>
				// 인증게시판 글쓰기 로그인 후 이용가능
				function loginCheck() {
					location.href='${ contextPath }/w-check/insert';
				}
				// 내가 쓴 글 클릭시 = 로그인 되어있어야...
				$("#mypost").click(function(){
					if($("#mypost").prop("checked")) {
						document.forms.mypostForm.action = "${ contextPath }/w-check";
						document.forms.mypostForm.submit(); 
					} 
				});
				
				function loginCheckDetail(wckno) {
					location.href='${ contextPath }/w-check/detail?wck_no=' + wckno;
				} 
				
			</script>
		</c:when>
		<c:otherwise>
			<script>
				function loginCheck() {
					alert("로그인 후 이용 가능합니다.");
					location.href='${ contextPath }/login';
				}	
				
				function loginCheckDetail(wckno) {
					alert("로그인 후 이용 가능합니다.");
					location.href='${ contextPath }/login';
				} 
			</script>
		</c:otherwise>
	</c:choose>
		 
<%-- 	<c:choose>
		<c:when test="${ loginUser.userNo == wcheck.user_no }">
			<script>
				// 인증게시판 상세페이지 자기 게시물만 볼 수 있음
				function loginCheckDetail(wckno) {
					location.href='${ contextPath }/w-check/detail?wck_no=' + wckno;
				}
			</script>
		</c:when>
		<c:otherwise>
			<script>
				function loginCheckDetail() {
					alert("작성한 게시글이 아닙니다. 다시 확인해주세요.");
					//location.href='${ contextPath }/w-check';
				}
				
			</script>
		</c:otherwise>
	</c:choose> --%> 
	
	
	<%-- <c:if test="${ loginUser.userNo == wcheck.user_no }">
		<script>
			// 인증게시판 상세페이지 자기 게시물만 볼 수 있음
			function loginCheckDetail(wckno) {
				location.href='${ contextPath }/w-check/detail?wck_no=' + wckno;
			}
		</script>
	</c:if>
	<c:if test="${ loginUser.userNo != wcheck.user_no }">
		<script>
			// 인증게시판 상세페이지 자기 게시물만 볼 수 있음
			function loginCheckDetail(wckno) {
				alert("작성한 게시글이 아닙니다. 다시 확인해주세요.");
				//location.href='${ contextPath }/w-check';
			}
		</script>
	</c:if> --%>
	
	
	
</body>
</html>