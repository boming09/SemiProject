<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://unpkg.com/ress/dist/ress.min.css">
<!-- 외부 스타일 시트 -->
<link href="${ contextPath }/resources/css/mypage/mypage-review.css" rel="stylesheet">
<title>마이리뷰</title>
</head>
<body>
	<!-- 메뉴바 -->
	<jsp:include page="/WEB-INF/views/common/menubar.jsp" />
	
	<div class="csarea wrapper">
        <!-- mypage-category 카테고리 추가 -->
		<%@ include file="/WEB-INF/views/mypage/mypage-category.jsp" %>
        
        <div class="content">
        	<header class="review_header">
        	<c:choose>
           	<c:when test="${ loginUser.userNickname != null}">
           	<div>${ loginUser.userNickname }님 의 리뷰</div>
            </c:when>
            <c:otherwise>
            <div>${ loginUser.userName }님 의 리뷰</div>
            </c:otherwise>
            </c:choose>                
                <!-- 
                <div class="review_commu">
                    <button onclick="location.href='${ contextPath }/commu'">전체<br>소통게시판</button>
                </div>
                 -->
            </header>
        
            <div class="review_area1">
                <span>마이리뷰 목록</span>                
            </div>            

            <div class="review_area2">
                <div class="review_listarea">
                    <ul class="review_listtop">
                        <li class="review_no">리뷰번호</li>
                        <li class="review_classification">도서코드</li>
                        <li class="review_title">회원번호</li>
                        <li class="review_writer">작성일</li>
                        <li class="review_views">내용</li>
                        <li class="review_date">평점</li>
                        <li class="review_status">참조리뷰번호</li>
                    </ul>
                    <c:if test="${ !empty loginUser }">
                	<c:forEach var="review" items="${ b_reviewList }">
                	<ul class="review_list" onclick="detailView(${ b_review.review_no })">
                		<li class="review_no">${ b_review.review_no }</li>
                		<li class="review_classification">${ b_review.book_id }</li>
                		
                		<c:choose> 
				           	<c:when test="${ b_review.user_no != null}">
				           	<li class="review_writer">${ b_review.user_no }</li>
				            </c:when>
				            <c:otherwise>
				            <li class="review_writer">${ loginUser.userName }</li>
				            </c:otherwise>
			            </c:choose>                		
                		
                		<li class="review_title">${ b_review.create_date }</li>
                		<li class="review_views">${ b_review.content }</li>
                		<li class="review_date">${ b_review.rating }</li>
                		<li class="review_status">${ b_review.ref_no }</li>
                	</ul>
                    </c:forEach>
                    </c:if>
                    <!-- 반복문 --> 
                    <!-- 가데이터 -->
                    <!-- 
                    <ul class="review_list" onclick="">
                        <li class="review_no">2</li>
                        <li class="review_classification">OOO</li>
                        <li class="review_title title2">자바</li>
                        <li class="review_writer">자바</li>
                        <li class="review_views">10</li>
                        <li class="review_date">2021-11-1</li>
                        <li class="review_status">
                        	<div class="rating">
				                <input type="checkbox" name="rating" id="rating1" value="1" class="rate_radio" title="1점">
				                <label for="rating1"></label>
				                <input type="checkbox" name="rating" id="rating2" value="2" class="rate_radio" title="2점">
				                <label for="rating2"></label>
				                <input type="checkbox" name="rating" id="rating3" value="3" class="rate_radio" title="3점" >
				                <label for="rating3"></label>
				                <input type="checkbox" name="rating" id="rating4" value="4" class="rate_radio" title="4점">
				                <label for="rating4"></label>
				                <input type="checkbox" name="rating" id="rating5" value="5" class="rate_radio" title="5점">
				                <label for="rating5"></label>
      				      </div>
                        </li>
                    </ul>
                    <ul class="review_list" onclick="">
                        <li class="review_no">1</li>
                        <li class="review_classification">ㅁㅁㅁ</li>
                        <li class="review_title title2">JS</li>
                        <li class="review_writer">jsp</li>
                        <li class="review_views">20</li>
                        <li class="review_date">2021-11-1</li>
                        <li class="review_status">
                        	<div class="rating">
				                <input type="checkbox" name="rating" id="rating1" value="1" class="rate_radio" title="1점">
				                <label for="rating1"></label>
				                <input type="checkbox" name="rating" id="rating2" value="2" class="rate_radio" title="2점">
				                <label for="rating2"></label>
				                <input type="checkbox" name="rating" id="rating3" value="3" class="rate_radio" title="3점" >
				                <label for="rating3"></label>
				                <input type="checkbox" name="rating" id="rating4" value="4" class="rate_radio" title="4점">
				                <label for="rating4"></label>
				                <input type="checkbox" name="rating" id="rating5" value="5" class="rate_radio" title="5점">
				                <label for="rating5"></label>
      				      </div>
      				   </li>
                    </ul>
                     -->
                </div>
                
                <c:if test="${ !empty param.searchCondition && !empty param.searchValue }">
              		 <c:set var="searchParam" value="&searchCondition=${ param.searchCondition }&searchValue=${ param.searchValue }"/>
           		</c:if>  
                
                <div class="wcommu_page">
                    <!-- 페이지 바 영역  -->
                    <li><a href="${ contextPath }/mypagemyreview?page=1${ searchParam }">&lt;&lt;</a></li>
                    
                    <li>                    
                    <c:choose>
                    	<c:when test="${ pi.page > 1 }">
                    	<a href="${ contextPath }/}/mypagemyreview?page=${ pi.page - 1 }${ searchParam }">&lt;</a>
                    	</c:when>
                    	<c:otherwise>
                    	<a href="#">&lt;</a>
                    	</c:otherwise>
                    </c:choose>
                    </li>
                    
                    <!-- 최대 10개의 페이지 목록 -->
                    <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                    <li>
                    <c:choose>
                    	<c:when test="${ p eq pi.page }">
                    	<a href="#" class="current_page">${ p }</a>
                    	</c:when>
                    	<c:otherwise>
                    	<a href="${ contextPath }/mypagemyreview?page=${ p }${ searchParam }">${ p }</a>
                    	</c:otherwise>
                    </c:choose>
                    </li>
                    </c:forEach>   
                                     
                    <li>                    
                    <c:choose>
                    	<c:when test="${ pi.page < pi.maxPage }">
                    	<a href="${ contextPath }/mypagemyreview?page=${ pi.page + 1 }${ searchParam }">&gt;</c:when>
                    	<c:otherwise>
                    	<a href="#">&gt;</a>
                    	</c:otherwise>
                    </c:choose>
                    </li>  
                          
                    <li><a href="${ contextPath }/mypagemyreview?page=${ pi.maxPage}${ searchParam }">&gt;&gt;</a></li>
                </div>
                <!-- 페이지 이동 끝 -->
                
                <!-- 검색, 작성하기 -->
                <div class="search_area2">
				<form method="get" action="${ contextPath }/mypagemyreview">
					<select id="searchCondition" name="searchCondition">
						<option value="title" 
						<c:if test="${ param.searchCondition == 'title' }">selected</c:if>>제목</option>
						<option value="content"
						<c:if test="${ param.searchCondition == 'content' }">selected</c:if>>내용</option>
						<option value="writer"
						<c:if test="${ param.searchCondition == 'writer' }">selected</c:if>>작성자</option>
					</select> 
					
					<span class="review_input_area2"> 
					<input type="search" name="searchValue" id="reviewsearch"
						value="${ param.searchValue }">
					</span>					
					<button type="submit" class="noticeInsert" id="noticeInsert">검색하기</button>
										
					<c:if test="${ !empty loginUser }">
					<button id="noticeInsert" type="button" class="noticeInsert"
					onclick="location.href='${ contextPath }/myreviewinsertview'">작성하기</button>
					</c:if>
				</form>
			</div>
            </div>
        </div>	
        
        <!-- 광고  -->
		<jsp:include page="/WEB-INF/views/common/adArea.jsp" />	
	</div>
	
	<!-- footer -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	
	<script>
				function detailView(review_no){
					location.href='${contextPath}/mypagemyreviewdetail?review_no=' + review_no;
				}
	</script>
	
	<c:choose>
		<c:when test="${ !empty loginUser }">			
		</c:when>
		<c:otherwise>
			<script>
				function detailView(review_no){
					alert('로그인 후 이용 가능합니다');
					location.href='${contextPath}/login';
				}
			</script>
		</c:otherwise>
	</c:choose>
	
	<script>
	/*	
		let rating = new Rating();//별점 인스턴스 생성
		//별점 마킹 모듈 프로토타입으로 생성
		function Rating(){};
		Rating.prototype.rate = 0;
		Rating.prototype.setRate = function(newrate){
		    //별점 마킹 - 클릭한 별 이하 모든 별 체크 처리
		    this.rate = newrate;
		    let items = document.querySelectorAll('.rate_radio');
		    items.forEach(function(item, idx){
		        if(idx < newrate){
		            item.checked = true;
		        }else{
		            item.checked = false;
		        }
		    });
		}
		
		document.addEventListener('DOMContentLoaded', function(){
		    //별점선택 이벤트 리스너
		    document.querySelector('.rating').addEventListener('click',function(e){
		        let elem = e.target;
		        if(elem.classList.contains('rate_radio')){
		            rating.setRate(parseInt(elem.value));
		        }
		    })
		});
	*/
	</script>
</body>
</html>