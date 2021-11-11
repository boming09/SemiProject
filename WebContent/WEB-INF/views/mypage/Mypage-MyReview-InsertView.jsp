<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://unpkg.com/ress/dist/ress.min.css">
<!-- 외부 스타일 시트 -->
<link href="${ contextPath }/resources/css/mypage/mypage-ReviewDetail.css" rel="stylesheet">
<title>마이리뷰</title>
</head>
<body>
	<!-- 메뉴바 -->
	<jsp:include page="/WEB-INF/views/common/menubar.jsp" />
	
	<div class="csarea wrapper">
        <!-- cs 카테고리 -->
		<%@ include file="/WEB-INF/views/mypage/mypage-category.jsp" %>
        
        <div class="content">
            <header class="wcommu_header">
                <div>마이리뷰 게시판</div>
            </header>
            
            <div class="wcommu_area">게시글 내용</div>
            <form method="post" action="${ contextPath }/myreviewinsertview">
            <div class="wcommu_conarea">
                <table>
                    <tr class="liarea">
                        <th class="wcommu_title" rowspan="3">제목</th>
                        <td class="title" name="title" rowspan="3">
                            <div><input type="text" name="title" required></div>
                        </td>         
                        <th class="wcommu_user">작성자</th>
                        <td class="user">
                        <!-- 
                        <c:choose>
				           	<c:when test="${ review.user_nickname != null}">
				           	<li class="review_writer">${ review.user_nickname }</li>
				            </c:when>
				            <c:otherwise>
				            <li class="review_writer">${ loginUser.userName }</li>
				            </c:otherwise>
			            </c:choose>  
                         -->
                        </td>
                    </tr>
                    <tr class="liarea">
                    	<th class="wcommu_date">등록일</th>
                        <td class="date">${ review.create_Date }</td>                        
                    </tr>
                    <tr class="liarea">
                    	<th class="wcommu_date">분류</th>
                        <td class="date">
                        <select name="category">
								<option value="1">국내도서</option>
								<option value="2">국외도서</option>
								<option value="3">eBook</option>
								<option value="4">소설/시/희곡</option>
								<option value="5">에세이</option>
								<option value="6">인문</option>
								<option value="7">역사</option>
								<option value="8">예술</option>
								<option value="9">종교</option>
								<option value="10">사회_정치</option>
								<option value="11">자연과학</option>
								<option value="12">경제 _경영</option>
								<option value="13">자기계발</option>
								<option value="14">인물</option>
								<option value="15">유아</option>
								<option value="16">어린이</option>
								<option value="17">청소년</option>
								<option value="18">전집</option>
								<option value="19">만화</option>
								<option value="20">여행</option>
								<option value="21">요리</option>
								<option value="22">육아</option>
								<option value="23">가정_살림</option>
								<option value="24">건강_취미</option>
								<option value="25">잡지</option>
								<option value="26">대학교제</option>
								<option value="27">국어 외국어 사전</option>
								<option value="28">IT 모바일</option>
								<option value="29">공무원</option>
								<option value="30">수험서 자격증</option>
								<option value="31">초등 참고서</option>
								<option value="32">중고등 참고서</option>
								<option value="33">EBS 교재</option>
								<option value="34">문학 소설</option>
								<option value="35">경제 경영</option>
								<option value="36">인문 사회</option>
								<option value="37">예술 대중문화</option>
								<option value="38">취미 라이프스타일</option>
								<option value="39">컴퓨터</option>
								<option value="40">자연과학</option>
								<option value="41">해외잡지</option>
								<option value="42">유아 어린이 청소년</option>
								<option value="43">캐릭터 북</option>
								<option value="44">초등코스북</option>
								<option value="45">학습서</option>
								<option value="46">일본 도서</option>
								<option value="47">중국 도서</option>
								<option value="48">프랑스 도서</option>
							</select> 
                        </td>
                    </tr>
                                      
                    <tr class="liarea2">
                        <th class="wcommu_content">내용</th>
                        <td class="wcontent" name="content" colspan="3">
                        <textarea class="textarea" rows="15" cols="60" name="content"
								required></textarea>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="wcommu_btn">
                <button type="button" onclick="location.href='${ contextPath }/mypagemyreview'">돌아가기</button>
                <button type="sumbit">등록하기</button>
            </div>
            </form>           
		</div>
		
		<!-- 광고  -->
		<jsp:include page="/WEB-INF/views/common/adArea.jsp" />	
	</div>
	
	<!-- footer -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>