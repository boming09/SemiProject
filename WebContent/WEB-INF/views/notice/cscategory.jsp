<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>cs_category</title>
<link rel="stylesheet" href="https://unpkg.com/ress/dist/ress.min.css">
<!-- 외부 스타일 시트 -->
<link href="<%= request.getContextPath() %>/resources/css/cscategory.css" rel="stylesheet">
</head>
<body>
    <aside class="category">
        <div class="ca-head">고객센터</div>
        <div class="area1"><a class="ca-top" href="<%= request.getContextPath() %>/cs">FAQ</a>
            <ul class="ca-list">
                <li><a href="<%= request.getContextPath() %>/faq">주문/결제</a></li>
                <li><a href="#">취소/교환/반품</a></li>
                <li><a href="#">배송</a></li>
                <li><a href="#">회원관리</a></li>
            </ul>
        </div>
        <div class="area2"><a class="ca-top" href="<%= request.getContextPath() %>/one">1:1 문의</a>
            <ul class="ca-list">
                <li><a href="<%= request.getContextPath() %>/one/question">1:1 문의하기</a></li>
                <li><a href="<%= request.getContextPath() %>/one">1:1 문의내역</a></li>
            </ul>
        </div>
        <div class="area3"><a class="ca-top" href="#">작가 소통게시판</a>
            <ul class="ca-list">
                <li><a href="#">작가 소개</a></li>
            </ul>
        </div>
        <div class="area4"><a class="ca-top" href="#">작가 인증게시판</a></div>
        <div><img src="#">광고1</div>
        <div><img src="#">광고2</div>
    </aside>
</body>
</html>