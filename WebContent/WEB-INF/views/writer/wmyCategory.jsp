<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://unpkg.com/ress/dist/ress.min.css">
<!-- 외부 스타일 시트 -->
<link href="${ contextPath }/resources/css/wmyCategory.css" rel="stylesheet">
<title>w_mypage_category</title>
</head>
<body>
<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application"/>
	<div id="wmyct_area">
	    <aside class="category">
	        <div class="ca-head">마이페이지</div>
	        <div class="area1"><a class="ca-top" href="#">회원정보</a>
	            <ul class="ca-list">
	                <li><a href="#">회원정보 수정</a></li>
	                <li><a href="#">회원 탈퇴</a></li>
	            </ul>
	        </div>
	        <div class="area2"><a class="ca-top" href="#">MY 도서</a>
	            <ul class="ca-list">
	                <li><a href="#">도서 리스트</a></li>
	                <li><a href="#"> 도서 리뷰</a></li>
	            </ul>
	        </div>
	        <div class="area3"><a class="ca-top" href="#">작가 소통게시판</a>
	            <ul class="ca-list">
	                <li><a href="#">미답변 리스트</a></li>
                    <li><a href="#">전체 게시글</a></li>
	            </ul>
	        </div>
	    </aside>
	    
	    <div class="cs_ad">
			<img id="csad1" src="${ contextPath }/resources/images/ad8.png">
			<img id="csad2" src="${ contextPath }/resources/images/ad9.png">
		</div> 
	</div>
</body>
</html>