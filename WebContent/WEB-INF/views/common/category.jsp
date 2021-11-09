<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>category</title>
<link rel="stylesheet" href="https://unpkg.com/ress/dist/ress.min.css">
<!-- 외부 스타일 시트 -->
<link href="<%= request.getContextPath() %>/resources/css/category.css" rel="stylesheet">
</head>
<body>
<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application"/>
	<div id="cate_area">
		<aside class="category">
			<div class="q-search">빠른분야찾기</div>
			<ul class="q-list">
				<li><a onclick="domainCategory('1')">국내도서</a>
                    <div class="sublist kbook">
                        <div class="sublist-title">국내도서</div><span>&nbsp;&nbsp;〉</span> 
                        <div class="sublist-list">
                            <ul class="kbook1">
                                <li><a onclick="domainCategory('4')">소설/시/희곡</a></li>
                                <li><a onclick="domainCategory('5')">에세이</a></li>
                                <li><a onclick="domainCategory('6')">인문</a></li>
                                <li><a onclick="domainCategory('7')">역사</a></li>
                                <li><a onclick="domainCategory('8')">예술</a></li>
                                <li><a onclick="domainCategory('9')">종교</a></li>
                                <li><a onclick="domainCategory('10')">사회 정치</a></li>
                                <li><a onclick="domainCategory('11')">자연과학</a></li>
                                <li><a onclick="domainCategory('12')">경제 경영</a></li>
                                <li><a onclick="domainCategory('13')">자기계발</a></li>
                                <li><a onclick="domainCategory('14')">인물</a></li>
                                <li><a onclick="domainCategory('15')">유아</a></li>
                                <li><a onclick="domainCategory('16')">어린이</a></li>
                                <li><a onclick="domainCategory('17')">청소년</a></li>
                                <li><a onclick="domainCategory('18')">전집</a></li>
                            </ul>
                            <ul>
                                <li><a onclick="domainCategory('19')">만화</a></li>
                                <li><a onclick="domainCategory('20')">여행</a></li>
                                <li><a onclick="domainCategory('21')">요리</a></li>
                                <li><a onclick="domainCategory('22')">육아</a></li>
                                <li><a onclick="domainCategory('23')">가정 살림</a></li>
                                <li><a onclick="domainCategory('24')">건강 취미</a></li>
                                <li><a onclick="domainCategory('25')">잡지</a></li>
                                <li><a onclick="domainCategory('26')">대학교재</a></li>
                                <li><a onclick="domainCategory('27')">국어 외국어 사전</a></li>
                                <li><a onclick="domainCategory('28')">IT 모바일</a></li>
                                <li><a onclick="domainCategory('29')">공무원</a></li>
                                <li><a onclick="domainCategory('30')">수험서 자격증</a></li>
                                <li><a onclick="domainCategory('31')">초등참고서</a></li>
                                <li><a onclick="domainCategory('32')">중고등참고서</a></li>
                                <li><a onclick="domainCategory('33')">EBS교재</a></li>
                            </ul>
                        </div>
                    </div>
                </li>
				<li><a onclick="domainCategory('2')">국외도서</a>
                    <div class="sublist fbook">
                        <div class="sublist-title">국외도서</div><span>&nbsp;&nbsp;〉</span>
                        <div class="sublist-list">
                            <ul>
                                <li><a onclick="domainCategory('34')">문학 소설</a></li>
                                <li><a onclick="domainCategory('35')">경제 경영</a></li>
                                <li><a onclick="domainCategory('36')">인문 사회</a></li>
                                <li><a onclick="domainCategory('37')">예술 대중문화</a></li>
                                <li><a onclick="domainCategory('38')">취미 라이프스타일</a></li>
                                <li><a onclick="domainCategory('39')">컴퓨터</a></li>
                                <li><a onclick="domainCategory('40')">자연과학</a></li>
                                <li><a onclick="domainCategory('41')">해외잡지</a></li>
                                <li><a onclick="domainCategory('42')">유아 어린이 청소년</a></li>
                                <li><a onclick="domainCategory('43')">캐릭터북</a></li>
                                <li><a onclick="domainCategory('44')">초등코스북</a></li>
                                <li><a onclick="domainCategory('45')">학습서</a></li>
                                <li><a onclick="domainCategory('46')">일본도서</a></li>
                                <li><a onclick="domainCategory('47')">중국도서</a></li>
                                <li><a onclick="domainCategory('48')">프랑스도서</a></li>
                            </ul>
                        </div>
                    </div>
                </li>
				<li><a onclick="domainCategory('3')">eBook</a>
                    <div class="sublist ebook">
                        <div class="sublist-title">eBook</div><span>&nbsp;&nbsp;〉</span>
                        <div class="sublist-list">
                            <ul> 
                                <li><a href="#">소설</a></li>
                                <li><a href="#">에세이 시</a></li>
                                <li><a href="#">경제 경영</a></li>
                                <li><a href="#">자기계발</a></li>
                                <li><a href="#">인문</a></li>
                                <li><a href="#">사회 정치</a></li>
                                <li><a href="#">역사</a></li>
                                <li><a href="#">종교</a></li>
                                <li><a href="#">만화</a></li>
                                <li><a href="#">자연과학</a></li>
                                <li><a href="#">외국어</a></li>
                                <li><a href="#">IT 모바일</a></li>
                                <li><a href="#">가정 살림</a></li>
                                <li><a href="#">건강 취미</a></li>
                                <li><a href="#">해외 원서</a></li>
                            </ul>
                        </div>
                    </div>
                </li>
				<li><a href="#">웹소설/코믹</a>
                    <div class="sublist webcomic">
                        <div class="sublist-title">웹소설/코믹</div><span>&nbsp;&nbsp;〉</span>
                        <div class="sublist-list">
                            <ul>
                                <li><a href="#">로맨스</a></li>
                                <li><a href="#">로판</a></li>
                                <li><a href="#">판타지</a></li>
                                <li><a href="#">무협</a></li>
                                <li><a href="#">순정</a></li>
                                <li><a href="#">소년</a></li>
                                <li><a href="#">드라마</a></li>
                                <li><a href="#">액션</a></li>
                            </ul>
                        </div>
                    </div>
                </li>
				<li><a href="#">공연</a>
                    <div class="sublist show">
                        <div class="sublist-title">공연</div><span>&nbsp;&nbsp;〉</span>
                        <div class="sublist-list">
                            <ul>
                                <li><a href="#">콘서트</a></li>
                                <li><a href="#">뮤지컬</a></li>
                                <li><a href="#">연극</a></li>
                                <li><a href="#">클래식/무용/음악</a></li>
                                <li><a href="#">전시/행사</a></li>
                                <li><a href="#">가족/아동</a></li>
                            </ul>
                        </div>
                    </div>
                </li>
				<li><a href="#">중고샵</a>
                    <div class="sublist used">
                        <div class="sublist-title">중고샵</div><span>&nbsp;&nbsp;〉</span>
                        <div class="sublist-list">
                            <ul>
                                <li><a href="#">가정과 생활</a></li>
                                <li><a href="#">국어/외국어</a></li>
                                <li><a href="#">대학교재</a></li>
                                <li><a href="#">소설/시</a></li>
                                <li><a href="#">에세이</a></li>
                                <li><a href="#">만화</a></li>
                                <li><a href="#">비즈니스와 경제</a></li>
                                <li><a href="#">자기관리</a></li>
                                <li><a href="#">어린이</a></li>
                                <li><a href="#">유아</a></li>
                                <li><a href="#">인문</a></li>
                                <li><a href="#">전집</a></li>
                                <li><a href="#">중고등참고서</a></li>
                                <li><a href="#">초등참고서</a></li>
                                <li><a href="#">외국도서</a></li>
                            </ul>
                        </div>
                    </div>
                </li>
			</ul>
		</aside>
		<div class="main_ad">
			<img id="ad1" src="<%= request.getContextPath() %>/resources/images/ad8.png">
			<img id="ad2" src="<%= request.getContextPath() %>/resources/images/ad9.png">
		</div> 
	</div>
<script>
	function domainCategory(cid){
		location.href="${ contextPath }/book/list?searchCondition=category&searchValue=" + cid;
	}
</script>
</body>
</html>