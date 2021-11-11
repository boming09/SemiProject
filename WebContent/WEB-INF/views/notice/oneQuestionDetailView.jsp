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
<link href="${ contextPath }/resources/css/notice/oneQuestionDetail.css" rel="stylesheet">
<title>고객센터_1:1문의</title>
<style>
.unre_reply {
    border-top: 1px solid lightgray;
    border-bottom: 1px solid lightgray;
    margin: 0px 30px 10px 30px;
    display: flex;
    justify-content: center;
    padding: 10px 0;
}
.unre_reply textarea {
    border: 1px solid lightgray;
    resize: none;
    width: 95%;
    height: 200px;
    padding-left : 10px;
}

/* 취소/답변작성 버튼 */
.unre_btn {
    display : flex;
    justify-content : center;	
    align-items: center;
}
.unre_btn button {
    margin: 20px;
    margin-bottom : 60px;
    width: 90px;
    height: 35px;
    font-size: 0.85rem;
    font-weight: bold;
    background: rgb(73, 125, 78);
    color: white;
}

.unre_btn button:hover {
    background-color: rgb(196, 217, 195);
    color: black;
}
</style>
</head>
<body>
	<!-- 메뉴바 -->
	<jsp:include page="/WEB-INF/views/common/menubar.jsp" />
	
	<div class="csarea wrapper">
		<!-- cs 카테고리 -->
		<jsp:include page="/WEB-INF/views/notice/csCategory.jsp" />
		
		<div class="content">
            <header class="one_header">
                <div>1:1 문의</div>
            </header>
            <div class="one_ment">
                <ul>
                    <li>평일 오후 5시 이후 문의는 당일 답변이 어려울 수 있습니다.</li>
                    <li>토, 일요일 및 공휴일 문의는 평일 운영 시간 내 순차적으로 답변드리겠습니다.</li>
                </ul>
            </div>
            
            <div class="one_area">문의 내역</div>
            <div class="one_conarea">
                <table>
                    <tr class="liarea">
                        <th class="one_title">제목</th>
                        <td class="title"><div>${ one.otitle }</div></td>         
                        <th class="one_date">등록일</th>
                        <td class="date">${ one.odate }</td>
                    </tr>         
                    <tr class="liarea2">
                        <th class="one_content">내용</th>
                        <td class="ocontent" colspan="3">${ fn:replace(one.ocontent, newReply, '<br>')}</td>
                    </tr>
                    <tr class="liarea3">
                        <th class="one_file">첨부파일</th>
                        <td class="ofile" colspan="3">${ one.origin_file }</td>
                    </tr>
                </table>
            </div>
            

            <c:if test="${ empty one.oreply && loginUser.userId != 'admin' }">

            <div class="one_btn">
                <button type="button" onclick="location.href='${ contextPath }/one'">취소</button>
                <c:if test="${ empty one.oreply }">
	                <button type="button" onclick="oneDelete(${ one.one_no})">삭제하기</button>
                </c:if>
            </div>
            </c:if>
            <c:if test="${ !empty one.oreply }">
            <div class="one_area">1:1 문의 답변</div>
            <div class="unre_reply">
                <textarea readonly>${ one.oreply }</textarea>
            </div>
            </c:if>
            <c:if test="${ loginUser.userId == 'admin' && one.status == 'N' }">
            <form method="post" action="${contextPath}/admin/onereply">
            <input name = "oNo" type="hidden" value="${ one.one_no }">
           <div class="unreview_area"></div>
            <div class="unre_reply">
                <textarea name="reply"></textarea>
            </div>
            
            <div class="unre_btn">
                <button type="button" onclick="location.href='${ contextPath }/w-unreview/detail'">취소</button>
                <button type="submit">답변등록</button>
            </div>
            </form>
            </c:if>
            
		</div>
		<!-- 광고  -->
		<jsp:include page="/WEB-INF/views/common/adArea.jsp" />
	
	</div>
	
	<!-- footer -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	
	<script>
		// 삭제하기
		function oneDelete(oneNo) {
			if(confirm("게시글을 삭제하시겠습니까?")) {
				location.href='${ contextPath }/one/delete?one_no=' + oneNo;
			}
		}
	</script>
</body>
</html>