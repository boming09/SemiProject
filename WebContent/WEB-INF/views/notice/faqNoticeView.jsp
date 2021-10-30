<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://unpkg.com/ress/dist/ress.min.css">
<!-- 외부 스타일 시트 -->
<link href="${ contextPath }/resources/css/faqNotice.css" rel="stylesheet">
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
	                    	<img src="${ contextPath }/resources/images/magnifier.png">
	                   	</button>
                	</form>
                </div>
            </header>
        
            <div class="typearea">
            	<div class="type_area">
	                <select class="atype">
	                	<option>전체</option>
	                    <option selected>주문/결제</option>
	                    <option>취소/교환/반품</option>
	                    <option>배송</option>
	                    <option>회원관리</option>
	                </select>
	                <div class="faqarrow">
	                	<img src="${ contextPath }/resources/images/faqarrow.png">
	                </div>
            	</div>
                <span class="typearrow">〉</span>
                <div class="type_area">
	                <select class="btype">
	                	<option>전체</option>
	                    <option>주문/주문확인</option>
	                    <option>주문변경</option>
	                    <option>결제정보</option>
	                    <option>세금계산서/영수증</option>
	                </select>
	                <div class="faqarrow">
	                	<img src="${ contextPath }/resources/images/faqarrow.png">
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
	                	<div class="top3_answer">답변내용~~어쩌고 저쩌고<br>
	                	블라블라<br>메롱메롱</div>
	                	<div class="top3_service">
	                		<img src="${ contextPath }/resources/images/callcenter.png">
	                		<p>추가로 자세한 상담을 원하신다면 1:1문의를 이용해주세요</p>
	                		<button>1:1문의</button>
	                	</div>
	                </div>
            	</div>
            	<div>
	                <ul class="top3_ul">
	                    <li class="faq_type">[세금계산서]</li>
                   		<li class="faq_q">총 리스트영역 여긴 나중에 반복문 돌려돌려</li>	
	                    <li class="faq_icon">▼</li>
	                </ul>
	                <div class="top3_a">
	                	<div class="top3_answer">답변내용~~어쩌고 저쩌고<br>
	                	블라블라<br>메롱메롱</div>
	                	<div class="top3_service">
	                		<img src="${ contextPath }/resources/images/callcenter.png">
	                		<p>추가로 자세한 상담을 원하신다면 1:1문의를 이용해주세요</p>
	                		<button>1:1문의</button>
	                	</div>
	                </div>
            	</div>
            	<div>
	                <ul class="top3_ul">
	               		<li class="faq_type">[세금계산서]</li>
	                    <li class="faq_q">해당질문 여긴 나중에 반복문 돌려돌려</li>
	                    <li class="faq_icon">▼</li>
	                </ul>
	                <div class="top3_a">
	                	<div class="top3_answer">답변내용~~어쩌고 저쩌고<br>
	                	블라블라<br>메롱메롱</div>
	                	<div class="top3_service">
	                		<img src="${ contextPath }/resources/images/callcenter.png">
	                		<p>추가로 자세한 상담을 원하신다면 1:1문의를 이용해주세요</p>
	                		<button>1:1문의</button>
	                	</div>
	                </div>
            	</div>
	               
            </div>
        
        	<!-- 영역을 더 잡아?? -->
            <div class="total">LIST</div>
            <div class="total_list">
                <ul class="total_ul">
                    <li class="faq_type">[세금계산서]</li>
                    <li class="faq_q">총 리스트영역 여긴 나중에 반복문 돌려돌려</li>
                    <li class="faq_icon">▼</li>
                </ul>
            </div>
	    </div>
	    <!-- 광고  -->
		<jsp:include page="/WEB-INF/views/common/adArea.jsp" />
		
	</div>

	<!-- footer -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	
	
	 <script type="text/javascript">
		$('.top3_ul').click(function(){
			if($(this).next($('div')).css('display') == 'none') {
				$('div.top3_a').slideUp();
				$(this).next($('div')).slideDown();
			} else {
				$(this).next($('div')).slideUp();
			}
		})
	</script>
</body>
</html>