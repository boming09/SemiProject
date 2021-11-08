<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://unpkg.com/ress/dist/ress.min.css">
<!-- 외부 스타일 시트 -->
<link href="${ contextPath }/resources/css/mypage/mypage-ReviewDetail.css" rel="stylesheet">
<title>마이리뷰</title>
</head>
<body>
	<!-- 메뉴바 -->
	<jsp:include page="/WEB-INF/views/common/menubar.jsp" />
	
	<div class="csarea wrapper">
        <!-- cs 카테고리 -->
		<%@ include file="/WEB-INF/views/mypage/mypage-category.jsp" %>
        
        <div class="content">
            <header class="wcommu_header">
                <div>마이리뷰 게시판</div>
            </header>
            
            <div class="wcommu_area">게시글 내용</div>
            <div class="wcommu_conarea">
                <table>
                    <tr class="liarea">
                        <th class="wcommu_title" rowspan="3">제목</th>
                        <td class="title" name="title" rowspan="3">
                            <div> ${ myreview.mtitle }</div>
                        </td>         
                        <th class="wcommu_user">작성자</th>
                        <td class="user"> ${ myreview.userName }</td>
                    </tr>
                    <tr class="liarea">
                    	<th class="wcommu_date">등록일</th>
                        <td class="date"> <fmt:formatDate value="${ myreview.create_Date }" type="both"
                        pattern="yyyy.MM.dd HH:mm:ss"/></td>                        
                    </tr>
                    <tr class="liarea">
                    	<th class="wcommu_date">분류</th>
                        <td class="date" name="category"> ${ myreview.mtype }</td>
                    </tr>
                                      
                    <tr class="liarea2">
                        <th class="wcommu_content">내용</th>
                        <td class="wcontent" name="content" colspan="3">${ myreview.mcontent }</td>
                    </tr>
                </table>
            </div>
                       
            <div class="wcommu_btn">
                <button type="button" onclick="location.href='${ contextPath }/mypagemyreview'">취소</button>
                <button type="submin">수정하기</button>
            </div>
		</div>
		
		<!-- 광고  -->
		<jsp:include page="/WEB-INF/views/common/adArea.jsp" />	
	</div>
	
	<!-- footer -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>