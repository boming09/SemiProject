<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            <form method="post" action="${ contextPath }/myreview/update">
            <input type="hidden" name="mid" value="${ myreview.mid }">
            <div class="wcommu_conarea">
                <table>
                    <tr class="liarea">
                        <th class="wcommu_title" rowspan="3">제목</th>
                        <td class="title" name="title" rowspan="3">
                            <div><input type="text" name="title" value="${ myreview.mtitle }" required></div>
                        </td>         
                        <th class="wcommu_user">작성자</th>
                        <td class="user">${ myreview.user_nickname }</td>
                    </tr>
                    <tr class="liarea">
                    	<th class="wcommu_date">등록일</th>
                        <td class="date">${ myreview.create_Date }</td>                        
                    </tr>
                    <tr class="liarea">
                    	<th class="wcommu_date">분류</th>
                        <td class="date">
                        <select name="category">
								<option value="1" <c:if test="${ myreview.category_id == 1 }">selected</c:if>>국내도서</option>
								<option value="2" <c:if test="${ myreview.category_id == 2 }">selected</c:if>>국외도서</option>
								<option value="3" <c:if test="${ myreview.category_id == 3 }">selected</c:if>>eBook</option>
								<option value="4" <c:if test="${ myreview.category_id == 4 }">selected</c:if>>소설/시/희곡</option>
								<option value="5" <c:if test="${ myreview.category_id == 5 }">selected</c:if>>에세이</option>
								<option value="6" <c:if test="${ myreview.category_id == 6 }">selected</c:if>>인문</option>
								<option value="7" <c:if test="${ myreview.category_id == 7 }">selected</c:if>>역사</option>
								<option value="8" <c:if test="${ myreview.category_id == 8 }">selected</c:if>>예술</option>
								<option value="9" <c:if test="${ myreview.category_id == 9 }">selected</c:if>>종교</option>
								<option value="10" <c:if test="${ myreview.category_id == 10 }">selected</c:if>>사회_정치</option>
								<option value="11" <c:if test="${ myreview.category_id == 11 }">selected</c:if>>자연과학</option>
								<option value="12" <c:if test="${ myreview.category_id == 12 }">selected</c:if>>경제 _경영</option>
								<option value="13" <c:if test="${ myreview.category_id == 13 }">selected</c:if>>자기계발</option>
								<option value="14" <c:if test="${ myreview.category_id == 14 }">selected</c:if>>인물</option>
								<option value="15" <c:if test="${ myreview.category_id == 15 }">selected</c:if>>유아</option>
								<option value="16" <c:if test="${ myreview.category_id == 16 }">selected</c:if>>어린이</option>
								<option value="17" <c:if test="${ myreview.category_id == 17 }">selected</c:if>>청소년</option>
								<option value="18" <c:if test="${ myreview.category_id == 18 }">selected</c:if>>전집</option>
								<option value="19" <c:if test="${ myreview.category_id == 19 }">selected</c:if>>만화</option>
								<option value="20" <c:if test="${ myreview.category_id == 20 }">selected</c:if>>여행</option>
								<option value="21" <c:if test="${ myreview.category_id == 21 }">selected</c:if>>요리</option>
								<option value="22" <c:if test="${ myreview.category_id == 22 }">selected</c:if>>육아</option>
								<option value="23" <c:if test="${ myreview.category_id == 23 }">selected</c:if>>가정_살림</option>
								<option value="24" <c:if test="${ myreview.category_id == 24 }">selected</c:if>>건강_취미</option>
								<option value="25" <c:if test="${ myreview.category_id == 25 }">selected</c:if>>잡지</option>
								<option value="26" <c:if test="${ myreview.category_id == 26 }">selected</c:if>>대학교제</option>
								<option value="27" <c:if test="${ myreview.category_id == 27 }">selected</c:if>>국어 외국어 사전</option>
								<option value="28" <c:if test="${ myreview.category_id == 28 }">selected</c:if>>IT 모바일</option>
								<option value="29" <c:if test="${ myreview.category_id == 29 }">selected</c:if>>공무원</option>
								<option value="30" <c:if test="${ myreview.category_id == 30 }">selected</c:if>>수험서 자격증</option>
								<option value="31" <c:if test="${ myreview.category_id == 31 }">selected</c:if>>초등 참고서</option>
								<option value="32" <c:if test="${ myreview.category_id == 32 }">selected</c:if>>중고등 참고서</option>
								<option value="33" <c:if test="${ myreview.category_id == 33 }">selected</c:if>>EBS 교재</option>
								<option value="34" <c:if test="${ myreview.category_id == 34 }">selected</c:if>>문학 소설</option>
								<option value="35" <c:if test="${ myreview.category_id == 35 }">selected</c:if>>경제 경영</option>
								<option value="36" <c:if test="${ myreview.category_id == 36 }">selected</c:if>>인문 사회</option>
								<option value="37" <c:if test="${ myreview.category_id == 37 }">selected</c:if>>예술 대중문화</option>
								<option value="38" <c:if test="${ myreview.category_id == 38 }">selected</c:if>>취미 라이프스타일</option>
								<option value="39" <c:if test="${ myreview.category_id == 39 }">selected</c:if>>컴퓨터</option>
								<option value="40" <c:if test="${ myreview.category_id == 40 }">selected</c:if>>자연과학</option>
								<option value="41" <c:if test="${ myreview.category_id == 41 }">selected</c:if>>해외잡지</option>
								<option value="42" <c:if test="${ myreview.category_id == 42 }">selected</c:if>>유아 어린이 청소년</option>
								<option value="43" <c:if test="${ myreview.category_id == 43 }">selected</c:if>>캐릭터 북</option>
								<option value="44" <c:if test="${ myreview.category_id == 44 }">selected</c:if>>초등코스북</option>
								<option value="45" <c:if test="${ myreview.category_id == 45 }">selected</c:if>>학습서</option>
								<option value="46" <c:if test="${ myreview.category_id == 46 }">selected</c:if>>일본 도서</option>
								<option value="47" <c:if test="${ myreview.category_id == 47 }">selected</c:if>>중국 도서</option>
								<option value="48" <c:if test="${ myreview.category_id == 48 }">selected</c:if>>프랑스 도서</option>
							</select> 
                        </td>
                    </tr>
                                      
                    <tr class="liarea2">
                        <th class="wcommu_content">내용</th>
                        <td class="wcontent" name="content" colspan="3">
                        <textarea class="textarea" rows="15" cols="60" name="content"
								required>${ myreview.mcontent }</textarea>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="wcommu_btn">
                <button type="button" onclick="location.href='${ contextPath }/mypagemyreview'">돌아가기</button>
                <button type="sumbit">수정하기</button>
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