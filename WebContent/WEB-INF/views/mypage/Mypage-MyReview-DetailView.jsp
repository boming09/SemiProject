<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://unpkg.com/ress/dist/ress.min.css">
<!-- 외부 스타일 시트 -->
<link href="${ contextPath }/resources/css/mypage/mypage-ReviewDetail.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
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
                        <th class="wcommu_date" rowspan="4">책제목</th>
                        <td class="date2" name="category" rowspan="4">
                        ${ b_review.book_name }
                        </td>       
                        <th class="wcommu_user">작성자</th>
                        <td class="user">
                        
                        <c:choose>
			           	<c:when test="${ loginUser.userNickname != null}">
			           	<div>${ loginUser.userNickname }</div>
			            </c:when>
			            <c:otherwise>
			            <div>${ loginUser.userName }</div>
			            </c:otherwise>
			            </c:choose> 
                        <!-- 
                        <c:choose> 
				           	<c:when test="${ review.user_nickname != null}">
				           	<li class="review_writer">${ review.user_nickname }</li>
				            </c:when>
				            <c:otherwise>
				            <li class="review_writer">${ loginUser.userName }</li>
				            </c:otherwise>
			            </c:choose>       
                         -->
                        <!-- ${ b_review.user_no } -->
                        </td>
                    </tr>
                    <tr class="liarea">
                    	<th class="wcommu_date">등록일</th>
                        <td class="date"> <fmt:formatDate value="${ b_review.create_date }" type="both"
                        pattern="yyyy.MM.dd HH:mm:ss"/></td>                        
                    </tr>
                    
                    <tr class="liarea">
                    <th class="wcommu_title">리뷰번호</th>
                        <td class="title" name="title">
                            <div> ${ b_review.review_no }</div>
                        </td>                    	
                    </tr>
                    <tr class="liarea">
                    	<th class="wcommu_date">평점</th>
                        <td class="date" name="category">
                        ${ b_review.rating }
                        </td>
                    </tr>
                                      
                    <tr class="liarea2">
                        <th class="wcommu_content">내용</th>
                        <td class="wcontent" name="content" colspan="3">${ b_review.content }${ loginUser.userNo}<br>${ b_review.user_no }</td>
                    </tr>
                </table>
            </div>
                       
            <div class="wcommu_btn">
                <button type="button" onclick="location.href='${ contextPath }/mypagemyreview'">돌아가기</button>
                
                <!-- 이게시글을 쓴 사람과 로그인한 유저가 같아 야한다 -->
                <c:if test="${ loginUser.userNo == b_review.user_no }">
                </c:if>
                <button type="button" onclick="updateMyreviewView();">수정하기</button>
                <button type="button" onclick="deleteMyreview();">삭제하기</button>
            </div>
		</div>
		
		<!-- 광고  -->
		<jsp:include page="/WEB-INF/views/common/adArea.jsp" />	
	</div>
	
	<!-- footer -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	
	<c:if test="${ loginUser.userNo ==  b_review.user_no }">
	</c:if>
	<form name="myreviewForm" method="post">
		<input type="hidden" name="review_no" value="${ b_review.review_no }">
	</form>
	<script>
		function updateMyreviewView(){
			document.forms.myreviewForm.action = "${contextPath}/myreview/updateView";
			document.forms.myreviewForm.submit();
		}
		
		function deleteMyreview(){
			if(confirm("이 게시글을 삭제하시겠습니까?")){
				document.forms.myreviewForm.action = "${contextPath}/myreview/delete";
				document.forms.myreviewForm.submit();
			}
		}
	</script>
</body>
</html>