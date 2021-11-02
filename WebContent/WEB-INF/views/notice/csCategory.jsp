<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>cs_category</title>
<link rel="stylesheet" href="https://unpkg.com/ress/dist/ress.min.css">
<!-- 외부 스타일 시트 -->
<link href="<%= request.getContextPath() %>/resources/css/notice/csCategory.css" rel="stylesheet">
</head>
<body>
<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application"/>
	<div id="csct_area">
	    <aside class="category">
	        <div class="ca-head">고객센터</div>
	        <!-- 어떤거 클릭했는지 정보 보내기 -->
	        <div class="area1"><a class="ca-top" href="${ contextPath }/cs">FAQ</a>
	            <ul class="ca-list">
	                <li>
	                	<a href="${ contextPath }/faq">주문/결제</a>
	                </li>
	                <li>
	                	<a href="${ contextPath }/w-mypage">취소/교환/반품</a>
	                </li>
	                <li >
	                	<a href="#">배송</a>
	                </li>
	                <li >
	                	<a href="#">회원관리</a>
	                </li>
	            </ul>
	        </div>
	        <div class="area2"><a class="ca-top" href="${ contextPath }/one">1:1 문의</a>
	            <ul class="ca-list">
	                <li><a href="${ contextPath }/one/insert">1:1 문의하기</a></li>
	                <li><a href="${ contextPath }/one">1:1 문의내역</a></li>
	            </ul>
	        </div>
	        <div class="area3"><a class="ca-top" href="${ contextPath }/commu">작가 소통게시판</a>
	            <ul class="ca-list">
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
	
	<script>
		
	</script>
</body>
</html>