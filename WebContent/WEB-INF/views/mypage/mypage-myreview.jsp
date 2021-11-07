<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                	<c:forEach var="b_review" items="">
                    <ul class="review_listtop">
                        <li class="review_no">번호</li>
                        <li class="review_writer">작가</li>
                        <li class="review_title">책제목</li>
                        <li class="review_recommend">추천수</li>
                        <li class="review_date">등록일</li>
                        <li class="review_status">평점</li>
                    </ul>
                    </c:forEach>
                    <!-- 반복문 -->
                    <ul class="review_list" onclick="">
                        <li class="review_no">2</li>
                        <li class="review_writer">OOO</li>
                        <li class="review_title title2">자바</li>
                        <li class="review_recommend">15</li>
                        <li class="review_date">2021-11-1</li>
                        <li class="review_status">
                        	<div class="rating">
				                <!-- 해당 별점을 클릭하면 해당 별과 그 왼쪽의 모든 별의 체크박스에 checked 적용 -->
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
                        <li class="review_writer">ㅁㅁㅁ</li>
                        <li class="review_title title2">JS</li>
                        <li class="review_recommend">20</li>
                        <li class="review_date">2021-11-1</li>
                        <li class="review_status">
                        	<div class="rating">
				                <!-- 해당 별점을 클릭하면 해당 별과 그 왼쪽의 모든 별의 체크박스에 checked 적용 -->
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
                </div>
                
                <div class="wcommu_page">
                    <!-- 페이지 바 영역 => 나중에 작성 -->
                </div>
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
					onclick="location.href='#'">작성하기</button>
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