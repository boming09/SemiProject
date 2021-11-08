<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
                    <img name="bookname" src="${contextPath}/resources/images/book/${ book.bimg }" alt="book">
                </div>
            </div>
            <div class="topColRft"> <!-- top right -->
                <div class="infoTop">   <!-- 도서정보 top: 정보관련 -->

                    <div class="titleArea"><h2 class="titleName">${ book.btitle }</h2></div>

                    <div class="pubArea">
                        <span class="book_auth">${ book.author }&nbsp;${ book.editor }</span>
                        <span>|</span>
                        <span class="book_pub">${ book.publisher }</span>
                        <span>|</span>
                        <span class="book_date">
                        <fmt:formatDate value="${ book.publicationDate }" type="date" pattern="yyyy년 MM월 dd일"/>
                        </span>
                    </div>
                    <div class="ratingArea">
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
                                        <td>
                                        	<fmt:formatNumber value="${ book.price }" groupingUsed="true"/>원
                                        </td>
                                    </tr>
                                    <tr class="accentRow">
                                        <td>판매가</td>
                                        <td>
                                        	<span class="accentPrice">
                                        		<fmt:formatNumber value="${ book.salePrice }" groupingUsed="true"/>원
                                        	</span>
                                       	</td>
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
                            <p>* 반품/교환/환불 신청은 상품수령후 7일이내에 게시판으로 신청부탁드립니다.</p>
                            <p>* 상담시간 월-금 AM10:00 - PM5:00 휴일과 상담시간 외의 문의는 게시판을 이용해주세요</p>
	                    </div>
                        <!-- 구매 영역 -->
                        <div class="acArea">
                        
                        
                        <!-- 로그인 하지 않으면 장바구니/구매 버튼 보이지 않는 처리와 버튼과 페이지 연결  -->
						<script>            
				            function submit2(frm) {
				              frm.action="${ contextPath }/order/direct" //바로구매 서블릿만들기
				              frm.submit();
				              return true;
				            }                 
			         	 </script>
			                            
                          <c:if test="${ ! empty loginUser}">
                          <form action="${ contextPath }/cart" method="post">
                          <input type="hidden" name="book_id" value="14"> <!--  name=${ book.book_id }-->
	                            <div class="btn_count">
	                                <input type="number" name="count" value="1" min="1" max="50" size="5">
	                            </div>
	                            <button id="basket" type="submit">장바구니</button>
	                            <button id="buy" type="button" onclick="return submit2(this.form);">바로구매</button>
                          </form>
                          </c:if> 
                                              
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
                    <p>${ book.bintro }</p>
                    <!-- iframe or 목차 넣기 -->
	                  <div class="infoIframe">
                    	<c:if test="${ !empty book.burl }">
	                        <iframe width="861" height="452" src="${ book.burl }" title="YouTube video player" 
	                        frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                    	</c:if>
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
                            <div class="authTit"><h5 class="authorName">${ book.author }</h5></div>
                            <span class="authTxt">
                                <p>${ book.aintro }</p>
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
                                            <input type="radio" name="star-input" value="6" id="p6">
                                            <label for="p6">6</label>
                                            <input type="radio" name="star-input" value="7" id="p7" checked>
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
                                                <input type="radio" name="star-input" value="5" id="p5" checked>
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
                                <span class="txt_id">${ book.author }&nbsp;<i class="fas fa-check-circle"></i></span>
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
                                                <input type="radio" name="star-input" value="6" id="p6">
                                                <label for="p6">6</label>
                                                <input type="radio" name="star-input" value="7" id="p7">
                                                <label for="p7">7</label>
                                                <input type="radio" name="star-input" value="8" id="p8">
                                                <label for="p8">8</label>
                                                <input type="radio" name="star-input" value="9" id="p9" checked>
                                                <label for="p9">9</label>
                                                <input type="radio" name="star-input" value="10" id="p10">
                                                <label for="p10">10</label>
                                            </span>
                                            <output for="star-input"><b></b></output>
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
                                <span class="txt_id">${ book.author }&nbsp;<i class="fas fa-check-circle"></i></span>
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