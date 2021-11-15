<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://unpkg.com/ress/dist/ress.min.css">
<!-- 외부 스타일 시트 -->
<link href="${ contextPath }/resources/css/notice/commuInsert.css" rel="stylesheet">
<title>고객센터_소통게시판</title>
</head>
<body>
	<!-- 메뉴바 -->
	<jsp:include page="/WEB-INF/views/common/menubar.jsp" />

	 <div class="csarea wrapper">
        <!-- cs 카테고리 -->
		<jsp:include page="/WEB-INF/views/notice/csCategory.jsp" />
        
        <div class="content">
             <header class="commu_header">
                <div>소통게시판</div>
            </header>
            <div class="commu_ment">
                <ul>
                    <li>이 게시판은 작가와 소통할 수 있는 봄숲만의 특별한 게시판 입니다.</li>
                    <li>작가에게 그동안 궁금했던 질문들을 직접 질문해 보세요.</li>
                </ul>
            </div>

            <form class="commu_info" method="post" action="${ contextPath }/commu/insert">
                <div class="commu_warea">
                	<span class="commu_w">작가</span>
                	<select class="commu_writer" name="writer">
                		<option>▼ 작가 선택 ▼</option>
                		<c:forEach var="writer" items="${ writerList }">
                			<option value="${ writer.userNo }">${ writer.userName }</option>
                		</c:forEach>
                	</select>
                	
                </div>
                
                <div class="commu_titlearea">
                    <span class="commu_title">제목</span>
                    <span class="commu_title2">
                    	<input type="text" name="title" required>
                    </span>
                </div>

                <div class="commu_contentarea">
                    <span class="commu_content">내용</span>
                    <div class="commu_content2">
                        <textarea name="content" required></textarea>
                    </div>
                </div>

                <div class="commu_btn">
                    <button type="button" onclick="location.href='${ contextPath }/commu'">취소</button>
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