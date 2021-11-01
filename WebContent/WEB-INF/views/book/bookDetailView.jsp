<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <!-- CSS -->
    <!-- 브라우저별로 디폴트로 적용된 CSS에 차이(여백, 폰트 크기 등)가 있어 CSS가 별도로
    지정되지 않은 요소는 브라우져 별로 다르게 보일 가능성이 있음. 만들어져 있는 리셋 CSS 활용. -->
    <!-- ress.css (모든 CSS 리셋이 아니라 디폴트 스타일을 활용해서 브라우저들의 최소한의 오차를 없앰) 
    https://github.com/filipelinhares/ress -->
    <link rel="stylesheet" href="https://unpkg.com/ress/dist/ress.min.css">

    <title>bookDetailPage</title>
    <script>
        function calc(){
            document.getElementById('count').value = 
            document.getElementById('content').value.length;
        }
    </script>
<style>
    .content {
        margin: 20px 0;
    }

    .detailTopWrap {
        display: flex;
        justify-content: space-around;
    }
    
    .bookImgArea img {
        width: 250px;
        height: 362px;
    }

    .infoTop {
        border-top: 1px solid rgba(196, 217, 195, 1);
        border-bottom: 1px solid rgba(196, 217, 195, 1);
    }

    .infoTop > div{
        padding-bottom: 0.8em;
    }

    .titleName{
        margin-top: 0.83em;
        text-align: left;
    }

    table {
        border-spacing: 0 20px;
    }

    .accentRow {    /* 판매가 */
        color: red;
        font-weight: bold;
    }

    .accentPrice {
        /* 1. "판매가"와 동일선상에 있었으면 좋겠다. */
        font-size: 1.25rem;
    }
    .acArea {
        display: flex;
        align-items: center;
    }

    .etcRow a {
        color: black;
        text-decoration: none;
        border: 1px solid black;
        padding: 0 3px;
    }
    .etcRow a:hover {
        border-color : orange;
    }

    .etc_ul {
        list-style: none;
        display: flex;
    }

    .etc_ul li {
        color: gray;
        margin-left: 5px;
    }

    /* 결제 버튼  영역 */
    .acArea input,
    .acArea button {
        margin: 8px;
    }

    .btn_count {
        border: 1px solid gray;
        margin: 7px;
        width: 80px;
        height: 30px;
        text-align: right;
    }

    .btn_count input[type=number] {
        margin: 5px;
    }

    .btn_count:hover{
        border-color: orange;
    }

    .basket{
        color: #577057;
        border: 1px solid #577057;
        width: 80px;
        padding: 5px;
    }

    .basket:hover,
    .buy:hover  {
        background-color: rgba(196, 217, 195, 1);
        color: black;
        border: 1px solid white;
        font-weight: bold;
    }

    .buy {
        background: #577057;
        color: white;
        width: 80px;
        padding: 5px;
    }
    /* 결제 버튼 영역 끝 */

    /* 광고 영역 : 사이즈 지정하기 */
    .adverArea {
        margin-top: 20px;
    }

    .adverArea img{
        width: 730px;
    }

    /* 도서 정보 */
    .detailBotWrap {
        margin-top: 20px;
    }

    .detailInfo {
        border-bottom: 5px solid rgba(196, 217, 195, 1);
    }

    .detailInfo span {
        background: rgba(196, 217, 195, 1);
        padding: 5px;
        font-size: 1.25rem;
        font-weight: bold;
    }

    /* 책 소개 영역 */
    .info_introduce {
        padding: 20px 0;
        border-bottom: 1px solid lightgray;
    }

    .info_introduce > div {
        padding: 10px 0;
    }

    /* 상세 이미지 */
    .infoSet {
        font-size: 20px;
        /* font-family: ""; */
    }
</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/menubar.jsp"/>
<div class="csarea wrapper">
    <div class="content">
        <div class="detailTopWrap">
            <div class="topColLft"> <!-- top left -->
                <div class="bookImgArea">   <!-- book image -->
                    <img src="resources/image/pop1.png">
                </div>
            </div>
            <div class="topColRft"> <!-- top right -->
                <div class="infoTop">   <!-- 도서정보 top: 정보관련 -->
                    <div class="titleArea"><h2 class="titleName">킹덤</h2></div>
                    <div class="pubArea">
                        <span class="book_auth">요 네스뵈&nbsp;김승옥</span>
                        <span>|</span>
                        <span class="book_pub">비채</span>
                        <span>|</span>
                        <span class="book_date">2021년 10월 11일</span>
                    </div>
                    <div class="ratingArea">
                        <span id="spanBkRating">별, 별, 별, 별, 별</span><!-- 별점으로 넣어야 함 -->
                        <span class="reviewCount">
                            <a href="#">리뷰(<em>10</em>)</a> <!-- 리뷰로 이동 -->
                        </span>
                    </div>
                </div>
                <div class="infoBot">   <!-- 도서 정보 bottom: 구매관련 -->
                    <div class="priArea">
                        <table>
                            <colgroup>
                                <col width="80">
                                <col width="*">
                            </colgroup>
                            <tbody>
                                <tr class="row">
                                    <td>정가</td>
                                    <td>19,800원</td>
                                </tr>
                                <tr class="accentRow">
                                    <td>판매가</td>
                                    <td><span class="accentPrice">17,820원</span></td>
                                </tr>
                                <tr class="etcRow">
                                    <td>배송안내</td>
                                    <td>
                                        <span class="">
                                            무료 &nbsp;<a href="#" onclick="openLayer()">?</a>
                                        </span>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="acArea"> <!-- 구매로 이동 -->
                        <div class="btn_count">
                            <input type="number" name="count" value="0" min="0" max="50" size="5">
                        </div>
                        <button class="basket" type="button" onclick="">장바구니</button>
                        <button class="buy" type="button" onclick="">바로구매</button>
                        <ul class="etc_ul">
                            <li>해외배송</li>
                            <li>최저가</li>
                            <li>소득공제</li>
                        </ul>
                    </div>

                    <div class="">

                    </div>
                </div>
            </div>
        <!-- top detail end -->
        </div> 

        <!-- 광고 -->
        <div class="adverArea">
            <img src="resources/image/adver.jpg">
        </div>

        <!-- bottom detail start -->
        <div class="detailBotWrap">
            <div class="detailInfo"><span>도서 정보</span></div>
            <div class="info_introduce">
                <div class="infoSet"><h4>책 소개</h4></div>
                <div class="infoSetCont_wrap">
                    <p>
조용한 시골 마을 오스. ‘로위’와 ‘칼’은 세상에 둘도 없는 형제다. 의문의 사고로 부모님을 잃고 형제는 더욱 각별해졌다. 
로위는 동생을 위해 어떤 희생도 감수하지만, 칼은 형의 희생을 당연하다고 여기는 듯하다. 오랜 유학을 마치고 오스로 금의환향한 칼은 부모님이 물려준 땅에 거대한 호텔을 짓겠다고 호언장담한다.
마을 전체가 기대감으로 들썩거리면서 형제가 묻어둔 비밀 또한 위태로워지는데….
<br><br>
명실상부한 스릴러의 제왕이자 전설의 ‘형사 해리 홀레 시리즈’의 작가 요 네스뵈가 오랜만에 내놓는 스탠드얼론(단독 작품) 『킹덤』이 출간되었다.
정교한 구성과 겹겹의 반전, 깔끔하게 회수되는 복선, 입체적인 캐릭터가 선사하는 몰입감, 의외의 블랙 유머, 750페이지에 달하는 만족스러운 볼륨까지 독자가 요 네스뵈에게 기대하는 모든 요소를 갖춘 웰메이드 스릴러이다.
                    </p>
                    <!-- iframe or 목차 넣기 -->
                    <iframe width="560" height="315" src="https://www.youtube.com/embed/n9A1W52uJIA" title="YouTube video player" 
                    frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

                </div>
            </div>
            <div class="info_img">
                <div class="infoSet"><h4>상세 이미지</h4></div>
                <div class="infoSetCont_wrap">
                    <div class="infoWrap"><img src="resources/image/pop1.png" alt="상세이미지" border="1"></div>
                </div>
            </div>

            <div class="info_auth">
                <div class="infoSet"><h4>저자 소개</h4></div>
                <div class="infoSetCont_wrap">
                    <div class="authTit"><h5 class="authorName">요 네스뵈</h5></div>
                    <div class="authCont">
                        <span class="authImg"><img src="#"></span>
                        <span class="authTxt">
북유럽 스릴러의 자존심, 제2의 스티그 라르손, 북유럽의 제프리 디버, 마이클 코넬리, 할런 코벤 등
 화려한 별칭을 달고 다니는 요 네스뵈는 현재 유럽에서 가장 인기 있고 잘나가는 노르웨이의 국민 작가이자 뮤지션, 저널리스트 그리고 경제학자이다.
그의 소설들은 고향인 노르웨이에서만 150만 부 이상 팔려나갔다. 에드거 상 최종후보에도 오른 바 있는 네스뵈의 책들은 전 세계 40개 이상의 언어로 소개되어 날개 돋친 듯 팔리고 있다.
                        </span>
                    </div>
                </div>
            </div>

            <div class="info_review">
                <div class="infoSet"><h4>회원 리뷰</h4></div>
                <div class="infoSetCont_wrap">
                    <div class="reviewContTop"><!-- 1 -->
                        <div class="review_starWrap"><!-- 별점 영역 -->
                            <p class="reviewTop">봄숲 회원이 평가한 평균 별점 font-size 23px</p>
                            <div class="book_rating">
                                <span class="total_rating"></span><!-- 별 -->
                                <em class="bom_b">9.8</em><!-- 9.8점 -->
                                <em class="bom_m">10</em><!-- 10점 만점 -->
                            </div>
                        </div>
                    </div>

                    <div class="reviewWrite"><!-- 2 -->
                        <div class="writeRating">
                            <span>평점</span>
                            <span class="starGrp">
                                <a href="" onclick=""><em class="rating_1">별 2점</em></a>
                                <a href="" onclick=""><em class="rating_2">별 4점</em></a>
                                <a href="" onclick=""><em class="rating_3">별 6점</em></a>
                                <a href="" onclick=""><em class="rating_4">별 8점</em></a>
                                <a href="" onclick=""><em class="rating_5">별 10점</em></a>
                            </span>
                        </div>
                        <div class="writeArea_wrap">
                            <div class="writeArea">
                                <textarea id="content" rows="5" cols="70" style="resize:none;" placeholder="한글 기준 150자까지 작성 가능"
                                onkeydown="calc()" onkeyup="calc()" onkeypress="calc()"></textarea>
                                <span>
                                    <input type="number" id="count" value="0" readonly>
                                    <em>/150</em>
                                </span>
                                <button class="writeBtn" onclick="ajaxUse">등록</button>
                            </div>
                        </div>
                    </div>

                    <div class="reviewContentList"><!-- 3 reviewList -->
                        <!-- c:forEach -->
                        <div class="reviewInfoGrp">
                            <div class="reviewInfoTop">
                                <div class="cmt_rating"><span class="rating">별 10점</span></div>
                                <div class="cmt_cont"><span class="txt_cont">재밌어요</span></div>
                            </div>
                            <div class="reviewInfoBot">
                                <span class="txt_id">l*****3</span>
                                <span class="txt_esc">|</span>
                                <span class="txt_date">2021-10-28</span>
                            </div>
                        </div>
                    </div>

                    <!-- sort ... -->
                </div>
            </div>
        <!-- bottom detail 끝 -->    
        </div>
    </div>
</div>    
</body>
</html>