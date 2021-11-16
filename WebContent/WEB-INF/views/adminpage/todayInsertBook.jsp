<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://unpkg.com/ress/dist/ress.min.css">
<!-- 외부 스타일 시트 -->
<link href="${ contextPath }/resources/css/notice/oneQuestionInsert.css"
	rel="stylesheet">
<style>
.q_titlearea .q_title{
}

select option {
  background: rgb(196, 217, 195);
  color: black;
  padding: 3px 0;
  font-weight: bold;
}
</style>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


</head>
<body>
	<jsp:include page="/WEB-INF/views/common/menubar.jsp" />

<div class="csarea wrapper">
<jsp:include page="/WEB-INF/views/adminpage/adminCategory.jsp" />
	<div class="content">
	<header class="one_header">
                <div>오늘의 책</div>
            </header>
		<form class="q_info" action="${ contextPath }/admin/tinsert" method="post" enctype="multipart/form-data">
			<div class="q_titlearea">
				<span class="q_title">도서 명</span><span class="q_title2">
				<input type="text" name="title" required></span>
			</div>
			<div class="q_titlearea">
				<span class="q_title">카테고리</span><span class="q_title2">
					<select onchange="cselectTest(this.value);" name="category" id="category" style="background: rgb(196, 217, 195); text-align: center; border: 1px solid black; width: 100px; font-weight: bold; margin-left: 5px;">
								<option value="" selected hidden>대분류▼</option>
								<option value="1">국내도서</option>
								<option value="2">국외도서</option>
								<option value="3">eBook</option>
					</select>
					<select name="category2" style="background: rgb(196, 217, 195); text-align: center; border: 1px solid black; width: 250px; font-weight: bold; margin-left: 5px;" required>
								<option value="" hidden>소분류▼</option>
					</select>
				</span>
			</div>
			
			<div class="q_titlearea">
				<span class="q_title">저자 명</span><span class="q_title2">
				<input type="text" name="author" style="margin-left: 5px;"required></span>
				<span class="q_title">역자 명</span><span class="q_title2">
				<input type="text" name="editor" style="margin-left: 5px;"></span>
				<span class="q_title">출판사</span><span class="q_title2">
				<input type="text" name="publisher" style="margin-left: 5px;"required></span>
			</div>
			
			<div class="q_titlearea">
				<span class="q_title">정가</span><span class="q_title2">
				<input type="text" name="price" required></span>
				<span class="q_title">판매가</span><span class="q_title2">
				<input type="text" name="salePrice" required></span>
				<span class="q_title">출판일</span><span class="q_title2">
				<input type="date" name="pdate" required></span>
			</div>

			<div class="q_contentarea">
				<span class="q_content">책 소개</span>
				<div class="q_content2">
					<span><textarea name="intro"></textarea></span>
				</div>
			</div>
			
			<div class="q_contentarea">
				<span class="q_content">저자 소개</span>
				<div class="q_content2">
					<span><textarea name="authorIntro"></textarea></span>
				</div>
			</div>

			<div class="q_titlearea">
				<span class="q_title">책 링크</span><span class="q_title2">
				<input type="text" name="url"></span>
			</div>
			
			<div class="q_filearea">
				<span class="q_file">책 이미지</span>
				<div class="q_file2">
					<span class="q_uplode"><input type="file" name="file"
						accept="image/gif,image/jpeg,image/png"></span>
					<ul>
						<li>첨부가능 용량은 10MB 미만입니다.</li>
						<li>첨부가능 파일확장자 : jpg, gif, bmp, png</li>
					</ul>
				</div>
				<span class="q_file">책 상세</span>
				<div class="q_file2">
					<span class="q_uplode"><input type="file" name="file2"
						accept="image/gif,image/jpeg,image/png"></span>
					<ul>
						<li>첨부가능 용량은 10MB 미만입니다.</li>
						<li>첨부가능 파일확장자 : jpg, gif, bmp, png</li>
					</ul>
				</div>
			</div>
			<div class="q_btn">
				<button type="button" onclick="location.href='${ contextPath }'">취소</button>
				<button type="submit">등록</button>
			</div>
		</form>
	</div>
</div>
<script>
	function cselectTest(obj){
		var $target = $("select[name=category2]");
		$target.empty();
		if(obj == 1){
			<c:forEach items="${ cList }" var="item">
				$target.append('<option value=\"${item.cid}\">${item.cname}</option>');
			</c:forEach>
		} else if(obj == 2){
			<c:forEach items="${ cList2 }" var="item">
				$target.append('<option value=\"${item.cid}\">${item.cname}</option>');
			</c:forEach>
		} else if(obj == 3){
			<c:forEach items="${ cList3 }" var="item">
				$target.append('<option value=\"${item.cid}\">${item.cname}</option>');
			</c:forEach>
		} else{
			$target.append('<option value=\"\" hidden>소분류▼</option>');
		}
		
	}
	
	
</script>


</body>
</html>