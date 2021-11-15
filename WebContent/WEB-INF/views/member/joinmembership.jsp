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
    <link href="<%= request.getContextPath() %>/resources/css/member/login-style.css" rel="stylesheet">    
    <script>
    
    </script>
</head>
<body>
    <!-- 메뉴바 -->
	<%@ include file="/WEB-INF/views/common/menubar.jsp" %>
    <div class="id000">
    <div class="main-center2">
        <h1>봄숲 개인 회원가입</h1>
        <br>        
        <form id="joinForm" action="<%= request.getContextPath() %>/joinmembership"
			method="post" onsubmit="return validate();">
        <fieldset class="lofd">
            <legend id="lolegend">기본 정보 입력</legend>
            <div class="topline">
            </div>
            <table class="lotb">
                <tr>
                    <th>* 아이디</th>
                    <td class="id_name">
                    	<input type="text" class="lomb inputEng" name="userId" placeholder="아이디 10글자 이내" maxlength="10" required>
                        <button id="idCheck" type="button">중복확인</button></td>
                </tr>                
                <tr>
                    <th>* 비밀번호</th>
                    <td class="id_name">
                    <input type="password" class="lomb" size="30" id="userPwd" name="userPwd" placeholder="영문,숫자,특수문자 포함 8자 이상" maxlength="12" required>
                        </input>
                    </td>
                </tr>
                <tr>
                    <th>* 비밀번호 확인</th>
                    <td class="id_name">
                    <input type="password" class="lomb" name="userPwd2" size="30" maxlength="12" required></td>
                </tr>
                <tr>
                    <th>* 이름</th>
                    <td class="id_name">
                    <input type="text" class="lomb" name="userName" size="30" maxlength="5" required></td>
                </tr>
                <tr>
                    <th>* 휴대전화</th>
                    <td class="id_name">
                    <input type="text" class="lomb inputNum" maxlength="11" name="phone" size="20" required>                        
                    </td>
                </tr>
                <tr>
                    <th>* 이메일</th>
                    <td class="id_name">
                    <input type="text" id="email" name="email" class="lomb inputEmail" required">
                    <!-- 
                    <input type="email" id="email1" name="email" class="lomb"  size="20" required>&nbsp;
                        <select  class="lomb2" name="emailSelection" id="emailSelection">
                            <option value="naver.com">@naver.com</option>
                            <option value="daum.com">@daum.com</option>
                            <option value="gmail.com">@gmail.com</option>
                            <option value="hanmail.net">@hanmail.net</option>
                            <option value="nate.com">@nate.com</option>
                            <option value="1" selected>&nbsp;&nbsp;직접입력</option>
                        </select></td>
                	-->
                </tr>
                <tr>
                    <th>성별</th>
                    <td class="id_name">
                    <input type="radio" class="lomb" name="gender" id="male" value="m" checked>
                    <label for="male">남자</label>
                    <input type="radio" class="lomb" name="gender" id="male2" value="f">
                    <label for="male2">여자</label>                        
                    </td>
                </tr>
                <tr>
                    <th class="privacy">개인정보 유효기간</th>
                    <td class="id_name">
                    <input type="radio" name="interest" id="interest2">1년
                    <input type="radio" name="interest" id="interest">3년
                    <input type="radio" name="interest" id="interest">5년
                    <input type="radio" name="interest" id="interest" checked>&nbsp;탈퇴 시까지</td>
                </tr>                
            </table>
        </fieldset>
        <div class="topline">
        </div>
        <fieldset class="lofd">
            <table class="lotb2">
                <tr>
                    <th class="address_name">주소</th>
                    <td><input type="text" class="postcodify_postcode5" name="address" id="lobm2" size="10"></td>
                    <td><a href="#"><button type="button" id="postcodify_search_button">주소검색</button></a></td>                    
                </tr>
                <tr>
                    <th></th>
                    <td><input type="text" class="postcodify_address" name="address" id="lobm2" size="40"></td>
                </tr>
                <tr>
                    <th></th>
                    <td><input type="text" class="postcodify_extra_info" name="address" id="lobm2" size="40"></td>
                </tr>
        </table>
        </fieldset>
        <div class="topline">
        </div>
        <br>
        <fieldset class="lofd">
            <legend id="lolegend">약관 동의</legend>
            <table class="lotb">                
                <tr>
                    <th class="terms_name">봄숲 전체 이용약관</th>
                    <td>
                        <label class="termstext">약관 전체보기</label>
                        <a href="terms"><img class="terms" src="<%= request.getContextPath() %>/resources/images/member/login-terms.png" alt="terms"></a> 
                    	<input type="checkbox" id="termsbox"><label>동의를 해야 가입됩니다.</label>
                    </td>
                </tr>
                <!-- 
                <tr>
                    <th>봄숲 커뮤니티 이용약관</th>
                    <td>
                        <label class="termstext">약관 전체보기</label>
                        <a href="#"><img class="terms" src="<%= request.getContextPath() %>/resources/images/member/login-terms.png" alt="terms"></a> 
                    </td>
                </tr>
                <tr>
                    <th>개인 정보 수집 및 이용</th>
                    <td>
                        <label class="termstext">내용보기</label>
                        <a href="#"><img class="terms" src="<%= request.getContextPath() %>/resources/images/member/login-check.png" alt="cehck"></a> 
                    </td>
                </tr>
                 -->
            </table>
        </fieldset>
                <div>
                	<button class="joinme" id="joinBtn">회원 가입하기</button>
                </div>
        </form>
        <div class="topline">
        </div>
    </div>
    </div>
    <!-- footer -->
	<jsp:include page="/WEB-INF/views/member/footer.jsp" />
	
	<!-- jQuery와 Postcodify를 로딩한다 -->
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
	<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>

	<!-- "검색" 단추를 누르면 팝업 레이어가 열리도록 설정한다 -->
	<script>
		$(function() {
			$("#postcodify_search_button").postcodifyPopUp();
		});
	</script>

	<script>
		function validate(){
			return true;
		}
	
		$("#idCheck").on('click', function(){
			
			var userId = $("[name=userId]");
			var isUsable = false;
			
			/* (/^[a-z][A-Za-z\d]{5,10}$/) 정규표현식 */
			
			if(!userId || userId.val().length < 6){
				alert("아이디는 최소 6자리 이상, 10글자 이하여야 합니다.");
				userId.focus();
			} else {
				$.ajax({
					url : "${contextPath}/idCheck",
					type : "post",
					data : { userId : userId.val() },
					success : function(result){
						console.log(result);
						if(result == "fail"){
							alert("사용할 수 없는 아이디 입니다.");
							userId.focus();
						} else {
							if(confirm("사용 가능한 아이디 입니다. 사용하시겠습니까?")){
								userId.attr('readonly', true);
								isUsable = true;
							} else {
								userId.attr('readonly', false);
								userId.focus();
								isUsable = false;
							}
						}
									
						if(isUsable){
							$("#joinBtn").removeAttr("disabled");
						} else {
							$("#joinBtn").attr("disabled", true);
						}
					},
					error : function(e){
						console.log(e);
					}
				});
			}			
		});		
	</script>
		
	<script>
	// 유효값 검사용
	function validate(){
		return true;
	}
	
	var text = "";
	var count = 0;
	
	$("#joinBtn").click(function(){
		/*
		
	    var pwPattern = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,16}$/;
	    var emailPattern = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	    var phonePattern = /(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/g;
		
	    if(idpattern.test("#userId.value") == true){
	    	text += "ID : " + "#userId.value" + "\n";
	    }
	    else alert("아이디를 잘못 입력 하셨습니다.");
	    */
	    
		/*	
	    var userId = $("[name=userId]");
		var userPwd = $("[name=userPwd]");
		var userPwd2 = $("[name=userPwd2]");
		var userName = $("[name=userName]");
		var phone = $("[name=phone]");
		var email = $("[name=email]");
		var address = $("[name=address]");
		// var idPattern = /^[A-Za-z]{1}[A-Za-z0-9]{6,10}$/;
		if(!userId.val()){
			alert("아이디를 입력하여야 합니다.");
			return false;
		}
		
		if(!idPattern.test(userId.val()){
			alert("알파뱃 하고 숫자만 사용가능합니다.");
			return false;
		}
		*/
		/*
		if(!check(/^[a-z][A-Za-z\d]{5,11}$/, 
	            document.getElementById("userId"), 
	            "아이디는 영문 소문자로 시작하여 영문과 숫자로만 6~12자 입력하세요"))
	            return false;
		*/
	    /*
	    if($("#userName") == false){
			alert("이름을 적어주세요.");
			return;
	    }
	    */    
	    
	    /*
	    if(!userName || userId.val() == false){
			alert("이름을 입력해주세요.");
			userName.focus();
	    }
	    
	    if(!userName.val() == false){
	    	alert("이름을 입력해주세요".)};
	    	userName.focus();
	    }
	    */	     
	    
	    //if(!check(/(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[^a-zA-Z0-9]).{8,20}/,
	    //        document.getElementById("userPwd"),
	    //        "비밀번호는 영문 대소문자 숫자 특수문자를 모두 하나이상 포함하여 8~20자 입력하세요"))
	    //            return false;
	    // if(!check(re,pw,"패스워드는 4~12자의 영문 대소문자와 숫자로만 입력")) {
	    //     return false;
	    // }
	    
	    /*
	    */
	    var re = /^[a-zA-Z0-9]{8,16}$/
	    var id = document.getElementById("userId");
	    var pw = document.getElementById("userPwd");
	    var name = document.getElementById("userName");
	    var idCheck = /^(?=.*[a-zA-Z])(?=.*[0-9]).{6~10}$/;
	    
	    /*
	    if(id.value == ""){
	    	alert("아이디를 입력하세요.");
	    	id.focus();
	    	return true;
	    }
	    
	    */
	    if(joinForm.userId.value == ""){
	    	alert("아이디를 입력하지 않았습니다")
	    	joinForm.userId.focus();
	    	return false;
	    }
	    /*
	    if(!idCheck.test(joinForm.userId.value)){
	    	alert("아이디는 영어+숫자 조합으로 6~10자 사이로 입력해주세요.")
	    	pw.focus();
	    	return false;
	    }
	    */
	    
	    if(pw.value == ""){
	    	alert("비밀번호를 입력하세요.");
	    	pw.focus();
	    	return false;
	    }

	    var pwCheck = /^(?=.*[a-zA-Z])(?=.*[!@#$%^&*+=-])(?=.*[0-9]).{8,25}$/;
	    
	    if(!pwCheck.test(pw.value)){
	    	alert("비밀번호는 영어+숫자+특수문자 조합으로 8~20 사이로 입력해주세요.")
	    	pw.focus();
	    	return false;
	    }
	    
	    /*
	    if(joinForm.userPwd.value == ""){
	        alert("비밀번호를 입력하지 않았습니다")	    	
	    	joinForm.userPwd.focus();
	    	return false;
	    }
	    */
	    /*
	    if(!check(/^[a-zA-Z0-9]{8,16}$/,
	    		document.getElementById('userPwd'),
	    		"비밀번호 입력"))
	       	return false;
	    }
	    */
	    
	    if(joinForm.userPwd.value != joinForm.userPwd2.value){
	    	alert("비밀번호가 같지 않습니다.")
	    	joinForm.userPwd2.focus();
	    	return false;
	    }
	    	        
	    if(joinForm.userName.value == ""){
	    	alert("이름을 입력하지 않았습니다")
	    	joinForm.userName.focus();
	    	return false;
	    }
	    /*
	    if(name.value == ""){
	    	alert("이름을 입력해주세요..");
	    	name.focus();
	    	return false;
	    }
	    */
	    
	    var nameCheck = /^[ㄱ-ㅎㅏ-ㅣ가-힣]{2,}$/;
	    if(!nameCheck.test(joinForm.userName.value)){
	    	alert("이름은 한글로 2자 이상 입력해주세요.")
	    	joinForm.userName.focus();
	    	return false;
	    }
	    	    
	    if(joinForm.phone.value == ""){
	    	alert("전화번호를 입력하지 않았습니다")
	    	joinForm.phone.focus();
	    	return false;
	    }
	    var phoneCheck = /^[0-9]{11}$/;
	    if(!phoneCheck.test(joinForm.phone.value)){
	    	alert("숫자만 입력가능합니다")
	    	joinForm.phone.focus();
	    	return false;
	    }
	    
	    if(joinForm.email.value == ""){
	    	alert("이메일을 입력하지 않았습니다")
	    	joinForm.email.focus();
	    	return false;
	    }
	    
	    var emailCheck = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		if(!emailCheck.test(joinForm.email.value)){
			alert("숫자와 영어만 입력가능합니다")
			joinForm.email.focus();
			return false;
		}
	    /*
	    if(joinForm.address.value == ""){
	    	alert("주소를 입력하지 않았습니다")
	    	joinForm.email.focus
	    	return false;
	    }
	    */
	    if($("#termsbox").is(":checked") == false){ 
				alert("이용약관에 동의하여야 회원가입이 진행됩니다.");
				return false;
		}
	    		
		return true;
	});
	</script>	
	
	<script type="text/javascript">
	
	$('#emailSelection').change(function(){
		$("#emailSelection option:selected").each(function () {
			
			if($(this).val()== '1'){				
				$("#email1").val('');
				$("#email1").attr("disabled",false);
				
			}else{ 
				$("#email1").val($(this).text());
				$("#email1").attr("disabled",true);
			}
			
		}); 
		
	});
	
	</script>

	


</body>
</html>