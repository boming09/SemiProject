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
            
            <c:if test="${ !empty commu.creply }">
	            <div class="commu_reply">작가님 답변</div>
	            <div class="reply"><div>${ fn:replace(commu.creply, newReply, '<br>')}</div></div>
            </c:if>
            
                       
            <div class="commu_btn">
                <button type="button" onclick="location.href='${ contextPath }/commu'">취소</button>
                <c:if test="${ loginUser.userNo == commu.user_no && empty commu.creply }">
	                <button type="button" onclick="location.href='${ contextPath }/commu/update?commu_no=${ commu.commu_no }'">수정하기</button>
                </c:if>
                <c:if test="${ loginUser.userNo == commu.user_no }">
                	<button type="button" onclick="commuDelete(${ commu.commu_no })">삭제하기</button>
                </c:if>
            </div>
           
            
		</div>
		<!-- 광고  -->
		<jsp:include page="/WEB-INF/views/common/adArea.jsp" />
	
	</div>
	
	<!-- footer -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	
	<script>
		// 게시글 삭제하기
		function commuDelete(commu_no) {
			if(confirm("게시글 삭제 하시겠습니까?")) {
				location.href='${ contextPath }/commu/delete?commu_no=' + commu_no;
			}
		}
	</script>
</body>
</html>