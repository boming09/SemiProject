<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://unpkg.com/ress/dist/ress.min.css">
<!-- 외부 스타일 시트 -->
<link href="${ contextPath }/resources/css/notice/faqNoticeInsert.css" rel="stylesheet">
<title>고객센터_FAQ</title>
</head>
<body>
	<!-- 메뉴바 -->
	<jsp:include page="/WEB-INF/views/common/menubar.jsp" />
	
	<div class="csarea wrapper">
        <!-- cs 카테고리 -->
		<jsp:include page="/WEB-INF/views/writer/wmyCategory.jsp" />
        
        <div class="content">
            <header class="faq_header">
                <div>FAQ 작성</div>
            </header>
            
            <form class="faq_conarea" method="post" action="${ contextPath }/faq/insert">
                <div class="conarea">
	                <table>
	                    <tr class="liarea">
	                    	<th class="faq_cate">카테고리</th>
	                        <td class="aArea">
	                           <select name="atype" id="atype">
				                	<!-- valeu값 = db category_no▼ -->
				                	<option selected>선택 ▼</option>
				                    <option value="1">주문/결제</option>
				                    <option value="6">취소/교환/반품</option>
				                    <option value="10">배송</option>
				                    <option value="14">회원관리</option>
				               </select>
	                        </td>
	                        <td class="bArea">
	                           <select name="btype" id="btype" >
	                         		<option selected>선택 ▼</option>
				                    <option value="2" class="a1">주문/주문확인</option>
				                    <option value="3" class="a1">주문변경</option>
				                    <option value="4" class="a1">결제정보</option>
				                    <option value="5" class="a1">세금계산서/영수증</option>
				                    <option value="7" class="a6">취소/취소환불</option>
				                    <option value="8" class="a6">교환</option>
				                    <option value="9" class="a6">반품/반품환불</option>    
				                    <option value="11" class="a10">배송정보</option>
				                    <option value="12" class="a10">해외배송</option>
				                    <option value="13" class="a10">배송비</option>
				                    <option value="15" class="a14">회원가입/탈퇴</option>
				                    <option value="16" class="a14">회원정보 확인/변경</option>
				                    <option value="17" class="a14">작가회원 인증</option>
				               </select>
	                        </td>
	                    </tr>
	                    <tr class="liarea">
	                        <th class="faq_q">질문</th>
	                        <td colspan="3"><div class="question"><input type="text" name="title"></div></td>
	                    </tr>
	                    <tr class="liarea">
	                        <th class="faq_a">답변</th>
	                        <td colspan="3"><div class="answer"><textarea name="reply"></textarea></div></td>
	                    </tr>
	                </table>
                </div>
                
	            <div class="faq_btn">
	                <button type="button" onclick="location.href='${ contextPath }/admin/main'">취소</button>
	                <button type="submit">등록하기</button>
	            </div>
            </form>
           
		</div>
		
		<!-- 광고  -->
		<jsp:include page="/WEB-INF/views/common/adArea.jsp" />	
	</div>
	
	<!-- footer -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	
	<script>
		$(document).on('change', '#atype', bChange);
		function bChange() {
			if($('#atype').val() == 1) {
				$('#btype').find('.a1').show();
				$('#btype').find('.a6').hide();
				$('#btype').find('.a10').hide();
				$('#btype').find('.a14').hide();
				
			} else if($('#atype').val() == 6) {
				$('#btype').find('.a1').hide();
				$('#btype').find('.a6').show();
				$('#btype').find('.a10').hide();
				$('#btype').find('.a14').hide();
				
			} else if($('#atype').val() == 10) {
				$('#btype').find('.a1').hide();
				$('#btype').find('.a6').hide();
				$('#btype').find('.a10').show();
				$('#btype').find('.a14').hide();
				
			} else if($('#atype').val() == 14){
				$('#btype').find('.a1').hide();
				$('#btype').find('.a6').hide();
				$('#btype').find('.a10').hide();
				$('#btype').find('.a14').show();
			}
		}
	</script>
</body>
</html>