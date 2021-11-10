<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	pageContext.setAttribute("newReply", "\n");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://unpkg.com/ress/dist/ress.min.css">
<!-- 외부 스타일 시트 -->
<link href="${ contextPath }/resources/css/writer/wMyCommuInsert.css" rel="stylesheet">
<title>MY 소통게시판</title>
</head>
<body>
	<!-- 메뉴바 -->
	<jsp:include page="/WEB-INF/views/common/menubar.jsp" />
	
	<div class="csarea wrapper">
        <!-- cs 카테고리 -->
		<jsp:include page="/WEB-INF/views/writer/wmyCategory.jsp" />
        
        <div class="content">
            <header class="wcommu_header">
                <div>MY 소통게시판</div>
            </header>
            
            <div class="wcommu_area">게시글 내용</div>
            <div class="wcommu_conarea">
                <table>
                    <tr class="liarea">
                        <th class="wcommu_title">제목</th>
                        <td class="title"><div>${ commu.ctitle }</div></td>         
                        <th class="wcommu_user">작성자</th>
                        <td class="user">${ commu.user_id }</td>
                    </tr>
                    <tr class="liarea">
                    	<th class="wcommu_writer">소통작가</th>
                        <td class="writer"><div>${ commu.cwriter_name }</div></td>
                    	<th class="wcommu_date">등록일</th>
                        <td class="date">${ commu.create_date }</td>
                    </tr>
                                      
                    <tr class="liarea2">
                        <th class="wcommu_content">내용</th>
                        <td class="wcontent" colspan="3">${ fn:replace(commu.ccontent, newReply, '<br>')}</td>
                    </tr>
                </table>
            </div>
            
            <div class="wcommu_area">답변 작성</div>
            <div class="wcommu_reply">
                <textarea></textarea>
            </div>
            
            <div class="wcommu_btn">
                <button type="button" onclick="location.href='${ contextPath }/w-commu/detail?commu_no=${ commu.commu_no }'">취소</button>
                <button type="button">등록하기</button>
            </div>
		</div>
		
		<!-- 광고  -->
		<jsp:include page="/WEB-INF/views/common/adArea.jsp" />	
	</div>
	
	<!-- footer -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>