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
		<div class="content">
            <div class="book_category">
                <ul class="cLi">
                    <c:forEach var="category" items="${ categoryList }">
                    <li onclick="seachCategory('${ category }')">${ category }</li>
                    </c:forEach>
                </ul>
            </div>
			<div class="booklist_area">
                <div class="bookSort">
                    <h2>검색 결과</h2>
                    <ul class="sortLi">
                    <!-- ajax로 해야하나? -->
                        <li><a href="${ contextPath }/book/popular">인기순</a></li><label> | </label>
                        <li><a href="${ contextPath }/book/new">신상품순</a></li><label> | </label>
                        <li><a href="${ contextPath }/book/highest">최고가순</a></li><label> | </label>
                        <li><a href="${ contextPath }/book/lowest">최저가순</a></li>
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
                                        <img src="${ contextPath }/resources/images/book/${ book.bimg }" alt="도서 이미지">
                                    </div>
                                </td>
                                <td class="book_info">
                                    <div class="book_title"><span onclick="detailView(${ book.bid })">[ ${ book.cname }]${ book.btitle }</span></div>
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
				                                    <input type="radio" name="star-input" value="1" id="p1">
				                                    <label for="p1">1</label>
				                                    <input type="radio" name="star-input" value="2" id="p2">
				                                    <label for="p2">2</label>
				                                    <input type="radio" name="star-input" value="3" id="p3">
				                                    <label for="p3">3</label>
				                                    <input type="radio" name="star-input" value="4" id="p4">
				                                    <label for="p4">4</label>
				                                    <input type="radio" name="star-input" value="5" id="p5">
				                                    <label for="p5">5</label>
				                                    <input type="radio" name="star-input" value="6" id="p6" checked>
				                                    <label for="p6">6</label>
				                                    <input type="radio" name="star-input" value="7" id="p7">
				                                    <label for="p7">7</label>
				                                    <input type="radio" name="star-input" value="8" id="p8">
				                                    <label for="p8">8</label>
				                                    <input type="radio" name="star-input" value="9" id="p9">
				                                    <label for="p9">9</label>
				                                    <input type="radio" name="star-input" value="10" id="p10">
				                                    <label for="p10">10</label>
				                                  </span>
				                                  <output for="star-input"><b>0</b>점</output>						
				                            </span>
				                        </span>
			                        </div>
			                        
                                    <div class="info_etc">
                                        <span>배송안내</span>
                                       	<span>무료</span>
                                    </div>
                                </td>
                                <td class="book_btns">
                                    <div class="btn_count">
                                        <input type="number" name="count" value="0" min="0" max="50" size="5">
                                    </div>
                                    <button id="basket" type="button" onclick="">장바구니</button>
                                    <button id="buy" type="button" onclick="">바로구매</button>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3" class="book_division"></td>
                            </tr>
                        </c:forEach>
                    </table>
                <div class="book_pages">
                    <ul class="book_paging">
                        <!-- 맨 처음으로 이동하는 버튼(<<) -->	
                        <li><a href="#">&lt;&lt;</a></li>
                    
                        <!-- 이전 페이지로(<) -->
                        <li>&lt;</li>
                        
                        <!-- 최대 10개의 페이지 목록 -->
                        <li>${ p }</li>
                        <li>1</li>

                        <!-- 다음 페이지로(>) -->
                        <li>&gt;</li>
                            
                        <!-- 맨 끝으로 이동하는 버튼(>>) -->
                        <li><a href="">&gt;&gt;</a></li>
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
	
	function seachCategory(category){
		location.href="${contextPath}/book/categorylist?category=" + category;
	}
</script>
<script src="${contextPath}/resources/js/star/jquery-1.11.3.min.js"></script>
<script src="${contextPath}/resources/js/star/star.js"></script>
</body>
</html>