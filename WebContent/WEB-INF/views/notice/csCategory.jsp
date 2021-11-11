<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://unpkg.com/ress/dist/ress.min.css">
<!-- 외부 스타일 시트 -->
<link href="<%= request.getContextPath() %>/resources/css/notice/csCategory.css" rel="stylesheet">
<title>cs_category</title>
<!-- alert 창 출력 -->
<% if(session.getAttribute("msg") != null) { %>
<script>
	alert('<%= session.getAttribute("msg") %>');
</script>
<% 
	session.removeAttribute("msg");
	}
%>
</head>
<body>
<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application"/>
	<div id="csct_area">
	    <aside class="category">
	        <div class="ca-head"><a href="${ contextPath }/faq/insert">고객센터</a></div>
	        <!-- 어떤거 클릭했는지 정보 보내기 -->
	        <div class="area1"><a class="ca-top" href="${ contextPath }/cs">FAQ</a>
	            <ul class="ca-list">
	                <li onclick="faqA()"><a>주문/결제</a></li>
	                <li onclick="faqB()"><a>취소/교환/반품</a></li>
	                <li onclick="faqC()"><a>배송</a></li>
	                <li onclick="faqD()"><a>회원관리</a></li>
	            </ul>
	        </div>
	        <div class="area2"><p class="ca-top">1:1 문의</p>
	            <ul class="ca-list">
	                <li onclick="loginCheck()"><a>1:1 문의내역</a></li>
	                <li onclick="loginCheck2()"><a>1:1 문의하기</a></li>
	            </ul>
	        </div>
	        <div class="area3"><p class="ca-top">작가 소통게시판</p>
	            <ul class="ca-list">
	            	<li><a href="${ contextPath }/commu">소통 게시판</a></li>
	                <li><a href="${ contextPath }/commu/w-info">작가 소개</a></li>
	            </ul>
	        </div>
	        <div class="area4"><a class="ca-top" href="${ contextPath }/w-check">작가 인증게시판</a></div>
	    </aside>
	    
	    <div class="cs_ad">
			<img id="csad1" src="${ contextPath }/resources/images/ad8.png">
			<img id="csad2" src="${ contextPath }/resources/images/ad9.png">
		</div> 
	</div>
	
	<!-- 로그인 체크 -->
	<c:choose>
		<c:when test="${ !empty loginUser }">
			<script>
				function loginCheck(){
					location.href='${ contextPath }/one';
				}
				function loginCheck2(){
					location.href='${ contextPath }/one/insert';
				}
			</script>
		</c:when>
		<c:otherwise>
			<script>
				function loginCheck(){
					alert("로그인 후 이용 가능합니다.");
					location.href='${ contextPath }/login';
				}
				function loginCheck2(){
					alert("로그인 후 이용 가능합니다.");
					location.href='${ contextPath }/login';
				}
			</script>
		</c:otherwise>
	</c:choose>
	
	<script>
		function faqA(){
			location.href="${ contextPath}/faqA?atype=1&btype=0";
		};
		function faqB(){
			location.href="${ contextPath}/faqB?atype=6&btype=0";
		};
		function faqC(){
			location.href="${ contextPath}/faqC?atype=10&btype=0";
		};
		function faqD(){
			location.href="${ contextPath}/faqD?atype=14&btype=0";
		};
	</script>
</body>
</html>