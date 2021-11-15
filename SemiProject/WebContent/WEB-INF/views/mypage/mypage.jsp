<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bomsoup login</title>
    <link rel="stylesheet" href="https://unpkg.com/ress/dist/ress.min.css">
    <!-- favicon (Real Favicon Generator 등에서 가공 필요) -->
    <link rel="icon" type="image/x-icon" href="resources/image/khfavicon.ico">
    <!-- 외부 스타일 시트 -->
    <link href="<%= request.getContextPath() %>/resources/css/mypage/mypage-Center.css" rel="stylesheet">
</head>
<body>
    <!-- 메뉴바 -->
	<%@ include file="/WEB-INF/views/common/menubar.jsp" %>
        
    <div class="csarea wrapper">
		<!-- mypage-category 카테고리 추가 -->
		<%@ include file="/WEB-INF/views/mypage/mypage-category.jsp" %>		
		<!-- 헤더 div -->
		<div class="content">
			<c:choose>
           	<c:when test="${ loginUser.userNickname != null}">
           	<h4>${ loginUser.userNickname} 고객님, 안녕하세요.</h4><br>
            </c:when>
            <c:otherwise>
            <h4>${ loginUser.userName} 고객님, 안녕하세요.</h4><br>
            </c:otherwise>
            </c:choose>
            <header>
            	<div class="hdcenter">
            		<div class="left">
            		<h3>멤버십 등급 : 
	            		<c:choose>
		            		<c:when test="${ loginUser.userGrade == 10 }">
		            		일반 회원
		            		</c:when>
		            		<c:when test="${ loginUser.userGrade == 20 }">
		            		작가 회원
		            		</c:when>
		            		<c:otherwise>
		            		관리자
		            		</c:otherwise>
	            		</c:choose>
            		</h3>
            		봄숲 멤버십 회원이 되신걸 환영합니다.<br>
            		구매 금액의 1~3% 추가 마일리지 및 쿠폰 혜택을 받으실수 있습니다.
            		</div>
            		<div class="right">
            		<h3><a href="<%= request.getContextPath() %>/one">내 문의 사항</a></h3>
            		내문의 사항 내용을 볼수 있습니다.
            		</div>
            	</div>
            </header>
            
            <!-- center div -->
            <br>
            <h4>전체 주문내역</h4>
            <br>
            <div class="center">
            	<div class="center0">
	            	<div class="cenleft">
		            	<div class="centerdiv1">
		            		<select class="selectbox" id="sb1" name="sb1">
		                        <option value="">전체보기</option>
		                        <option value="">제목</option>
		                        <option value="">내용</option>
		                    </select>                
		            		<select class="selectbox" id="sb2" name="sb2">
		                        <option value="">전체보기</option>
		                        <option value="">제목</option>
		                        <option value="">내용</option>
		                    </select>
		                </div>
		                <div class="centerdiv3">
		                <label>주문검색</label>
		            		<select class="selectbox" id="sb3" name="sb3">
		                        <option value="">주문상품</option>
		                        <option value="">제목</option>
		                        <option value="">내용</option>
		                    </select>                
		            		<select class="selectbox" id="sb4" name="sb4">
		                        <option value=""></option>
		                        <option value="">제목</option>
		                        <option value="">내용</option>
		                    </select>
		                </div>
	                </div>
	                <div class="cenright">
		                <div class="centerdiv5">
		                	<label>판매자별 조회</label>
		            		<select class="selectbox" id="sb5" name="sb5">
		                        <option value="">전체보기</option>
		                        <option value="">제목</option>
		                        <option value="">내용</option>
		                    </select>
		                </div>
		                <div class="centerdiv6">
		                <label>배송 상태별 조회</label>
		            		<select class="selectbox" id="sb6" name="sb6">
		                        <option value="">전체보기</option>
		                        <option value="">제목</option>
		                        <option value="">내용</option>
		                    </select>
		                </div>
	                </div>
	            </div>
	                <div class="searchbut"><a href="">찾기</a></div>
            </div>
            <br>
            <div class="df1">
            	<div id="df1">주문일</div>
            	<div id="df2">주문번호</div>
            	<div id="df3">수령인</div>
            	<div id="df4">주문상품</div>
            	<div id="df5">조회 및 증빙 서류</div>
            	<div id="df6">비고</div>
            </div>
            <div class="df2">
            	<div id="df2-1"></div>
            	<div id="df2-2"></div>
            	<div id="df2-3"></div>
            	<div id="df2-4"></div>
            	<div id="df2-5"></div>
            	<div id="df2-6"></div>
            </div>
            <br>
            <h4>작가 와의 소통</h4>
            <br>
            <div class="focenter">
            	<div class="left2">
            		<a href="#">안녕하세요 OOO독자님 OOO도서 저자 OOO입니다</a><br>
            		<a href="#">안녕하세요 OOO독자님 OOO도서 저자 XXX입니다</a><br>
            		<a href="#">안녕하세요 OOO독자님 OOO도서 저자 ㅁㅁㅁ입니다</a><br>
            	</div>
            	<div class="right2">
            		<a href="#">O O O작가님</a><br>
            		<a href="#">X X X작가님</a><br>
            		<a href="#">ㅁ ㅁㅁ작가님</a><br>
            	</div>
            </div>
        </div>        
        <!-- 광고  -->
		<%@ include file="/WEB-INF/views/common/adArea.jsp" %>
	</div>	
    <!-- footer -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>