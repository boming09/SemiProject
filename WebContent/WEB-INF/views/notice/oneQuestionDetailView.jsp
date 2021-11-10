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
<link href="${ contextPath }/resources/css/notice/oneQuestionDetail.css" rel="stylesheet">
<title>고객센터_1:1문의</title>
</head>
<body>
	<!-- 고객센터 사이드 FAQ-주문/결제 클릭시 첫 화면 -->
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
            
                       
            <div class="one_btn">
                <button type="button" onclick="location.href='${ contextPath }/one'">취소</button>
                <button type="button" onclick="location.href='#'">수정하기</button>
            </div>
           
            
		</div>
		<!-- 광고  -->
		<jsp:include page="/WEB-INF/views/common/adArea.jsp" />
	
	</div>
	
	<!-- footer -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />

</body>
</html>