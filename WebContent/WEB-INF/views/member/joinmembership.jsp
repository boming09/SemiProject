<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bomsoup login</title>
    <link rel="stylesheet" href="https://unpkg.com/ress/dist/ress.min.css">
    <!-- favicon (Real Favicon Generator 등에서 가공 필요) -->
    <link rel="icon" type="image/x-icon" href="resources/image/khfavicon.ico">
    <!-- 외부 스타일 시트 -->
    <link href="<%= request.getContextPath() %>/resources/css/kwang/login-style.css" rel="stylesheet">    
    <script>
    
    </script>
</head>
<body>
    <!-- 메뉴바 -->
	<%@ include file="/WEB-INF/views/common/menubar.jsp" %>
    <div class="main-center2">
        <h1>봄숲 개인 회원가입</h1>
        <fieldset class="lofd">
            <legend id="lolegend">기본 정보 입력</legend>
            <div class="topline">
            </div>
            <table class="lotb">
                <tr>
                    <th>아이디</th>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;
                    	<input type="text" class="lomb" placeholder="아이디 10글자 이내">&nbsp;
                        <a href="#"><input type="button" class="check" value="중복 확인"></a></td>
                </tr>
                <tr>
                    <th>이메일</th>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="text" id="email1" class="lomb"  size="10">&nbsp;@&nbsp;<input type="text" id="email2" class="lomb"  size="10">&nbsp;
                        <select  class="lomb" name="emailSelection" id="emailSelection">
                            <option value="naver.com">naver.com</option>
                            <option value="daum.com">daum.com</option>
                            <option value="gmail.com">gmail.com</option>
                            <option value="hanmail.net">hanmail.net</option>
                            <option value="nate.com">nate.com</option>
                            <option value="1" selected>&nbsp;&nbsp;직접입력</option>
                        </select></td>
                </tr>
                <tr>
                    <th>비밀번호</th>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="text" class="lomb" size="30" placeholder="영문,숫자,특수문자 포함 8자 이상">
                        </input>
                    </td>
                </tr>
                <tr>
                    <th>비밀번호 확인</th>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="text" class="lomb" size="30"></td>
                </tr>
                <tr>
                    <th>휴대전화</th>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="text" class="lomb" size="5"> -
                        <input type="text" class="lomb" size="5"> -
                        <input type="text" class="lomb" size="5">
                    </td>
                </tr>
                <tr>
                    <th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        개인정보 유효기간
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="radio">&nbsp;1년&nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="radio">&nbsp;3년&nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="radio">&nbsp;5년&nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="radio">&nbsp;탈퇴 시까지</td>
                </tr>                
            </table>
        </fieldset>
        <div class="topline">
        </div> 
        <fieldset class="lofd">
            <legend id="lolegend">부가 정보 입력</legend>
            <table class="lotb">
                <tr>
                    <th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;주소</th>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" class="lomb" size="10"></td>
                    <td><a href=""><button class="check">주소검색</button></a></td>
                </tr>
                <tr>
                    <th></th>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" class="lomb" size="20"></td>
                </tr>
                <tr>
                    <th></th>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" class="lomb" size="20"></td>
                </tr>
        </table>
        </fieldset>
        <div class="topline">
        </div>
        <fieldset class="lofd">
            <legend id="lolegend">약관 동의</legend>
            <table class="lotb">                
                <tr>
                    <th>봄숲 이용약관</th>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <label class="termstext">약관 전체보기</label>
                        <a href="#"><img class="terms" src="<%= request.getContextPath() %>/resources/images/kwang/login-terms.png" alt="terms"></a> 
                    </td>
                </tr>
                <tr>
                    <th>봄숲 커뮤니티 이용약관</th>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <label class="termstext">약관 전체보기</label>
                        <a href="#"><img class="terms" src="<%= request.getContextPath() %>/resources/images/kwang/login-terms.png" alt="terms"></a> 
                    </td>
                </tr>
                <tr>
                    <th>개인 정보 수집 및 이용</th>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <label class="termstext">내용보기</label>
                        <a href="#"><img class="terms" src="<%= request.getContextPath() %>/resources/images/kwang/login-check.png" alt="cehck"></a> 
                    </td>
                </tr>
                <div class="joinme" onclick="bomsoup()">회원 가입하기</div>
                <script>
                    function bomsoup() {
                        alert("회원가입이 완료 되었습니다.");
                        window.location.href = "login";
                    }
                </script>
            </table>
        </fieldset>
        <div class="topline">
        </div>
    </div>
    <!-- footer -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>