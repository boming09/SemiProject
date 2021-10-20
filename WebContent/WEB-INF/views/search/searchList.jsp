<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="outer">
		<div class="wrap">
			<div class="booklist_area">
				<div class="book_title">
				</div>
                <div class="bookSort">
                    <h1>도서 결과</h1>
                    <ul class="sortLi">
                        <li><a href="#">인기순</a></li><em>|</em>
                        <li><a href="#">신상품순</a></li><em>|</em>
                        <li><a href="#">최고가순</a></li><em>|</em>
                        <li><a href="#">최저가순</a></li>
                    </ul>
                </div>
				<div class="book_list">
				    <!-- <c:forEach var="notice" items="${ bookList }"> -->
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
                                    <p class="book_title">킹덤</p>
                                    <div class="info">
                                        <span class="writer">요네스 뵈</span> | 
                                        <span class="publisher">비채</span> | 
                                        <span class="publication_date">2021년 10월</span>
                                    </div>
                                    <div class="price">
                                        <em class="book_price">17,280</em>원
                                    </div>
                                    <div class="book_rating">
                                        <span class="reviewCount"></span>
                                        <span class="reviewRating"></span>
                                    </div>
                                    <button class="info_etc" type="button">배송안내</button>
                                </td>
                                <td class="book_btns">
                                    <input type="number" value="0" min="0" max="50" size="5">
                                    <p></p>
                                    <button class="" type="button">장바구니</button>
                                    <p></p>
                                    <button class="" type="button">바로구매</button>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <hr>
				    <!-- </c:forEach> -->
                    <div class="book_pages">
                        <!-- book page -->
                    </div>
				</div>
			</div>
		</div>
	</div>   
</body>
</html>