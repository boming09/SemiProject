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
                    <input type="checkbox" id="mypost" value="${ loginUser.userNo }" <c:if test="${ !empty param.user_no }">checked</c:if>>
                    	<label>내가 쓴 글만 보기</label>
                    <button type="button" onclick="wcloginCheck()">글 작성</button>
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
	                    <ul class="wcheck_list" onclick="loginCheckDetail(${ wcheck.wck_no })">
	                        <li class="wcheck_no">${ wcheck.wck_no }</li>
	                        <li class="wcheck_title">${ wcheck.wtitle }</li>
	                        <li class="wcheck_user">${ wcheck.user_name }</li>
	                        <li class="wcheck_date">${ wcheck.create_date }</li>
                        	<c:choose>
	                        	<c:when test="${ wcheck.status == 'N' }">
	                        		<li class="wcheck_status" value="${ wcheck.status }" style="color:red;">미확인</li>
	                        	</c:when>
	                        	<c:otherwise>
	                        		<li class="wcheck_status" value="${ wcheck.status }" style="color:rgb(73, 125, 78);">확인완료</li>
	                        	</c:otherwise>
	                        </c:choose>
	                    </ul>
                    </c:forEach>
                </div>
                
        		<!-- 내가쓴글 체크시 -->
				<c:if test="${ !empty param.user_no }">
					<c:set var="searchParam" value="&user_no=${ loginUser.userNo }"/>
				</c:if> 
                
                <div class="pagingarea">
                    <ul class="wcheck_paging">
		            	<!-- 앞으로 이동하는 버튼(<) -->
		            	<li>
						<c:choose>
							<c:when test="${ pi.page > 1 }">
								<a href="${ contextPath }/w-check?page=${ pi.page - 1}${ searchParam }">&lt;</a>
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
										<a href="${ contextPath }/w-check?page=${ p }${ searchParam }">${ p }</a>
									</c:otherwise>
								</c:choose>
							</li>
						</c:forEach>
		            	
		            	<!-- 다음 페이지로(>) -->                     
						<li>
							<c:choose>
								<c:when test="${ pi.page < pi.maxPage }">
									<a href="${ contextPath }/w-check?page=${ pi.page + 1}${ searchParam }">&gt;</a>
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
	
	<!-- 로그인 체크 -->
	<c:choose>
		<c:when test="${ !empty loginUser }">
			<script>
				// 인증게시판 글쓰기 로그인 후 이용가능
				function wcloginCheck() {
					location.href='${ contextPath }/w-check/insert';
				}
				// 내가 쓴 글 클릭시 = 로그인 되어있어야...
				$("#mypost").click(function(){
					if($("#mypost").prop("checked")) {
						location.href='${ contextPath }/w-check?page=1&user_no=' + $("#mypost").val();
					} else {
						location.href='${ contextPath }/w-check';
					}
				});
				
				function loginCheckDetail(wckno) {
					location.href='${ contextPath }/w-check/detail?wck_no=' + wckno;
				} 
				
			</script>
		</c:when>
		<c:otherwise>
			<script>
				function wcloginCheck() {
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
	

	
</body>
</html>