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
<link href="${ contextPath }/resources/css/notice/writerCheckDetail.css" rel="stylesheet">
<title>작가인증게시판</title>
</head>
<body>
	<!-- 메뉴바 -->
	<jsp:include page="/WEB-INF/views/common/menubar.jsp" />
	
	<div class="csarea wrapper">
		<!-- cs 카테고리 -->
		<jsp:include page="/WEB-INF/views/notice/csCategory.jsp" />
		
		<div class="content">
            <div class="wcheck_header">작가 인증게시판</div>
            <div class="wcheck_ment">
                <ul>
                    <li>평일 오후 5시 이후 신청은 당일 확인이 어려울 수 있습니다.</li>
                    <li>토, 일요일 및 공휴일 신청은 평일 운영 시간 내 순차적으로 확인해드리겠습니다.</li>
                    <li>작가 인증 확인시 다소 시간이 걸릴 수도 있으니 이점 양해바랍니다.</li>
                </ul>
            </div>
            
            <div class="wc_area">인증 내역</div>
            <div class="wc_conarea">
                <table>
                    <tr class="liarea">
                        <th class="wc_title" rowspan="2">제목</th>
                        <td class="title" rowspan="2">${ wcheck.wtitle }</td>         
                        <th class="wc_writer">작성자</th>
                        <td class="writer">${ wcheck.user_name }</td>
                    </tr>
                    <tr class="liarea">
                    	<th class="wc_date">등록일</th>
                        <td class="date">${ wcheck.create_date }</td>
                    </tr>         
                    <tr class="liarea2">
                        <th class="wc_content">내용</th>
                        <td class="wcontent" colspan="3">${ fn:replace(wcheck.wcontent, newReply, '<br>')}</td>
                    </tr>
                    <tr class="">
                    	<th class="wc_book">MY도서</th>
                        <td class="book" colspan="3">
                        	<div class="wc_bookarea">MY도서 리스트</div>
                        	<div class="wc_bListarea">
                        		<ul id="wc_bList">
                        		<c:forEach var="wbook" items="${ wcheck.wbook }">
                        			<li>&lt; ${ wbook.b_name }&gt; ${ wbook.b_author }</li>
                        		</c:forEach>
                        		</ul>
                        	</div>
                        </td>
                    </tr>
                    <tr class="">
                        <th class="wc_file" rowspan="2">첨부파일</th>
                        <td class="wfile" colspan="3">
                        	<div class="line filearea">
	                			<c:forEach var="upload" items="${ wcheck.wupload }">
                        			[<p>${ upload.origin_file }</p>
                        			<c:if test="${ loginUser.userNo == wcheck.user_no || loginUser.userGrade == 30 }">
	               						<p><button onclick="location.href='${ contextPath }/w-check/download?wup_no=${ upload.wup_no }'">다운로드</button></p>
               						</c:if>]
                        		</c:forEach>
                			</div>
                        </td>
                    </tr>
                    <tr class="noline">
                		<td class="wfile2">
                			<ul>
	                            <li>인증서류 ex) 출판사 계약서, 저작권 등록증 등</li>
	                            <li>첨부가능 용량은 파일당 5MB 미만이며, 최대 2개까지 가능합니다.</li>
	                            <li>첨부가능 파일확장자 : jpg, gif, bmp, png</li>
	                            <li>첨부파일 중 개인정보가 포함되어 있는 파일은 상담 완료 후 즉각 파기하며, 상담 외의 목적으로는 사용되지 않습니다.</li>
                        	</ul>
                		</td>
                	</tr>
                </table>
            </div>
            
                       
            <div class="wc_btn">
                <button type="button" onclick="location.href='${ contextPath }/w-check'">취소</button>
                <c:if test="${ loginUser.userNo == wcheck.user_no }">
	                <button type="button" onclick="location.href='#'">수정하기</button>
                </c:if>
            </div>
           
            
		</div>
		<!-- 광고  -->
		<jsp:include page="/WEB-INF/views/common/adArea.jsp" />
	
	</div>
	
	<!-- footer -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />

</body>
</html>