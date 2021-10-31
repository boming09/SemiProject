<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://unpkg.com/ress/dist/ress.min.css">
<!-- 외부 스타일 시트 -->
<link href="${ contextPath }/resources/css/wMyCommuInsert.css" rel="stylesheet">
<title>MY 소통게시판</title>
</head>
<body>
	<!-- 메뉴바 -->
	<jsp:include page="/WEB-INF/views/common/menubar.jsp" />
	
	<div class="csarea wrapper">
        <!-- cs 카테고리 -->
		<jsp:include page="/WEB-INF/views/writer/wmyCategory.jsp" />
        
        <div class="content">
            <header class="wcommu_header">
                <div>MY 소통게시판</div>
            </header>
            
            <div class="wcommu_area">게시글 내용</div>
            <div class="wcommu_conarea">
                <table>
                    <tr class="liarea">
                        <th class="wcommu_title" rowspan="2">제목</th>
                        <td class="title" rowspan="2">
                            <div>도서제목인데 오나전ㅇdgdgdgddfdfddddsefedcxcvdsfegdxcvcxxsdawwwwwwwww라ㅓ길수도 있지요~~ㅇ하ㅓ오혀다</div>
                        </td>         
                        <th class="wcommu_user">작성자</th>
                        <td class="user">user01</td>
                    </tr>
                    <tr class="liarea">
                    	<th class="wcommu_date">등록일</th>
                        <td class="date">2021-10-04</td>
                    </tr>
                                      
                    <tr class="liarea2">
                        <th class="wcommu_content">내용</th>
                        <td class="wcontent" colspan="3">문의.unre_date, .unre_rating오랑너ㅗ여ㅑ니엉느누나te, .unre_rating오랑너ㅗ여ㅑ니엉느누나te, .unre_rating오랑너ㅗ여ㅑ니엉느누나te, .unre_rating오랑너ㅗ여ㅑ니엉느누나ㅡ우라ㅣㄴ여ㅗㄹㄴ열널이ㅏ</td>
                    </tr>
                </table>
            </div>
            
            <div class="wcommu_area">답변 작성</div>
            <div class="wcommu_reply">
                <textarea></textarea>
            </div>
            
            <div class="wcommu_btn">
                <button type="button" onclick="location.href='${ contextPath }/w-commu/detail'">취소</button>
                <button type="button">등록하기</button>
            </div>
		</div>
		
		<!-- 광고  -->
		<jsp:include page="/WEB-INF/views/common/adArea.jsp" />	
	</div>
	
	<!-- footer -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>