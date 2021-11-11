<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<link href="${ contextPath }/resources/css/notice/commuDetail.css" rel="stylesheet">
<title>고객센터_소통게시판</title>
</head>
<body>
	<!-- 메뉴바 -->
	<jsp:include page="/WEB-INF/views/common/menubar.jsp" />
	
	<div class="csarea wrapper">
		<!-- cs 카테고리 -->
		<jsp:include page="/WEB-INF/views/writer/wmyCategory.jsp" />
		
		<div class="content">
            <header class="commu_header">
                <div>소통게시판</div>
            </header>
            
            <div class="commu_area">소통 내역</div>
            <div class="commu_conarea">
                <table>
                    <tr class="liarea">
                        <th class="commu_title">제목</th>
                        <td class="title"><div>${ commu.ctitle }</div></td>         
                        <th class="commu_user">작성자</th>
                        <td class="user">${ commu.user_id }</td>
                    </tr>
                    <tr class="liarea">
                        <th class="commu_writer">소통작가</th>
                        <td class="writer"><div>${ commu.cwriter_name }</div></td>         
                        <th class="commu_date">등록일</th>
                        <td class="date">${ commu.create_date }</td>
                    </tr>         
                    <tr class="liarea2">
                        <th class="commu_content">내용</th>
                        <td class="ccontent" colspan="3">${ fn:replace(commu.ccontent, newReply, '<br>')}</td>
                    </tr>
                </table>
            </div>
            
                       
            <div class="commu_btn">
                <button type="button" onclick="location.href='${ contextPath }/w-commu'">취소</button>
           		<button type="button" onclick="location.href='${ contextPath }/w-commu/insert?commu_no=${ commu.commu_no }'">답변작성</button>
            </div>
           
            
		</div>
		<!-- 광고  -->
		<jsp:include page="/WEB-INF/views/common/adArea.jsp" />
	
	</div>
	
	<!-- footer -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>