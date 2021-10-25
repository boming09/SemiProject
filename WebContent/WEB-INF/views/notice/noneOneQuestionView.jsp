<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://unpkg.com/ress/dist/ress.min.css">
<!-- 외부 스타일 시트 -->
<link href="<%= request.getContextPath() %>/resources/css/noneOneQuestion.css" rel="stylesheet">
<title>noneOneQuestionView</title>
</head>
<body>
	<!-- 고객센터 사이드 FAQ-주문/결제 클릭시 첫 화면 -->
	<!-- 메뉴바 -->
	<%@ include file="/WEB-INF/views/common/menubar.jsp" %>
	
	<div class="csarea wrapper">
		<!-- cs 카테고리 -->
		<%@ include file="/WEB-INF/views/notice/csCategory.jsp" %>
		
		<div class="content">
		    <header class="one_header">
		        <div>1:1 문의</div>
		        <div class="one_question">
		            <button type="button" onclick="location.href='<%= request.getContextPath() %>/one/question'">1:1 문의하기</button>
		        </div>
		    </header>
		    <div class="one_ment">
		        <ul>
		            <li>평일 오후 5시 이후 문의는 당일 답변이 어려울 수 있습니다.</li>
		            <li>토, 일요일 및 공휴일 문의는 평일 운영 시간 내 순차적으로 답변드리겠습니다.</li>
		        </ul>
		    </div>
		    <div class="one_none_ment">
		        <span class="none_span1">최근 3개월간 문의 내역이 없습니다.</span>
		        <span class="none_span2">봄숲에 대한 모든 궁금증은 1:1 문의하기로 부담없이 확인하세요.</span>
		    </div>
		</div>
	</div>
</body>
</html>