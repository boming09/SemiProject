<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://unpkg.com/ress/dist/ress.min.css">
<link href="<%= request.getContextPath() %>/resources/css/adminPage.css" rel="stylesheet">
</head>
<body>
		<aside>
			<ul id="navi">
				<li class="group">
					<div class="title">통계</div>
					<ul class="sub">
						<li><a href="${ contextPath }/admin/stats">통계</a></li>
					</ul>
				</li>
				<li class="group">
					<div class="title">회원</div>
					<ul class="sub">
						<li><a href="${ contextPath }/admin/member">계정 관리</a></li>
						<li><a href="${ contextPath }/admin/grade">등급 관리</a></li>
						<li><a href="${ contextPath }/admin/reply">문의 답변</a></li>
					</ul>
				</li>
				<li class="group">
					<div class="title">배송</div>
					<ul class="sub">
						<li><a href="${ contextPath }/admin/ship">배송 관리</a></li>
						<li><a href="${ contextPath }/admin/refund">환불 관리</a></li>
					</ul>
					<li class="group">
					<div class="title">홈페이지 관리</div>
					<ul class="sub">
						<li><a href="${ contextPath }/admin/insertbook">도서 등록</a></li>
						<li><a href="${ contextPath }/admin/stockbook">도서 재고 관리</a></li>
						<li><a href="${ contextPath }/faq/insert">자주하는 질문</a></li>
					</ul>
				</li>
			</ul>
		</aside>
		
	<script type="text/javascript"
		src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
	<script>
		$(document).ready(function() {
			$(".sub").css({
				display : "none"
			});

			$(".title").click(function() {
				$(".sub").each(function() {
					console.log($(this).css("display"));
					if ($(this).css("display") == "block") {
						$(this).slideUp("fast");
					}
				});
				$(this).next("ul").slideDown("fast");
			})
		});
	</script>
</body>
</html>