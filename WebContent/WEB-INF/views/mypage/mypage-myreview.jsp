<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                <div>${ loginUser.userNickname }님 의 리뷰</div>
                <!-- 
                <div class="review_commu">
                    <button onclick="location.href='${ contextPath }/commu'">전체<br>소통게시판</button>
                </div>
                 -->
            </header>
        
            <div class="review_area1">
                <span>마이리뷰 목록</span>
                <!-- <span>
                    <input type="checkbox" name="mylist" value=""><label>내가 쓴 글만 보기</label>
                    <button type="button">글 작성</button>
                </span> -->
            </div>

            <div class="review_area2">
                <div class="review_listarea">
                    <ul class="review_listtop">
                        <li class="review_no">글번호</li>
                        <li class="review_classification">분류</li>
                        <li class="review_title">제목</li>
                        <li class="review_writer">작성자</li>
                        <li class="review_views">조회수</li>
                        <li class="review_date">등록일</li>
                        <li class="review_status">평점</li>
                    </ul>
                	<c:forEach var="review" items="${ myreviewList }">
                	<ul class="review_list" onclick="detailView(${ review.mid })">
                		<li class="review_no">${ review.mid }</li>
                		<li class="review_classification">${ review.category_name }</li>
                		<li class="review_title">${ review.mtitle }</li>
                		<li class="review_writer">${ review.userName }</li>
                		<li class="review_views">${ review.mcount }</li>
                		<li class="review_date">${ review.create_Date }</li>
                		<li class="review_status">@@@@@</li>
                	</ul>
                    </c:forEach>
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
                
                <div class="wcommu_page">
                    <!-- 페이지 바 영역 => 나중에 작성 -->
                    <li><a href="${ contextPath }/mypagemyreview?page=1">&lt;&lt;</a></li>
                    
                    <li>                    
                    <c:choose>
                    	<c:when test="${ pi.page > 1 }">
                    	<a href="${ contextPath }/}/mypagemyreview?page=${ pi.page - 1 }">&lt;</a>
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
                    	<a href="${ contextPath }/mypagemyreview?page=${ p }">${ p }</a>
                    	</c:otherwise>
                    </c:choose>
                    </li>
                    </c:forEach>   
                                     
                    <li>                    
                    <c:choose>
                    	<c:when test="${ pi.page < pi.maxPage }">
                    	<a href="${ contextPath }/mypagemyreview?page=${ pi.page + 1 }">&gt;</c:when>
                    	<c:otherwise>
                    	<a href="#">&gt;</a>
                    	</c:otherwise>
                    </c:choose>
                    </li>  
                          
                    <li><a href="${ contextPath }/mypagemyreview?page=${ pi.maxPage}">&gt;&gt;</a></li>
                </div>
                
                <!-- 검색, 작성하기 -->
                <div class="search_area2">
				<form method="get" action="#">
					<select id="searchCondition2" name="searchCondition2">
						<option value="title" 
						<c:if test="${ param.searchCondition == 'title' }">selected</c:if>>제목</option>
						<option value="content"
						<c:if test="${ param.searchCondition == 'content' }">selected</c:if>>내용</option>
					</select> 
					<span class="input_area2"> 
					<input type="search" name="searchValue" value="${ param.searchValue }" required>
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
	
	<c:choose>
		<c:when test="${ !empty loginUser }">
			<script>
				function detailView(mid){
					location.href='${contextPath}/mypagemyreviewdetail?mid=' + mid;
				}
			</script>
		</c:when>
		<c:otherwise>
			<script>
				function detailView(mid){
					alert('로그인 후 이용 가능합니다');
					location.href='${contextPath}/login';
				}
			</script>
		</c:otherwise>
	</c:choose>
	
	<script>
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
	</script>
</body>
</html>