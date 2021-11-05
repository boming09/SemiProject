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
<!-- 외부 스타일 -->
<link href="<%= request.getContextPath() %>/resources/css/book/bookDetail.css" rel="stylesheet">
<!-- JQuery-->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
crossorigin="anonymous"></script>
<!-- <script src="../js/jquery-3.6.0.min.js"></script> -->
<!-- icon url -->
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<title>bookDetailPage</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/menubar.jsp"/>
<div class="csarea wrapper">
    <div class="content">
        <div class="detailTopWrap">
            <div class="topColLft"> <!-- top left -->
                <div class="bookImgArea">   <!-- book image -->
                    <img src="${contextPath}/resources/images/book/pop1.png" alt="book">
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
                        <span id="spanBkRating">
                            <span class="star-input">
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
                                    <input type="radio" name="star-input" value="6" id="p6">
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
                        </span><!-- 별점으로 넣어야 함 -->
                        <span class="reviewCount">
                            <a href="#review">리뷰(<em>10</em>)</a> <!-- 리뷰로 이동 -->
                        </span>
                    </div>
                </div>
                <div class="infoBotWrap">
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
                                            <span>무료 &nbsp;<a id="etcMsg">?</a></span>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                            <div class="etc_p"><p>해외배송 &nbsp; 최저가 &nbsp; 소득공제</p></div>
                        </div>
                        <!-- 배송 안내 -->
	                    <div class="msgInfo">
                            <p>* 저희 봄숲에서는 주문건을 확인 후, 송장번호 입력일 기준으로 1~3일내 출고로 진행하고 있습니다</p>
                            <p>* 제주도 및 도서산간 지역은 기본배송료 외 추가 운임료가 발생할 수 있습니다.</p>
                            <p>&nbsp;추가 금액은 별도로 공지드리고있으니 이점 참고하여주세요</p>
                            <p>* 반품/교환/환불 신청은 상품수령후 7일이내에 게시판 혹은 카카오플친 모모케이스로 신청부탁드립니다.</p>
                            <p>* 상담시간 월-금 AM10:00 - PM5:00 휴일과 상담시간 외의 문의는 게시판을 이용해주세요</p>
	                    </div>
                        <!-- 구매 영역 -->
                        <div class="acArea">
                            <div class="btn_count">
                                <input type="number" name="count" value="0" min="0" max="50" size="5">
                            </div>
                            <button id="basket" type="button" onclick="">장바구니</button>
                            <button id="buy" type="button" onclick="">바로구매</button>
                        </div>
                    </div>
                </div>
            </div>
        <!-- top detail end -->
        </div> 

        <!-- 광고 -->
        <div class="adverArea">
            <img src="${contextPath}/resources/images/advertisement/adver.jpg">
        </div>

        <!-- bottom detail start -->
        <div class="detailBotWrap">
            <div class="detailInfo"><span>도서 정보</span></div>
            <div class="info_introduce information">
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
                    <div class="infoIframe">
				   <!-- <iframe width="934" height="525" src="https://www.youtube.com/embed/n9A1W52uJIA" title="YouTube video player" 
                        frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe> -->
                        <iframe width="861" height="452" src="https://www.youtube.com/embed/rqEvtVWTS5g" title="YouTube video player" 
                        frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                    </div>
                </div>
            </div>
            <div class="info_img information">
                <div class="infoSet"><h4>상세 이미지</h4></div>
                <div class="infoSetCont_wrap">
                    <div class="infoImgWrap"><img src="${contextPath}/resources/images/detailBook/${ book.filepath }" alt="detailView"></div>
                </div>
            </div>

            <div class="info_auth information">
                <div class="infoSet"><h4>저자 소개</h4></div>
                <div class="infoSetCont_wrap">
                    <div class="authCont">
                        <div class="authImg"><img src="${contextPath}/resources/images/author/auth.jpg"></div>
                        <div class="authTxtWrap">
                            <div class="authTit"><h5 class="authorName">요 네스뵈</h5></div>
                            <span class="authTxt">
                                <p>
                                                                        북유럽 스릴러의 자존심, 제2의 스티그 라르손, 북유럽의 제프리 디버, 마이클 코넬리, 할런 코벤 등 화려한 별칭을 달고 다니는 요 네스뵈는 현재 유럽에서 가장 인기 있고 잘나가는 노르웨이의 국민 작가이자 뮤지션, 저널리스트 그리고 경제학자이다. 그의 소설들은 고향인 노르웨이에서만 150만 부 이상 팔려나갔다. 에드거 상 최종후보에도 오른 바 있는 네스뵈의 책들은 전 세계 40개 이상의 언어로 소개되어 날개 돋친 듯 팔리고 있다.
                                    
                                    1960년, 그의 소설의 주된 무대이기도 한 노르웨이의 오슬로에서 태어났고, 그곳에 살고 있다. 어려서부터 축구에 두각을 나타내어 ‘몰데’ 소속으로 노르웨이 프리미어 리그에서 뛰었다. 그러나 열여덟 살에 무릎 인대가 파열되어 축구선수의 꿈을 접었다. 군복무를 마친 후 노르웨이 비즈니스 스쿨에서 경제학을 전공했다. 이때 친구들과 밴드 ‘디 데레(Di Derre)’를 결성했는데, 처음에는 실력이 형편없다는 이유로 매번 밴드의 이름을 바꾸었지만 차츰 팬들이 그들을 기억하게 되었고, 이름을 몰라 ‘그 남자들(Di Derre)’을 찾던 것이 훗날 밴드 이름으로 굳어졌다고 한다.
                                    
					                                현재 노르웨이의 록 밴드 ‘디 데레(Di Derre)’에서 보컬을 맡고 있는 특이한 전력의 요 네스뵈는 음악에 대한 대단한 열정을 보이고 있는 것으로도 유명하다. 디 데레에서 보컬로 활동하며 노르웨이 최다 음반 판매를 기록하기도 한 그는 해리 홀 시리즈를 비롯해, 쓰는 작품마다 평단의 호평과 대중적인 성공을 함께 이끌어 내며 다재다능한 작가로서의 면모를 과시하고 있다.
					                                    
					                                졸업 후 네스뵈는 증권중개업을 하면서 저널리스트 활동에 밴드 활동까지 이어갔다.
                                </p>
                                
                                <p>
                                  	그러던 어느 날, 그는 돌연 멤버들에게 활동 중단을 선언한 후 오스트레일리아로 떠났다. 낮에는 숫자와 씨름하고 저녁에는 무대에 서는 나날에 지친 탓도 있었고, 자신이 글을 쓸 수 있는지 알아보고 싶어서이기도 했다. 그로부터 반년 후, 그는 첫 작품 『박쥐』와 함께 돌아왔다. 바로 ‘형사 해리 홀레 시리즈’의 시작이다. 이 작품으로 네스뵈는 페터 회, 스티그 라르손, 헤닝 만켈 등 쟁쟁한 작가들이 거쳐 간 북유럽 최고의 문학상 ‘유리열쇠상’을 거머쥐었다.
                                    
                                    190센티미터가 넘는 키에 민첩하고 깡마른 몸. 수사에 있어서는 천재적이지만 권위주의 따위는 가볍게 무시해버리는 반항적 언행으로 종종 상관들의 골칫거리가 되는 해리 홀레 반장은 악과 싸우다 악에 물든 매력적인 반영웅 캐릭터이다. 네스뵈는 거의 매년 해리 홀레가 등장하는 소설을 발표해왔는데, 형사 해리의 탄생을 담은 잔혹한 성장소설 『박쥐』를 비롯해 역사소설적 면모를 보여준 『레드브레스트』, 동화 속 눈사람을 호러로 바꾸어놓은 『스노우맨』, 거대한 스케일로 압도하는 『레오파드』, 아들이 아닌 아버지로서의 해리를 그린 『팬텀』까지 발표하는 작품마다 뜨거운 화제를 불러 일으켰다. 각각의 에피소드 속에서 해리는 한결같이 세상의 악을 향해 맨몸으로 돌진해, 다치고 피 흘리고 무언가를 잃는다. 하지만, 시리즈 제10권 『폴리스』부터 나타나는 악의 양상은 지금까지와는 사뭇 다르다.
                                    
					                                 그 악은 사회 고위층의 악이고 세상을 지배하는 악이다. 해리 홀레가 성장한 만큼 작가가 세상을 바라보는 시선 또한 달라졌음을 짐작하게 한다.
					                                    
					                                 해리 홀레가 등장하는 소설은 지금까지 총 9권이 발표되었고, 모두 발표와 동시에 베스트셀러에 랭크되며 독자들의 사랑을 받았다. 또한 유럽 각국의 서점가에서 '다시없을 최고의 소설' '올해의 소설'로 거의 매년 선정되면서 북유럽문학 붐의 선두에 섰으며 핀란드와 덴마크 등지에서 최우수 외국문학상을 수상했다. 대거상과 임팩 더블린 문학상, 에드거상 등 세계적인 문학상에도 다수 노미네이트되었다.
                                </p>
                                <p>
				                                    스노우맨』은 그중 일곱 번째로, 유럽을 시작으로 미국과 영국에서 베스트셀러 최상위권을 차지하면서 네스뵈를 세계적인 작가의 반열에 당당히 세워준 작품이다.
				                                    
				                                    특히 외국 작가들의 작품을 잘 읽지 않는 보수적인 영국 서점가에서 무려 석 달 연속 베스트셀러 목록에 올라 화제가 되었다. 노르웨이 베스트셀러 차트 10위권 중 7권이 '해리 홀레 시리즈'로 채워지면서 『스노우맨』을 필두로 1,2,3위를 동시 석권한 일 또한 유명하다. 할리우드의 거장 마틴 스콜세지 감독이 의욕적으로 영화화에 돌입하면서 『스노우맨』 열풍은 당분간 지속될 전망이다.
				                                        
				                                    지금까지 12권이 발표된 형사 해리 홀레 시리즈는 전세계 40개국에서 출간되어 베스트셀러에 오르며 북유럽문학 붐의 선두에 섰다. 노르웨이 국왕은 물론 마이클 코넬리, 제임스 엘로이 등 유명 작가들이 앞다투어 그의 팬을 자처했고, 영국에서는 가장 많이 팔린 외국소설로 선정되었다. 핀란드와 덴마크에서 최우수 외국문학상을 수상했고 일본과 대만에서의 인기도 뜨겁다. 2014년에는 한국을 방문하여 팬들과 뜻깊은 시간을 가졌다.
                                </p>
                                    
                                <p>
				                                    노르웨이의 문학을 세계에 알린 공로를 인정받아 2013년 페르귄트상을, 2015년 상트페테르부르크상을, 2016년 리버튼 공로상을 수상했다.
				                                    
				                                    몸이 열 개라도 모자랄 것 같은 작가 요 네스뵈는 그러나 뮤지션으로도 매우 활발히 활동하고 있다. 실제로 그는 노르웨이의 록밴드 디 데레Di Derre의 보컬이자 작곡가이며 지금도 해마다 100회 이상의 공연을 소화한다. 또한 저널리스트로서의 활동도 꾸준히 이어가고 있다. 지난해 노르웨이 폭탄 테러 사건 이후 네스뵈는 복지국가로서 노르웨이의 모습을 회고하는 글을 [뉴욕타임스]에 기고해 비극의 본질을 날카롭게 분석했다. 뿐만 아니라 아동문학에도 깊은 관심을 갖고 제3세계 어린이들을 위한 독서와 글쓰기 재단을 창립, 자선활동에 힘쓰고 있으며 괴짜 발명가 프록터 박사의 기상천외한 발명 대소동을 그린 동화 『우주비행 방귀가루』로 어린이 독자들까지 사로잡았다.
				                                    
				                                    업계 최고 인재 중에서도 최고만을 상대하는 한 헤드헌터의 이중생활을 묘사한 『헤드헌터』는 2008년 노르웨이 올해의 책에 선정된 작품으로 최근 영화로 제작되었다. 다방면에 뛰어난 재능을 보이는 그는, 『헤드헌터』의 수익금으로 제3세계 어린이들을 위한 독서와 글쓰기 재단을 창립하는 등 자선활동에도 적극적으로 나서며 노블레스 오블리주를 실천하고 있다. 그 외 저서로는 『네메시스』, 『박쥐』등이 있다.
                                </p>
                            </span>
                        </div>
                    </div>
                </div>
            </div>

            <div class="info_review information">
                <div class="infoSet" id="review"><h4>회원 리뷰</h4></div>
                <div class="infoSetCont_wrap">
                    <!-- 1 -->
                    <div class="reviewContTop">
                        <div class="review_starWrap"><!-- 별점 영역 -->
                            <p class="reviewTop">봄숲 회원이 평가한 평균 별점</p>
                            <div class="book_rating">
                                <span class="total_rating">
                                    <span class="star-input">
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
                                            <input type="radio" name="star-input" value="6" id="p6">
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
                                        <output for="star-input"><b>0</b></output>						
                                    </span>
                                </span><!-- 별 -->
                                <em class="bom_b"></em><!-- 9.8점 -->
                                <em class="bom_m">/10</em><!-- 10점 만점 -->
                            </div>
                        </div>
                    </div>
                    <!-- 2 -->
                    <div class="reviewWrite">
                        <div class="writeRating">
                            <span>평점&nbsp;</span>
                            <span class="starGrp">
                                <span class="star-input">
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
                                        <input type="radio" name="star-input" value="6" id="p6">
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
                                    <output for="star-input"><b></b></output>						
                                </span>
                            </span>
                        </div>
                        <div class="writeArea_wrap">
                            <div class="writeArea">
                                <textarea id="replyCont" rows="5" cols="70" style="resize:none;" maxlength="149" 
                                placeholder="한글 기준 150자까지 작성 가능" onkeydown="calc()" onkeyup="calc()" onkeypress="calc()"></textarea>
                                <span class="wordCount">
                                    <input type="number" id="count" value="0" min="0" max="150" readonly>/150
                                </span>
                            </div>
                            <button class="writeBtn" onclick="ajaxUse();">등록</button>
                        </div>
                    </div>
                    <!-- 3 reviewList -->
                    <div class="reviewContentList">
                        <!-- c:forEach -->
                        <div class="reviewInfoGrp">
                            <div class="reviewInfoTop">
                                <div class="cmt_rating">
                                    <span class="rating">
                                        <span class="star-input">
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
                                                <input type="radio" name="star-input" value="6" id="p6">
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
                                            <!-- <output for="star-input"><b></b></output> -->						
                                        </span>
                                    </span>
                                </div>
                                <div class="cmt_cont">
                                    <span class="txt_cont">
					                                    노르웨이의 문학을 세계에 알린 공로를 인정받아 2013년 페르귄트상을,
	                                  2015년 상트페테르부르크상을, 2016년 리버튼 공로상을 수상했다.
					                                    몸이 열 개라도 모자랄 것 같은 작가 요 네스뵈는 그러나 뮤지션으로도 매우 활발히 활동하고 있다.
					                                    실제로 그는 노르웨이의 록밴
                                    </span>
                                </div>
                            </div>
                            <div class="reviewInfoBot">
                                <span class="txt_id">l*****3</span>
                                <span class="txt_esc">|</span>
                                <span class="txt_date">2021-10-28</span>
                            </div>
                        </div>
                        <div class="authReply">작가 댓글 보기&nbsp;<i class="fas fa-caret-down"></i></div>
                        <div class="replyCmt">
                            <div class="cmt_cont">
                                <span class="txt_cont">
				                                    노르웨이의 문학을 세계에 알린 공로를 인정받아 2013년 페르귄트상을,
                                  2015년 상트페테르부르크상을, 2016년 리버튼 공로상을 수상했다.
				                                    몸이 열 개라도 모자랄 것 같은 작가 요 네스뵈는 그러나 뮤지션으로도 매우 활발히 활동하고 있다.
				                                    실제로 그는 노르웨이의 록밴
                                </span>
                            </div>
                            <div class="reviewInfoBot">
                                <span class="txt_id">l*****3&nbsp;<i class="fas fa-check-circle"></i></span>
                                <span class="txt_esc">|</span>
                                <span class="txt_date">2021-10-28</span>
                            </div>
                        </div>
                    </div>
                    <div class="reviewContentList">
                        <!-- c:forEach -->
                        <div class="reviewInfoGrp">
                            <div class="reviewInfoTop">
                                <div class="cmt_rating">
                                    <span class="rating">
                                        <span class="star-input">
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
                                                <input type="radio" name="star-input" value="6" id="p6">
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
                                            <!-- <output for="star-input"><b></b></output> -->
                                        </span>
                                    </span>
                                </div>
                                <div class="cmt_cont">
                                    <span class="txt_cont">
					                                        노르웨이의 문학을 세계에 알린 공로를 인정받아 2013년 페르귄트상을, 2015년 상트페테르부르크상을, 2016년 리버튼 공로상을 수상했다.
					                                        몸이 열 개라도 모자랄 것 같은 작가 요 네스뵈는 그러나 뮤지션으로도 매우 활발히 활동하고 있다. 실제로 그는 노르웨이의 록밴
                                    </span>
                                </div>
                            </div>
                            <div class="reviewInfoBot">
                                <span class="txt_id">l*****3</span>
                                <span class="txt_esc">|</span>
                                <span class="txt_date">2021-10-28</span>
                            </div>
                        </div>
                        <!-- 작가계정 : 답글 달기 button -->
                        <div class="authReply">작가 댓글 보기&nbsp;<i class="fas fa-caret-down" onclick="closeMsg();"></i></div>
                        <div class="replyCmt">
                            <div class="cmt_cont">
                                <span class="txt_cont">
				                                        노르웨이의 문학을 세계에 알린 공로를 인정받아 2013년 페르귄트상을, 2015년 상트페테르부르크상을, 2016년 리버튼 공로상을 수상했다.
				                                        몸이 열 개라도 모자랄 것 같은 작가 요 네스뵈는 그러나 뮤지션으로도 매우 활발히 활동하고 있다. 실제로 그는 노르웨이의 록밴
                                </span>
                            </div>
                            <div class="reviewInfoBot">
                                <span class="txt_id">l*****3&nbsp;<i class="fas fa-check-circle"></i></span>
                                <span class="txt_esc">|</span>
                                <span class="txt_date">2021-10-28</span>
                            </div>
                        </div>
                    </div>
                    <!-- sort ... -->
                </div>
            </div>  
        </div>
    </div>
    <%@ include file="/WEB-INF/views/common/adArea.jsp" %>
</div>
<!-- footer -->
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
<script src="${contextPath}/resources/js/star/jquery-1.11.3.min.js"></script>
<script src="${contextPath}/resources/js/star/star.js"></script>
<script>
    $('.authReply').click(function(){
        if($(this).siblings('.replyCmt').css('display') == 'none'){ // question다음의 컨텐츠 영역이 display=none일 때
            $('.replyCmt').slideUp();       // 기존에 열려있는 콘텐츠는 닫고
            $(this).siblings('.replyCmt').slideDown();  // 클릭한 메뉴의 콘텐츠는 밑으로 스르륵 내려오게
        }else{
            $(this).siblings('.replyCmt').slideUp();    // display=none 이 아닐 때 클릭 시 위로 올라가게
        }
    });
</script>
<script>
    function calc(){
        document.getElementById('count').value = 
        document.getElementById('replyCont').value.length;
        if(document.getElementById('count').value == 150) {
            alert("한글 기준 150자까지 입력가능합니다.");
        }
    }
    
    $(document).ready(function () {
        $('#etcMsg').click(function(){  // a 태그를 클릭하면 함수 동작하는데
            if($('.msgInfo').css('display') == 'none'){  // div가 안보이면
                $('.msgInfo').show();   // 보이게
            } else {
                $('.msgInfo').hide();   // 보이면 안보이게
            }
        });
    });
</script>
</body>
</html>