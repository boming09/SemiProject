<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SearchListView</title>

<!-- CSS -->
<!-- 브라우저별로 디폴트로 적용된 CSS에 차이(여백, 폰트 크기 등)가 있어 CSS가 별도로
지정되지 않은 요소는 브라우져 별로 다르게 보일 가능성이 있음. 만들어져 있는 리셋 CSS 활용. -->
<!-- ress.css (모든 CSS 리셋이 아니라 디폴트 스타일을 활용해서 브라우저들의 최소한의 오차를 없앰) 
https://github.com/filipelinhares/ress -->
<link rel="stylesheet" href="https://unpkg.com/ress/dist/ress.min.css">
<!-- favicon (Real Favicon Generator 등에서 가공 필요) -->
<link rel="icon" type="image/x-icon" href="resources/image/khfavicon.ico">
<!-- 외부 스타일 시트 -->
<link href="<%= request.getContextPath() %>/resources/css/bookList.css" rel="stylesheet">
</head>
<body>
<jsp:include page="/WEB-INF/views/common/menubar.jsp"/>
<jsp:include page="/WEB-INF/views/common/category.jsp"/>
	<div class="csarea outer">
		<div class="content wrapper">
            <div class="book_category">
                <ul class="cLi">
                    <!-- c:forEach -->
                    <li>종교</li>
                    <li>만화/라이트노벨</li>
                    <li>어린이</li>
                    <li>소설/시/희곡</li>
                    <!-- c:forEach -->
                </ul>
            </div>
			<div class="booklist_area">
                <div class="bookSort">
                    <h1>검색 결과</h1>
                    <ul class="sortLi">
                        <li><a href="#">인기순</a></li><label> | </label>
                        <li><a href="#">신상품순</a></li><label> | </label>
                        <li><a href="#">최고가순</a></li><label> | </label>
                        <li><a href="#">최저가순</a></li>
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
                            <tr>
                                <td class="book_img">
                                    <div class="img_wrap">
                                        <img src="resources/image/pop1.png">
                                    </div>
                                </td>
                                <td class="book_info">
                                    <div class="book_title">킹덤</div>
                                    <div class="info">
                                        <span class="writer">요네스 뵈</span> | 
                                        <span class="publisher">비채</span> | 
                                        <span class="publication_date">2021년 10월</span>
                                    </div>
                                    <div class="price">
                                        <span class="book_price">17,280</span>원
                                    </div>
                                    <div class="book_rating">
                                        <span class="reviewCount"></span>
                                        <span class="reviewRating"></span>
                                    </div>
                                    <div>
                                        <button class="info_etc" type="button">배송안내</button>
                                    </div>
                                </td>
                                <td class="book_btns">
                                    <div class="">
                                        <input type="number" name="count" value="0" min="0" max="50" size="5">
                                    </div>
                                    <button class="basket" type="button" onclick="">장바구니</button>
                                    <button class="buy" type="button" onclick="">바로구매</button>
                                </td>
                            </tr>
                            <!-- c:forEach -->
                            <tr>
                                <td colspan="3" class="book_division"></td>
                            </tr>
                            <tr>
                                <td class="book_img">
                                    <div class="img_wrap">
                                        <img src="resources/image/pop1.png">
                                    </div>
                                </td>
                                <td class="book_info">
                                    <div class="book_title">킹덤</div>
                                    <div class="info">
                                        <span class="writer">요네스 뵈</span> | 
                                        <span class="publisher">비채</span> | 
                                        <span class="publication_date">2021년 10월</span>
                                    </div>
                                    <div class="price">
                                       <span class="book_price">17,280</span>원
                                    </div>
                                    <div class="book_rating">
                                        <span class="reviewCount"></span>
                                        <span class="reviewRating"></span>
                                    </div>
                                    <div>
                                        <button class="info_etc" type="button">배송안내</button>
                                    </div>
                                </td>
                                <td class="book_btns">
                                    <div class="btn_count">
                                        <input type="number" name="count" value="0" min="0" max="50" size="5">
                                    </div>
                                    <button class="basket" type="button" onclick="">장바구니</button>
                                    <button class="buy" type="button" onclick="">바로구매</button>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3" class="book_division"></td>
                            </tr>
                        </tbody>
                    </table>
                <div class="book_pages">
                    <ul class="book_paging">
                        <!-- 맨 처음으로 이동하는 버튼(<<) -->	
                        <li><a href="#">&lt;&lt;</a></li>
                    
                        <!-- 이전 페이지로(<) -->
                        <li>&lt;</li>
                        
                        <!-- 최대 10개의 페이지 목록 -->
                        <li>${ p }</li>

                        <!-- 다음 페이지로(>) -->
                        <li>&gt;</li>
                            
                        <!-- 맨 끝으로 이동하는 버튼(>>) -->
                        <li><a href="">&gt;&gt;</a></li>
                    </ul>
                </div>
                    </div>
				</div>
			</div>
		</div>
	<!-- footer -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp" /> 
</body>
</html>