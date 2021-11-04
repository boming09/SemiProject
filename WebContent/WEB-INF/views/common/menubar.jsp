<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.Member"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	Member loginUser = (Member)session.getAttribute("loginUser");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="main-recomm">
<title>Menu bar</title>
<link rel="stylesheet" href="https://unpkg.com/ress/dist/ress.min.css">
<!-- 외부 스타일 시트 -->
<link href="<%= request.getContextPath() %>/resources/css/menubar-style.css" rel="stylesheet">
<%-- session에 담긴 message 있을 경우 alert 하는 script --%>
<% if(session.getAttribute("message") != null) { %>
<script>
	alert( '<%= session.getAttribute("message") %>');
</script>
<%
		session.removeAttribute("message");
	} 
%>
<!-- favicon (Real Favicon Generator 등에서 가공 필요) -->
<link rel="icon" type="image/x-icon" href="resources/image/khfavicon.ico">
<!-- icon link -->
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>

<style>
@charset "UTF-8"; /* 인코딩 문자 깨짐 방지 (유니코드 문자열 있을 시) */

/* 전체 글꼴 */
@font-face {
    font-family: 'ChosunGu';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@1.0/ChosunGu.woff') format('woff');
    font-weight: normal;
    font-style: normal;
} 
/* 봄숲 글꼴 */
@font-face {
    font-family: 'ghanachoco';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@1.0/ghanachoco.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

* {  font-family: 'ChosunGu';}

html {
    font-size: 100%;
}

a {
    text-decoration: none;
}

#top {
   
    height: 190px;

}

#top .page-title {
    text-align: center;
   /* font-size: 3rem;*/
}

    /* 로고 사이 공백 */
.search_area {
	text-align: center;
	padding: 30px;
}

.search_area select {
    margin-right: 10px;
}

.input_area {
    border: 5px solid rgba(196, 217, 195, 1);
    border-radius: 20px;
    padding: 10px 10px 7px 10px;
}

.input_area input {
    width: 350px;
	height: 30px;
    border: 0px;
    font-size : 0.9rem;
}

#search_btn {
	font-size : 1.5rem;
}

.fas fa-search{
	font-size: 20px;
}

.mainlogo {
    align-items: center;
    justify-content: center;
    display: flex;
   /* margin-left: 20px;*/
} 

/* 로고 */
.page-title a {
    display: flex;
    justify-content: center;
	align-items: center;
	text-decoration : none;
	color : black;
}

.page-title img {
	width : 90px;
	height : 35px;
}

.page-title div {
	/* 봄숲 text */
	font-size : 2.2rem;
	font-family: 'ghanachoco';
}


/* 내비 메뉴 장식 */

 nav {
    background-color: rgba(196, 217, 195, 1);
    width: 100%;
}
.main-nav {
    list-style: none;
    text-transform: uppercase;
    font-size: 1.25rem;
    display: flex;
    margin-top: 10px;
    background-color: rgba(196, 217, 195, 1);
    margin-left: 60%;
    margin-bottom: 14px;
} 

/* 내비 li 여백 */
.main-nav li {
    margin-left: 20px;
} */

/* 내비 a 태그 */
 .main-nav a {
    color: black;
    font-size: 12px;
    
}

.main nav a:hover {
    color: #0bd;
} 

/* 로고 내비 수평 정렬 */
 .page-header {
    display: flex;
    justify-content: space-between;
   
} */

/*콘텐츠의 최대 출력 너비 설정 */
 .wrapper {
    max-width: 1100px;
    margin: 0 auto;
}

.mainlogo {
    height: 100px;
    padding: 30px;
}

.topline {
    border-bottom: 6px solid;
    color: rgba(196, 217, 195, 1);

} 
</style>
</head>
<body>
<!-- page의 application의 contextPath -->
<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }"
scope="application"/>
    <div id="top">
        <header class="page-header">
            <nav>
                <ul class="main-nav">
                	<% if(loginUser == null) { %>
                    <li><a href="<%= request.getContextPath() %>/login">로그인</a></li>
                    <li><a href="<%= request.getContextPath() %>/joinmembership">회원가입</a></li>
                    <li><a href="<%= request.getContextPath() %>/cart">장바구니</a></li>
                    <li><a href="<%= request.getContextPath() %>/cs">고객센터</a></li>
                    <% } else { %>
                    <li><a href="<%= request.getContextPath() %>/memberinformation">정보수정</a></li>
                    <li><a href="<%= request.getContextPath() %>/logout">로그아웃</a></li>
                    <li><a href="<%= request.getContextPath() %>/mypage">마이페이지</a></li>
                    <li><a href="<%= request.getContextPath() %>/cart">장바구니</a></li>
                    <li><a href="<%= request.getContextPath() %>/cs">고객센터</a></li>
                    <% } %>
                </ul>
            </nav>
            
        </header>
        <!-- 3. 페이지 제목-->
        <div class="mainlogo wrapper">
            <div class="page-title">
            	<a href="<%= request.getContextPath() %>">
                <img src="<%= request.getContextPath() %>/resources/images/logo.png" alt="home logo">
                <div>봄숲</div>
                </a>
            </div>
            <div class="search_area">
                <form method="get" action="${ contextPath }/book/list">
                    <select id="searchCondition" name="searchCondition">
                        <option value="search"
                        <c:if test="${ param.searchCondition == 'search' }">selected</c:if>>통합검색</option>
                        <option value="title"
                        <c:if test="${ param.searchCondition == 'title' }">selected</c:if>>제목</option>
                        <option value="content"
                        <c:if test="${ param.searchCondition == 'author' }">selected</c:if>>작가</option>
                    </select> 
                    <span class="input_area">
                    <input type="search" name="searchValue" placeholder="검색할 내용을 입력하세요.">
                    <button id="search_btn" type="submit" onclick="search()"><i class="fas fa-search"></i></button>
                    </span>
                </form>
            </div>
        </div>
        <div class="topline">
        </div>
    </div>
</body>
</html>