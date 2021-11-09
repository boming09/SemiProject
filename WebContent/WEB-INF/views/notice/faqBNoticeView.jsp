<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	<!-- 고객센터 사이드 FAQ-주문/결제 클릭시 첫 화면 -->
	<!-- 메뉴바 -->
	<jsp:include page="/WEB-INF/views/common/menubar.jsp" />
	
	<div class="csarea wrapper">
		<!-- cs 카테고리 -->
		<jsp:include page="/WEB-INF/views/notice/csCategory.jsp" />
		
		<div class="content">
			 <header class="faqheader">
                <div>FAQ</div>
                <div class="faqsearch">
                	<form class="faqsearch">
	                    <input type="text" placeholder="FAQ 검색"></input>
	                    <button>
	                    	<img src="${ contextPath }/resources/images/notice/magnifier.png">
	                   	</button>
                	</form>
                </div>
            </header>
        
            <div class="typearea">
            	<div class="type_area">
	                <select class="atype" name="atype" id="atype" >
	                	<!-- valeu값 = db category_no -->
	                	<option value="0" class="a0">전체</option>
	                    <option value="1" class="a1">주문/결제</option>
	                    <option value="6" class="a6" selected>취소/교환/반품</option>
	                    <option value="10" class="a10">배송</option>
	                    <option value="14" class="a14">회원관리</option>
	                </select>
	                <div class="faqarrow">
	                	<img src="${ contextPath }/resources/images/notice/faqarrow.png">
	                </div>
            	</div>
                <span class="typearrow">〉</span>
                <div class="type_area">
	                <select class="btype" name="btype">
	                	<option value="0" class="a0">전체</option>
	                    <option value="2" class="a1">주문/주문확인</option>
	                    <option value="3" class="a1">주문변경</option>
	                    <option value="4" class="a1">결제정보</option>
	                    <option value="5" class="a1">세금계산서/영수증</option>
	                    <option value="7" class="a6">취소/취소환불</option>
	                    <option value="8" class="a6">교환</option>
	                    <option value="9" class="a6">반품/반품환불</option>    
	                    <option value="11" class="a10">배송정보</option>
	                    <option value="12" class="a10">해외배송</option>
	                    <option value="13" class="a10">배송비</option>
	                    <option value="15" class="a14">회원가입/탈퇴</option>
	                    <option value="16" class="a14">회원정보 확인/변경</option>
	                    <option value="17" class="a14">작가회원 인증</option>                
	                </select>
	                <div class="faqarrow">
	                	<img src="${ contextPath }/resources/images/notice/faqarrow.png">
                	</div>
                </div>
            </div>
        	
            <div class="top3">TOP 3</div>
            <div class="top3_list">
            	<div>
	                <ul class="top3_ul">
	                    <li class="faq_type">[세금계산서]</li>
                    	<li class="faq_q">총 리스트영역 여긴 나중에 반복문 돌려돌려</li>
	                    <li class="faq_icon">▼</li>
	                </ul>
	                <div class="top3_a">
	                	<div class="top3_answer"></div>
	                	<div class="top3_service">
	                		<img src="${ contextPath }/resources/images/notice/callcenter.png">
	                		<p>추가로 자세한 상담을 원하신다면 1:1문의를 이용해주세요</p>
	                		<button>1:1문의</button>
	                	</div>
	                </div>
            	</div>
            	
	               
            </div>
        
        	<!-- 영역을 더 잡아?? -->
            <div class="total">LIST</div>
            <div class="total_list">
            	<!-- 여기서 itmes는 서블릿에서 attr에 저장한 이름 = faqList -->
            	<c:forEach var="faq" items="${ faqList }">
	                <ul class="total_ul">
	                   <%--  <li class="faq_type">[${ faq.fcategory }]</li> --%>
	                    <li class="faq_q">[${ faq.fcategory }]&nbsp;&nbsp;${ faq.title }</li>
	                    <li class="faq_icon">▼</li>
	                </ul>
	                <div class="total_a">
	                	<div class="total_answer">${ faq.reply }</div>
	                	<div class="total_service">
	                		<img src="${ contextPath }/resources/images/notice/callcenter.png">
	                		<p>추가로 자세한 상담을 원하신다면 1:1문의를 이용해주세요</p>
	                		<button>1:1문의</button>
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
				/* $(this).css({background:'#f3f5f7'}); */
			} else {
				$(this).next($('div')).slideUp();
			}
		});	
		
	
		if($('#atype').val() == 6){
			$('.btype').val(0);
			$('.btype').find('.a1').hide();
			$('.btype').find('.a6').show();
			$('.btype').find('.a10').hide();
			$('.btype').find('.a14').hide();
		} 
		
	
		$(document).on('change', '.atype', bChange);
		function bChange() {
			if($(this).val() == 0) {
				$('.btype').val(0);
				$('.btype').find('.a1').hide();
				$('.btype').find('.a6').hide();
				$('.btype').find('.a10').hide();
				$('.btype').find('.a14').hide();
			} else if($(this).val() == 1) {
				$('.btype').val(0);
				$('.btype').find('.a1').show();
				$('.btype').find('.a6').hide();
				$('.btype').find('.a10').hide();
				$('.btype').find('.a14').hide();
			} else if($(this).val() == 6) {
				$('.btype').val(0);
				$('.btype').find('.a1').hide();
				$('.btype').find('.a6').show();
				$('.btype').find('.a10').hide();
				$('.btype').find('.a14').hide();
			} else if($(this).val() == 10) {
				$('.btype').val(0);
				$('.btype').find('.a1').hide();
				$('.btype').find('.a6').hide();
				$('.btype').find('.a10').show();
				$('.btype').find('.a14').hide();
			} else {
				$('.btype').val(0);
				$('.btype').find('.a1').hide();
				$('.btype').find('.a6').hide();
				$('.btype').find('.a10').hide();
				$('.btype').find('.a14').show();
			}
		}
		

	</script>
</body>
</html>