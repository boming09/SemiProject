<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://unpkg.com/ress/dist/ress.min.css">
<!-- 외부 스타일 시트 -->
<link href="${ contextPath }/resources/css/notice/oneQuestionInsert.css" rel="stylesheet">
<title>고객센터_1:1문의</title>
</head>
<body>
	<!-- 메뉴바 -->
	<jsp:include page="/WEB-INF/views/common/menubar.jsp" />
	
	<div class="csarea wrapper">
		<!-- cs 카테고리 -->
		<jsp:include page="/WEB-INF/views/notice/csCategory.jsp" />
		
		<div class="content">
            <header class="one_header">
                <div>1:1 문의하기</div>
            </header>
            <div class="one_ment">
                <ul>
                    <li>평일 오후 5시 이후 문의는 당일 답변이 어려울 수 있습니다.</li>
                    <li>토, 일요일 및 공휴일 문의는 평일 운영 시간 내 순차적으로 답변드리겠습니다.</li>
                </ul>
            </div>

            <form class="q_info" action="${ contextPath }/one/insert" method="post" enctype="multipart/form-data">
                <div class="q_titlearea">
                    <span class="q_title">문의 제목</span>
                    <span class="q_title2"><input type="text" name="title" required></span>
                </div>

                <div class="q_contentarea">
                    <span class="q_content">문의 내용</span>
                    <div class="q_content2">
                        <span><textarea name="content" required></textarea></span>
                        <ul>
                            <li>문의내용을 구체적으로 작성해주세요. 정확하고 빠른 답변에 도움이 됩니다.</li>
                            <li>주민등록번호를 포함한 고객님의 소중한 개인정보는 사이트에 노출되지 않으나 꼭 필요한 경우가 아닌경우 기재를 삼가시길 바랍니다.</li>
                        </ul>
                    </div>
                </div>

                <div class="q_filearea">
                    <span class="q_file">파일 첨부</span>
                    <div class="q_file2">
                        <span class="q_uplode"><input type="file" name="file" accept="image/gif,image/jpeg,image/png"></span>
                        <ul>
                            <li>첨부가능 용량은 10MB 미만입니다.</li>
                            <li>첨부가능 파일확장자 : jpg, gif, bmp, png</li>
                            <li>첨부파일 중 개인정보가 포함되어 있는 파일은 상담 완료 후 즉각 파기하며, 상담 외의 목적으로는 사용되지 않습니다.</li>
                        </ul>
                    </div>
                </div>
                <div class="q_btn">
                    <button type="button" onclick="location.href='${ contextPath }/one'">취소</button>
                    <button type="submit">등록</button>
                </div>
            </form>
        </div>
		<!-- 광고  -->
		<jsp:include page="/WEB-INF/views/common/adArea.jsp" />
	</div>
	
	<!-- footer -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />

</body>
</html>