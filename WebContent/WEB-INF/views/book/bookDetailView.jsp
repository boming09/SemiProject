<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	pageContext.setAttribute("newReply", "\n");
%>
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
                    <img name="bookname" src="${contextPath}${ book.bimg }" alt="book">
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
                                	<!-- name 값 따로 주기 -->
                                    <input type="radio" name="starScore" value="1" id="p1"
                                    <c:if test="${ book.starScore == '1' }">checked</c:if>>
                                    <label for="p1">1</label>
                                    <input type="radio" name="starScore" value="2" id="p2"
                                    <c:if test="${ book.starScore == '2' }">checked</c:if>>
                                    <label for="p2">2</label>
                                    <input type="radio" name="starScore" value="3" id="p3"
                                    <c:if test="${ book.starScore == '3' }">checked</c:if>>
                                    <label for="p3">3</label>
                                    <input type="radio" name="starScore" value="4" id="p4"
                                    <c:if test="${ book.starScore == '4' }">checked</c:if>>
                                    <label for="p4">4</label>
                                    <input type="radio" name="starScore" value="5" id="p5"
                                    <c:if test="${ book.starScore == '5' }">checked</c:if>>
                                    <label for="p5">5</label>
                                    <input type="radio" name="starScore" value="6" id="p6"
                                    <c:if test="${ book.starScore == '6' }">checked</c:if>>
                                    <label for="p6">6</label>
                                    <input type="radio" name="starScore" value="7" id="p7"
                                    <c:if test="${ book.starScore == '7' }">checked</c:if>>
                                    <label for="p7">7</label>
                                    <input type="radio" name="starScore" value="8" id="p8"
                                    <c:if test="${ book.starScore == '8' }">checked</c:if>>
                                    <label for="p8">8</label>
                                    <input type="radio" name="starScore" value="9" id="p9"
                                    <c:if test="${ book.starScore == '9' }">checked</c:if>>
                                    <label for="p9">9</label>
                                    <input type="radio" name="starScore" value="10" id="p10"
                                    <c:if test="${ book.starScore == '10' }">checked</c:if>>
                                    <label for="p10">10</label>
                                  </span>
                                  <output for="starScore"><b>&nbsp;${ book.avgScore }&nbsp;</b></output>						
                            </span>
                          </span>
                        <span class="reviewCount">
                            <a href="#review">리뷰(${ book.reviewCount })</a><!-- 리뷰로 이동 -->
                        </span>
                    </div>
                </div>
                <div class="infoBotWrap">
                    <div class="infoBot"><!-- 도서 정보 bottom: 구매관련 -->
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

                          <form name="acForm" method="post">
                          	 	<input type="hidden" name="book_id" value="${ book.bid }">            
	                            <div class="btn_count">
	                                <input type="number" name="count" value="1" min="1" max="50" size="5">
	                            </div>
	                            <button id="basket" type="button" onclick="cart()">장바구니</button>
	                            <button id="buy" type="button" onclick="direct()">바로구매</button>
                          </form>
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
                    <p>${ fn:replace(book.bintro, newReply, '<br>')}</p>
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
                    <div class="infoImgWrap"><img src="${ contextPath }${ book.filepath }" alt="detailView"></div>
                </div>
            </div>

            <div class="info_auth information">
                <div class="infoSet"><h4>저자 소개</h4></div>
                <div class="infoSetCont_wrap">
                    <div class="authCont">
                        <%-- <div class="authImg"><img src="${contextPath}/resources/images/author/auth.jpg"></div> --%>
                        <div class="authTxtWrap">
                            <div class="authTit"><h5 class="authorName">${ book.author }</h5></div>
                            <span class="authTxt"><p>${ fn:replace(book.aintro, newReply, '<br>')}</p> </span>
                        </div>
                    </div>
                </div>
            </div>
			<%-- sort --%>
            <div class="info_review information">
                <div class="infoSet" id="review"><h4>회원 리뷰</h4></div>
                <div class="infoSetCont_wrap">
                    <%-- 1. 평균 별점 영역 --%>
                    <div class="reviewContTop">
                        <div class="review_starWrap">
                            <p class="reviewTop">봄숲 회원이 평가한 평균 별점</p>
                            <div class="book_rating">
                                <span class="total_rating">
                                    <span class="star-input noneArea">
                                        <span class="input">
                                            <!-- name 값 따로 주기 -->
		                                    <input type="radio" name="starScore2" value="1" id="p1"
		                                    <c:if test="${ book.starScore == '1' }">checked</c:if>>
		                                    <label for="p1">1</label>
		                                    <input type="radio" name="starScore2" value="2" id="p2"
		                                    <c:if test="${ book.starScore == '2' }">checked</c:if>>
		                                    <label for="p2">2</label>
		                                    <input type="radio" name="starScore2" value="3" id="p3"
		                                    <c:if test="${ book.starScore == '3' }">checked</c:if>>
		                                    <label for="p3">3</label>
		                                    <input type="radio" name="starScore2" value="4" id="p4"
		                                    <c:if test="${ book.starScore == '4' }">checked</c:if>>
		                                    <label for="p4">4</label>
		                                    <input type="radio" name="starScore2" value="5" id="p5"
		                                    <c:if test="${ book.starScore == '5' }">checked</c:if>>
		                                    <label for="p5">5</label>
		                                    <input type="radio" name="starScore2" value="6" id="p6"
		                                    <c:if test="${ book.starScore == '6' }">checked</c:if>>
		                                    <label for="p6">6</label>
		                                    <input type="radio" name="starScore2" value="7" id="p7"
		                                    <c:if test="${ book.starScore == '7' }">checked</c:if>>
		                                    <label for="p7">7</label>
		                                    <input type="radio" name="starScore2" value="8" id="p8"
		                                    <c:if test="${ book.starScore == '8' }">checked</c:if>>
		                                    <label for="p8">8</label>
		                                    <input type="radio" name="starScore2" value="9" id="p9"
		                                    <c:if test="${ book.starScore == '9' }">checked</c:if>>
		                                    <label for="p9">9</label>
		                                    <input type="radio" name="starScore2" value="10" id="p10"
		                                    <c:if test="${ book.starScore == '10' }">checked</c:if>>
		                                    <label for="p10">10</label>
		                                  </span>
		                                  <output for="starScore2"><b>${ book.avgScore }</b></output>					
                                    </span>
                                </span>
		                        <span class="bom_m">&nbsp;/10</span>
                            </div>
                        </div>
                    </div>
                    <!-- 2 -->
                    <c:if test="${ loginUser.userNo ne book.userNo }">
                    <div class="reviewWrite">
                   		<form method="post" name="replyForm">
                        <div class="writeRating">
                            <span>평점&nbsp;</span>
                            <span class="starGrp">
                                <span class="rstarScore">
									<span class="score">
										<input type="radio" name="rstarScore" value="1" id="s1">
										<label for="s1">1</label>
										<input type="radio" name="rstarScore" value="2" id="s2">
										<label for="s2">2</label>
										<input type="radio" name="rstarScore" value="3" id="s3">
										<label for="s3">3</label>
										<input type="radio" name="rstarScore" value="4" id="s4">
										<label for="s4">4</label>
										<input type="radio" name="rstarScore" value="5" id="s5">
										<label for="s5">5</label>
										<input type="radio" name="rstarScore" value="6" id="s6">
										<label for="s6">6</label>
										<input type="radio" name="rstarScore" value="7" id="s7">
										<label for="s7">7</label>
										<input type="radio" name="rstarScore" value="8" id="s8">
										<label for="s8">8</label>
										<input type="radio" name="rstarScore" value="9" id="s9">
										<label for="s9">9</label>
										<input type="radio" name="rstarScore" value="10" id="s10">
										<label for="s10">10</label>
									</span>
									<output for="rstarScore"><b id="b">0</b>점</output>					
								</span>
                            </span>
                        </div>
                        <div class="writeArea_wrap">
                            <div class="writeArea">
                                <textarea id="replyCont" name="rcontent" rows="5" cols="70" style="resize:none;" maxlength="149" 
                                placeholder="한글 기준 150자까지 작성 가능" onkeydown="calc()" onkeyup="calc()" onkeypress="calc()"></textarea>
                                <span class="wordCount">
                                    <input type="number" id="count" value="0" min="0" max="150" readonly>/150
                                </span>
                                <input type="hidden" name="reviewCount" value="${ book.reviewCount }">
                                <input type="hidden" name="sumScore" value="${ book.sumScore }">
                            </div>
                            <button id="writeBtn" type="button" onclick="reply(${ book.bid })">등록</button>
                        </div>
                   	</form>
                    </div>
                    </c:if>
                    
                    <!-- 3 reviewList -->
                    <c:if test="${ !empty book.replyList }">
                   	<c:forEach var="reply" items="${ book.replyList }">
                   	<c:choose>
                   		
                   		<c:when test="${ reply.refRid eq 0 }">
                   		<div class="reviewContentList">
						<div class="reviewInfoGrp">
                            <div class="reviewInfoTop">
                                <div class="cmt_rating">
                                    <span class="rating">
                                        <span class="star-input noneArea">
                                            <span class="input">
                                                <input type="radio" name="${ reply.rid }" value="1" id="p1"
                                                <c:if test="${ reply.starScore == '1' }">checked</c:if>>
                                                <label for="p1">1</label>
                                                <input type="radio" name="${ reply.rid }" value="2" id="p2"
                                                <c:if test="${ reply.starScore == '2' }">checked</c:if>>
                                                <label for="p2">2</label>
                                                <input type="radio" name="${ reply.rid }" value="3" id="p3"
                                                <c:if test="${ reply.starScore == '3' }">checked</c:if>>
                                                <label for="p3">3</label>
                                                <input type="radio" name="${ reply.rid }" value="4" id="p4"
                                                <c:if test="${ reply.starScore == '4' }">checked</c:if>>
                                                <label for="p4">4</label>
                                                <input type="radio" name="${ reply.rid }" value="5" id="p5"
                                                <c:if test="${ reply.starScore == '5' }">checked</c:if>>
                                                <label for="p5">5</label>
                                                <input type="radio" name="${ reply.rid }" value="6" id="p6"
                                                <c:if test="${ reply.starScore == '6' }">checked</c:if>>
                                                <label for="p6">6</label>
                                                <input type="radio" name="${ reply.rid }" value="7" id="p7"
                                                <c:if test="${ reply.starScore == '7' }">checked</c:if>>
                                                <label for="p7">7</label>
                                                <input type="radio" name="${ reply.rid }" value="8" id="p8"
                                                <c:if test="${ reply.starScore == '8' }">checked</c:if>>
                                                <label for="p8">8</label>
                                                <input type="radio" name="${ reply.rid }" value="9" id="p9"
                                                <c:if test="${ reply.starScore == '9' }">checked</c:if>>
                                                <label for="p9">9</label>
                                                <input type="radio" name="${ reply.rid }" value="10" id="p10"
                                                <c:if test="${ reply.starScore == '10' }">checked</c:if>>
                                                <label for="p10">10</label>
                                            </span>
                                            <output for="${ reply.userNo }"><b>${ reply.starScore }</b></output>					
                                        </span>
                                    </span>
                                    <div>
                                    
                                    <c:if test="${ loginUser.userNo eq reply.userNo }">
					                <button type="button" onclick="deleteReply(${ reply.rid }, ${ book.bid });" class="deleteBtn">삭제하기</button>
 					                </c:if>
 					                
                               		</div>
                                </div>
                                <div class="cmt_cont">
                                    <span class="txt_cont">${ reply.rcontent }</span>
                                </div>
                            </div>
                            <div class="reviewInfoBot">
                                <span class="txt_id">${ reply.userId }</span>
                                <span class="txt_esc">|</span>
                                <span class="txt_date">
                                	<fmt:formatDate value="${ reply.createDate }" type="date" pattern="yyyy-MM-dd"/>
                                </span>
                            </div>
                        </div> 
                        </div>
	                        <c:if test="${ loginUser.userNo eq book.userNo }">
	                  			<span class="authReply" onclick="show(${ reply.rid })">작가 댓글 등록하기</span><div>&nbsp;</div>
		                        <div class="replyCmt" id="replyCmt${ reply.rid }">
			                        <form method="post" name="addReplyForm" action="${ contextPath }/addReply/insert">
			                        <div class="writeArea_wrap">
			                            <div class="writeArea">
			                                <textarea id="replyCont${ reply.rid }" name="rcontent" rows="5" cols="50" style="resize:none;" maxlength="149" 
			                                placeholder="한글 기준 150자까지 작성 가능" onkeydown="calcAuth(${ reply.rid })" onkeyup="calcAuth(${ reply.rid })" onkeypress="calcAuth(${ reply.rid })"></textarea>
			                                <span class="wordCount">
			                                    <input type="number" id="count${ reply.rid }" value="0" min="0" max="150" readonly>/150
			                                </span>
			                            </div>
			                            <input type="hidden" name="bid" value="${ book.bid }">
			                            <input type="hidden" name="refRid" value="${ reply.rid }">
			                            <button id="writeBtn" type="submit" onclick="addReply(${ reply.rid }, ${ book.bid })">등록</button>
			                        </div>
				                   	</form>
	                        	</div>
	                   		</c:if>            		
                   		</c:when>
                   		<c:otherwise>
	                   		<c:choose>
	                   			<c:when test="${ loginUser.userNo eq book.userNo and reply.refRid ne 0}">
	                   			<div class="see">
	                   				<span class="authReply${ reply.rid } authReply" onclick="show(${ reply.rid })">작가 댓글 보기</span><div>&nbsp;</div>
			                        <div class="replyCmt" id="replyCmt${ reply.rid }">
			                        
			                        	<c:if test="${ loginUser.userNo == reply.userNo }">
			                        	<div class="cmt_auth">
						                <button type="button" onclick="deleteReply(${ reply.rid }, ${ book.bid });" class="deleteBtn">삭제하기</button>
						                </div>
	 					                </c:if>
	 					                
			                            <div class="cmt_cont">
			                                <span class="txt_cont">${ reply.rcontent }</span>
			                            </div>
			                            <div class="reviewInfoBot">
			                                <span class="txt_id">${ book.author }&nbsp;<i class="fas fa-check-circle"></i></span>
			                                <span class="txt_esc">|</span>
			                                <span class="txt_date">
			                                	<fmt:formatDate value="${ reply.createDate }" type="date" pattern="yyyy-MM-dd"/>
											</span>
			                            </div>
	                        		</div>
	                        		</div>
	                        	
	                   			
	                   			</c:when>
	                   			
	                   			<c:when test="${ loginUser.userNo ne book.userNo }">
	                   				<span class="authReply" onclick="show(${ reply.rid })">작가 댓글 보기&nbsp;<i class="fas fa-caret-down"></i></span><div>&nbsp;</div>
		                        	<div class="replyCmt"  id="replyCmt${ reply.rid }">
			                            <div class="cmt_cont">
			                                <span class="txt_cont">${ reply.rcontent }</span>
			                            </div>
			                            <div class="reviewInfoBot">
			                                <span class="txt_id">${ book.author }&nbsp;<i class="fas fa-check-circle"></i></span>
			                                <span class="txt_esc">|</span>
			                                <span class="txt_date">
			                                	<fmt:formatDate value="${ reply.createDate }" type="date" pattern="yyyy-MM-dd"/>
											</span>
			                            </div>
	                        		</div>
	                   			</c:when>
	                   		</c:choose> 
                   		</c:otherwise>
                   		
                   	</c:choose>
                        
                   </c:forEach>
                  </c:if>
                  	 <script>
               			$(document).ready(function(){	// div.see의 이전(span.authReply) 이전  div(.replyCmt)를 숨기기
               				$('.see').prev().prev().prev().hide();
               			
               			});
	                </script>
                 
                  <div class="reviewContentList">&nbsp;</div>
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
/*	$('.authReply').click(function(){
	    if($(this).siblings('.replyCmt').css('display') == 'none'){ // question다음의 컨텐츠 영역이 display=none일 때
	        $('.replyCmt').slideUp();       // 기존에 열려있는 콘텐츠는 닫고
	        $(this).siblings('.replyCmt').slideDown();  // 클릭한 메뉴의 콘텐츠는 밑으로 스르륵 내려오게
	    }else{
	        $(this).siblings('.replyCmt').slideUp();    // display=none 이 아닐 때 클릭 시 위로 올라가게
	    }
	}); */
	// 나타내기 모션.. 하고 싶다,,,
 	function show(rid){
		let replyCmt = document.getElementById('replyCmt' + rid);
		
		replyCmt.style.display = (replyCmt.style.display == 'none') ? "block" : "none";
	}
    
    function calc(){	// 댓글 입력 
        document.getElementById('count').value = 
        document.getElementById('replyCont').value.length;
        if(document.getElementById('count').value == 150) {
            alert("한글 기준 150자까지 입력가능합니다.");
        }
    }
    
    function calcAuth(rid){	// 작가 댓글 입력 -> 리뷰 번호 값 부여
        document.getElementById('count' + rid).value = 
        document.getElementById('replyCont' + rid).value.length;
        if(document.getElementById('count' + rid).value == 150) {
            alert("한글 기준 150자까지 입력가능합니다.");
        }
    }
    
    $(document).ready(function () {
        $('#etcMsg').click(function(){  // a 태그를 클릭하면 함수 동작하는데
            if($('.msgInfo').css('display') == 'none'){  // div가 안보이면
                $('.msgInfo').slideDown();   // 보이게
            } else {
                $('.msgInfo').slideUp();   // 보이면 안보이게
            }
        });
    });
    
</script>

<c:choose>
<c:when test="${ !empty loginUser }">
<script>            
    function direct() {
      document.forms.acForm.action="${ contextPath }/order/direct" //바로구매 서블릿만들기
      document.forms.acForm.submit();
      return true;
    }
    
    function cart() {
    	document.forms.acForm.action="${ contextPath }/cart";
    	document.forms.acForm.submit();
    }
    
    function reply(bid){
    	let rcontent = document.forms.replyForm.rcontent.value.length;
    	let rstarScore = document.forms.replyForm.rstarScore.value;
    	
    	console.log(rstarScore);
    	
    	if(rcontent == 0 || rstarScore == 0){
    		alert("별점과 내용을 입력해주세요");
    	} else {
	    	document.forms.replyForm.action="${ contextPath }/reply/insert?bid=" + bid;
	    	document.forms.replyForm.submit();
    	}
    }
    
    function deleteReply(rid, bid){
		let result = confirm('정말로 삭제하시겠습니까?');
		
		if(result){
			location.href="${contextPath}/reply/delete?bid="+ bid + "&rid="+rid;
		} else {
			location.href="${contextPath}/book/detail?bid=" + bid + "#review";
		}
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
	
	function reply(bid){
		let result = confirm('로그인 후 이용 가능합니다. 로그인 하시겠습니까?');
		
		if(result){
			location.href="${contextPath}/login";
		} else {
			location.href="${contextPath}/book/detail?bid=" + bid + "#review";
		}
		
	}
</script>
</c:otherwise>
</c:choose>
</body>
</html>