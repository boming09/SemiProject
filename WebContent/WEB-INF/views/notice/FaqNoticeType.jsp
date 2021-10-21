<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://unpkg.com/ress/dist/ress.min.css">
<!-- 외부 스타일 시트 -->
<link href="<%= request.getContextPath() %>/resources/css/faqnoticetype.css" rel="stylesheet">
<title>Insert title here</title>
</head>
<body>
	<!-- 고객센터 사이드 FAQ-주문/결제 클릭시 첫 화면 -->
	<!-- 메뉴바 -->
	<%@ include file="/WEB-INF/views/common/menubar.jsp" %>
	
	<div class="csarea wrapper">
		<!-- cs 카테고리 -->
		<%@ include file="/WEB-INF/views/notice/cscategory.jsp" %>
		
		<div class="content">
			 <header class="faqheader">
                <div>FAQ</div>
                <div class="faqsearch">
                    <input type="text" placeholder="FAQ 검색"></input>
                    <button>
                    	<img src="<%= request.getContextPath() %>/resources/images/magnifier.png">
                   	</button>
                </div>
            </header>
        
            <div class="typearea">
            	<div class="type_area">
	                <select class="atype">
	                    <option>주문/결제</option>
	                    <option>취소/교환/반품</option>
	                    <option>배송</option>
	                    <option>회원관리</option>
	                </select>
	                <div class="faqarrow">
	                	<img src="<%= request.getContextPath() %>/resources/images/faqarrow.png">
	                </div>
            	</div>
                <span class="typearrow">〉</span>
                <div class="type_area">
	                <select class="btype">
	                    <option>주문/주문확인</option>
	                    <option>주문변경</option>
	                    <option>결제정보</option>
	                    <option>세금계산서/영수증</option>
	                </select>
	                <div class="faqarrow">
	                	<img src="<%= request.getContextPath() %>/resources/images/faqarrow.png">
                	</div>
                </div>
            </div>
        
            <div class="top3">TOP 3</div>
            <div class="top3_list">
                <ul class="top3_ul">
                    <li class="faq_type">[주문확인]</li>
                    <li class="faq_q">분류 해당질문 여긴 나중에 반복문 돌려돌려</li>
                    <li class="faq_icon">▼</li>
                </ul>
            </div>
        
            <div class="total">LIST</div>
            <div class="total_list">
                <ul class="total_ul">
                    <li class="faq_type">[세금계산서]</li>
                    <li class="faq_q">총 리스트영역 여긴 나중에 반복문 돌려돌려</li>
                    <li class="faq_icon">▼</li>
                </ul>
            </div>
	    </div>
	</div>
</body>
</html>