<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://unpkg.com/ress/dist/ress.min.css">
<!-- 외부 스타일 시트 -->
<link href="<%= request.getContextPath() %>/resources/css/writerInfo.css" rel="stylesheet">
<title>writerIntroView</title>
</head>
<body>
	<!-- 고객센터 사이드 FAQ-주문/결제 클릭시 첫 화면 -->
	<!-- 메뉴바 -->
	<%@ include file="/WEB-INF/views/common/menubar.jsp" %>
	
	<div class="csarea wrapper">
		<!-- cs 카테고리 -->
		<%@ include file="/WEB-INF/views/notice/csCategory.jsp" %>
		
		<div class="content">
			<header class="winfo_header">
                <div>봄숲 작가 소개</div>
                <div class="winfo_search">
                    <form class="winfo_search">
	                    <input type="text" placeholder="작가 검색"></input>
	                    <button>
	                    	<img src="<%= request.getContextPath() %>/resources/images/magnifier.png">
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
                    <button type="button" onclick="location.href='<%= request.getContextPath() %>/commu'">소통 게시판</button>
                </div>
            </div>

            <div class="w_profilearea">
                <div class="w_profile"><img src="<%= request.getContextPath() %>/resources/images/writer1.png"></div>
                <div class="w_introduce">
                    <span>정다정 작가님<img src="<%= request.getContextPath() %>/resources/images/writer_check1.png"></span>
                    <span>안녕하세요! 소개 반복문 돌려돌려~~</span>
                </div>
            </div>
		</div>
		<!-- 광고  -->
		<%@ include file="/WEB-INF/views/common/adArea.jsp" %>
	</div>
	
	<!-- footer -->
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>