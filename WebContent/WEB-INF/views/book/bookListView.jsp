<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SearchListView</title>	<!-- paging이 안보임 : footer가 가림 -->

<!-- CSS -->
<!-- 브라우저별로 디폴트로 적용된 CSS에 차이(여백, 폰트 크기 등)가 있어 CSS가 별도로
지정되지 않은 요소는 브라우져 별로 다르게 보일 가능성이 있음. 만들어져 있는 리셋 CSS 활용. -->
<!-- ress.css (모든 CSS 리셋이 아니라 디폴트 스타일을 활용해서 브라우저들의 최소한의 오차를 없앰) 
https://github.com/filipelinhares/ress -->
<link rel="stylesheet" href="https://unpkg.com/ress/dist/ress.min.css">
<!-- favicon (Real Favicon Generator 등에서 가공 필요) -->
<link rel="icon" type="image/x-icon" href="resources/image/khfavicon.ico">
<!-- 외부 스타일 시트 -->
<link href="<%= request.getContextPath() %>/resources/css/book/bookList.css" rel="stylesheet">
<!-- JQuery-->
<script src="https://code.jquery.com/jquery-3.6.0.min.js" 
integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/menubar.jsp"/>
<div class="csarea wrapper">
<jsp:include page="/WEB-INF/views/common/category.jsp"/>
<c:set var="searchParam" value="&searchCondition=${ param.searchCondition }&searchValue=${ param.searchValue }"/>
<c:set var="categoryParam" value="&category=${ param.category }"/>
		<div class="content">
            <div class="book_category">
                <ul class="cLi">
                    <c:forEach var="category" items="${ categoryList }">
                    <li><a href="${ contextPath }/book/category?category=${ category }${ searchParam }">${ category }</a></li>
                    </c:forEach>
                </ul>
            </div>
			<div class="booklist_area">
                <div class="bookSort">
                    <h2>검색 결과</h2>
                    <ul class="sortLi">
                        <li>
                        	<a href="${ contextPath }/book/sort?sort=popular${ searchParam }${ categoryParam }">인기순</a>
                        </li><label> | </label>
                        <li>
                        	<a href="${ contextPath }/book/sort?sort=new${ searchParam }${ categoryParam }">신상품순</a>
                        </li><label> | </label>
                        <li>
                        	<a href="${ contextPath }/book/sort?sort=highest${ searchParam }${ categoryParam }">최고가순</a>
                        </li><label> | </label>
                        <li>
                        	<a href="${ contextPath }/book/sort?sort=lowest${ searchParam }${ categoryParam }">최저가순</a>
                        </li>
                    </ul>
                </div>
				<div class="book_list">
                    <table width="100%">
                        <colgroup>
                            <col width="95">
                            <col>
                            <col width="82">
                        </colgroup>
                        <tbody>
                        <c:forEach var="book" items="${ bookList }">
                            <tr>
                                <td class="book_img">
                                  	<div class="img_wrap" onclick="detailView(${ book.bid })">
                                        <img src="${ contextPath }${ book.bimg }" alt="도서 이미지">
                                    </div>
                                </td>
                                <td class="book_info">
                                    <div class="book_title"><span onclick="detailView(${ book.bid })">[${ book.cname }]${ book.btitle }</span></div>
                                    <div class="info">
                                        <span class="writer">${ book.author }</span> | 
                                        <span class="publisher">${ book.publisher }</span> | 
                                        <span class="publication_date">
                                        <fmt:formatDate value="${ book.publicationDate }" type="date" pattern="yyyy년 MM월 dd일"/></span>
                                    </div>
                                    <div class="price">
                                        <span class="book_price">
                                        <fmt:formatNumber value="${ book.salePrice }" groupingUsed="true"/>원
                                        </span>
                                    </div>
                                    <div class="book_rating">
                                   <!-- <span class="reviewCount"></span>
                                        <span class="reviewRating"></span> -->
				                        <span id="spanBkRating">
				                            <span class="star-input noneArea">
				                                <span class="input">
				                                    <input type="radio" name="${ book.bid }" value="1" id="p1"
				                                    <c:if test="${ book.starScore == '1' }">checked</c:if>>
				                                    <label for="p1">1</label>
				                                    <input type="radio" name="${ book.bid }" value="2" id="p2"
				                                    <c:if test="${ book.starScore == '2' }">checked</c:if>>
				                                    <label for="p2">2</label>
				                                    <input type="radio" name="${ book.bid }" value="3" id="p3"
				                                    <c:if test="${ book.starScore == '3' }">checked</c:if>>
				                                    <label for="p3">3</label>
				                                    <input type="radio" name="${ book.bid }" value="4" id="p4"
				                                    <c:if test="${ book.starScore == '4' }">checked</c:if>>
				                                    <label for="p4">4</label>
				                                    <input type="radio" name="${ book.bid }" value="5" id="p5"
				                                    <c:if test="${ book.starScore == '5' }">checked</c:if>>
				                                    <label for="p5">5</label>
				                                    <input type="radio" name="${ book.bid }" value="6" id="p6"
				                                    <c:if test="${ book.starScore == '6' }">checked</c:if>>
				                                    <label for="p6">6</label>
				                                    <input type="radio" name="${ book.bid }" value="7" id="p7"
				                                    <c:if test="${ book.starScore == '7' }">checked</c:if>>
				                                    <label for="p7">7</label>
				                                    <input type="radio" name="${ book.bid }" value="8" id="p8"
				                                    <c:if test="${ book.starScore == '8' }">checked</c:if>>
				                                    <label for="p8">8</label>
				                                    <input type="radio" name="${ book.bid }" value="9" id="p9"
				                                    <c:if test="${ book.starScore == '9' }">checked</c:if>>
				                                    <label for="p9">9</label>
				                                    <input type="radio" name="${ book.bid }" value="10" id="p10"
				                                    <c:if test="${ book.starScore == '10' }">checked</c:if>>
				                                    <label for="p10">10</label>
				                                  </span>
				                                  <output for="${ book.bid }"><b>&nbsp;${ book.avgScore }&nbsp;</b></output>						
				                            </span>
				                        </span>
			                        </div>
			                        
                                    <div class="info_etc">
                                        <span>배송안내</span>
                                       	<span>무료</span>
                                    </div>
                                </td>
                                <td class="book_btns">
                          			<form name="acForm" method="post">
                          	 				<input type="hidden" name="book_id" value="${ book.bid }">
                                    	<div class="btn_count">
                                        	<input type="number" name="count" value="1" min="1" max="50" size="5">
                                    	</div>
	                            		<button id="basket" type="button" onclick="cart()">장바구니</button>
	                            		<button id="buy" type="button" onclick="direct()">바로구매</button>
                          			</form>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3" class="book_division"></td>
                            </tr>
                        </c:forEach>
                    </table>
                    
                    
                    
                    <div class="book_pages">
						<ul class="book_paging">
						<c:choose>
							<c:when test="${ !empty sort }"><!-- sort -->
								<!-- 맨 처음으로 이동하는 버튼(<<) -->
								<li><a href="${ contextPath }/book/sort?sort=${ sort }&page=1${ searchParam }">&lt;&lt;</a></li>
								
								<!-- 이전 페이지로(<) -->
								<li>
								<c:choose>
								<c:when test="${ pi.page > 1 }"><a href="${ contextPath }/book/sort?sort=${ sort }&page=${ pi.page - 1 }${ searchParam }">&lt;</a></c:when>
								<c:otherwise><a href="#">&lt;</a></c:otherwise>
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
						             <a href="${contextPath }/book/sort?sort=${ sort }&page=${ p }${ searchParam }">${ p }</a>
						             </c:otherwise>
					            </c:choose>
					            </li>
					            </c:forEach>
					            
					            <!-- 다음 페이지로(>) -->
					            <li>
								<c:choose>
									<c:when test="${ pi.page < pi.maxPage }"><a href="${ contextPath }/book/sort?sort=${ sort }&page=${ pi.page + 1 }${ searchParam }">&gt;</a></c:when>
									<c:otherwise><a href ="#">&gt;</a></c:otherwise>
								</c:choose>
								</li>
					            
					            <!-- 맨 끝으로 이동하는 버튼(>>) -->
					            <li><a href="${ contextPath }/book/sort?sort=${ sort }&page=${ pi.maxPage }${ searchParam }">&gt;&gt;</a></li>
							</c:when>
							
							<c:when test="${ !empty categoryid }"><!-- category -->
								<!-- 맨 처음으로 이동하는 버튼(<<) -->
								<li><a href="${ contextPath }/book/category/list?categoryid=${ categoryid }&page=1">&lt;&lt;</a></li>
								
								<!-- 이전 페이지로(<) -->
								<li>
								<c:choose>
								<c:when test="${ pi.page > 1 }"><a href="${ contextPath }/book/category/list?categoryid=${ categoryid }&page=${ pi.page - 1 }">&lt;</a></c:when>
								<c:otherwise><a href="#">&lt;</a></c:otherwise>
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
						             <a href="${contextPath }/book/category/list?categoryid=${ categoryid }&page=${ p }">${ p }</a>
						             </c:otherwise>
					            </c:choose>
					            </li>
					            </c:forEach>
					            
					            <!-- 다음 페이지로(>) -->
					            <li>
								<c:choose>
									<c:when test="${ pi.page < pi.maxPage }"><a href="${ contextPath }/book/category/list?categoryid=${ categoryid }&page=${ pi.page + 1 }">&gt;</a></c:when>
									<c:otherwise><a href ="#">&gt;</a></c:otherwise>
								</c:choose>
								</li>
					            
					            <!-- 맨 끝으로 이동하는 버튼(>>) -->
					            <li><a href="${ contextPath }/book/category/list?categoryid=${ categoryid }&page=${ pi.maxPage }">&gt;&gt;</a></li>
							</c:when>
							
							<c:otherwise><!-- list -->
								<!-- 맨 처음으로 이동하는 버튼(<<) -->
								<li><a href="${ contextPath }/book/list?page=1${ searchParam }">&lt;&lt;</a></li>
								
								<!-- 이전 페이지로(<) -->
								<li>
								<c:choose>
								<c:when test="${ pi.page > 1 }"><a href="${ contextPath }/book/list?page=${ pi.page - 1 }${ searchParam }">&lt;</a></c:when>
								<c:otherwise><a href="#">&lt;</a></c:otherwise>
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
						             <a href="${contextPath }/book/list?page=${ p }${ searchParam }">${ p }</a>
						             </c:otherwise>
					            </c:choose>
					            </li>
					            </c:forEach>
					            
					            <!-- 다음 페이지로(>) -->
					            <li>
					            <c:choose>
								<c:when test="${ pi.page < pi.maxPage }"><a href="${ contextPath }/book/list?page=${ pi.page + 1 }${ searchParam }">&gt;</a></c:when>
								<c:otherwise><a href ="#">&gt;</a></c:otherwise>
								</c:choose>
					            </li>
			            		
			            		<!-- 맨 끝으로 이동하는 버튼(>>) -->
			            		<li><a href="${ contextPath }/book/list?page=${ pi.maxPage }${ searchParam }">&gt;&gt;</a></li>
							</c:otherwise>
						</c:choose>
						</ul>
					</div>
				</div>
			  </div>
			</div>
			<%@ include file="/WEB-INF/views/common/adArea.jsp" %>
		</div>
	<!-- footer -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp" /> 
	
<script>
	function detailView(bid){
		location.href="${contextPath}/book/detail?bid=" + bid;
	}
	
	function sectionCategory(category){
		location.href="${contextPath}/book/search/categorylist?category=" + category;
	}
</script>

<c:choose>
<c:when test="${ !empty loginUser }">
<script>            
    function direct(bid) {
      document.forms.acForm.action="${ contextPath }/order/direct" //바로구매 서블릿만들기
      document.forms.acForm.submit();
      return true;
    }
    
    function cart(bid) {
    	document.forms.acForm.action="${ contextPath }/cart?";
    	document.forms.acForm.submit();
    }
</script>
</c:when>
<c:otherwise>
<script>
	function direct(){
		alert('로그인 후 이용 가능합니다.');
		location.href="${contextPath}/login";
	}
	
	function cart(){
		alert('로그인 후 이용 가능합니다.');
		location.href="${contextPath}/login";
	}
</script>
</c:otherwise>
</c:choose>


<script src="${contextPath}/resources/js/star/jquery-1.11.3.min.js"></script>
<script src="${contextPath}/resources/js/star/star.js"></script>
</body>
</html>