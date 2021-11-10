<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	pageContext.setAttribute("newReply", "\n");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://unpkg.com/ress/dist/ress.min.css">
<!-- 외부 스타일 시트 -->
<link href="${ contextPath }/resources/css/notice/faqNotice.css" rel="stylesheet">
<title>고객센터_FAQ</title>
</head>
<body>
	<!-- 메뉴바 -->
	<jsp:include page="/WEB-INF/views/common/menubar.jsp" />
	
	<div class="csarea wrapper">
		<!-- cs 카테고리 -->
		<jsp:include page="/WEB-INF/views/notice/csCategory.jsp" />
		
		<div class="content">
			 <header class="faqheader">
                <div>FAQ</div>
            </header>
        
            <div class="typearea">
            	<div class="type_area">
	                <select class="atype" name="atype" id="atype" >
	                	<option value="0" class="a0" selected>전체</option>
	                    <c:forEach var="c" items="${ fcate }">
	                    	<c:if test="${ c.fref_no == 0 }">
		                    	<option value="${ c.fcate_no }">${ c.fcate_type }</option>
	                    	</c:if>
	                    </c:forEach>
	                </select>
	                <div class="faqarrow">
	                	<img src="${ contextPath }/resources/images/notice/faqarrow.png">
	                </div>
            	</div>
                <span class="typearrow">〉</span>
                <div class="type_area">
	                <select class="btype" name="btype" onchange="btypeChange()">
	                	<option value="0" class="a0">전체</option>
	                </select>
	                <div class="faqarrow">
	                	<img src="${ contextPath }/resources/images/notice/faqarrow.png">
                	</div>
                </div>
            </div>
        	
            <div class="top3">TOP 3</div>
            <div class="top3_list">
            	<c:forEach var="top" items="${ topList }">
	                <ul class="top3_ul">
                    	<li class="faq_q">[${ top.fcategory }]&nbsp;&nbsp;${ top.title }</li>
	                    <li class="faq_icon">▼</li>
	                </ul>
	                <div class="top3_a">
	                	<div class="top3_answer">${ fn:replace(top.reply, newReply, '<br>')}</div>
	                	<div class="top3_service">
	                		<img src="${ contextPath }/resources/images/notice/callcenter.png">
	                		<p>추가로 자세한 상담을 원하신다면 1:1문의를 이용해주세요</p>
	                		<button onclick="goOne()">1:1문의</button>
	                	</div>
	                </div>
            	</c:forEach>
            </div>
        
        	<!-- 영역을 더 잡아?? -->
            <div class="total">LIST</div>
            <div class="total_list">
            	<!-- 여기서 itmes는 서블릿에서 attr에 저장한 이름 = faqList -->
            	<c:forEach var="faq" items="${ faqList }">
	                <ul class="total_ul">
	                    <li class="faq_q">[${ faq.fcategory }]&nbsp;&nbsp;${ faq.title }</li>
	                    <li class="faq_icon">▼</li>
	                </ul>
	                <div class="total_a">
	                	<div class="total_answer"><p style="white-space: pre=line;">${ faq.reply }</p></div>
	                	<div class="total_service">
	                		<img src="${ contextPath }/resources/images/notice/callcenter.png">
	                		<p>추가로 자세한 상담을 원하신다면 1:1문의를 이용해주세요</p>
	                		<button onclick="goOne()">1:1문의</button>
	                	</div>
	                </div>
            	</c:forEach>
            </div>
            
            <div class="pagingarea">
	            <ul class="faq_paging">
	            	<!-- 앞으로 이동하는 버튼(<) -->
	            	<li>
					<c:choose>
						<c:when test="${ pi.page > 1 }">
							<a href="${ contextPath }/faq?page=${ pi.page - 1}">&lt;</a>
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
									<a href="${ contextPath }/faq?page=${ p }">${ p }</a>
								</c:otherwise>
							</c:choose>
						</li>
					</c:forEach>
	            	
	            	<!-- 다음 페이지로(>) -->
					<li>
						<c:choose>
							<c:when test="${ pi.page < pi.maxPage }">
								<a href="${ contextPath }/faq?page=${ pi.page + 1}">&gt;</a>
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
	
	<c:if test="">
	</c:if>
	
	 <script>
		$('.top3_ul').click(function(){
			if($(this).next($('div')).css('display') == 'none') {
				$('div.top3_a').slideUp();
				$(this).next($('div')).slideDown();
			} else {
				$(this).next($('div')).slideUp();
			}
		})
		
		$('.total_ul').click(function(){
			if($(this).next($('div')).css('display') == 'none') {
				$('div.total_a').slideUp();
				$(this).next($('div')).slideDown();
			} else {
				$(this).next($('div')).slideUp();
			}
		});	
		
	
		$(document).on('change', '.atype', bChange);
		function bChange() {
			if($(this).val() == 0) {
				location.href="${ contextPath }/faq?atype=0";
			} else if($(this).val() == 1) {
				location.href="${ contextPath }/faqA?atype=1&btype=0";
			} else if($(this).val() == 6) {
				location.href="${ contextPath }/faqB?atype=6&btype=0";
			} else if($(this).val() == 10) {
				location.href="${ contextPath }/faqC?atype=10&btype=0";
			} else if($(this).val() == 14) {
				location.href="${ contextPath }/faqD?atype=14&btype=0";
			}
		}
		
	</script>
	
	<c:choose>
		<c:when test="${ !empty loginUser }">
			<script>
				function goOne() {
					location.href="${ contextPath }/one/insert";
				}
			</script>
		</c:when>
		<c:otherwise>
			<script>
				function goOne() {
					alert("로그인 후 이용 가능합니다.");
					location.href='${ contextPath }/login';
				}
			</script>
		</c:otherwise>
	</c:choose>
</body>
</html>