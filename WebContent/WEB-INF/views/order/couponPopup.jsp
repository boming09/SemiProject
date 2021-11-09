<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	// 팝업오픈하여 폼데이터 Post 전송
	function openPop(){
	
	    var pop_title = "popupOpener" ;
	     
	    window.open("", pop_title) ;
	     
	    var frmData = document.frmData ;
	    frmData.target = pop_title ;
	    frmData.action = "popup.jsp" ;
	     
	    frmData.submit() ;
	     
	}

</script>
</head>
<body>

<!-- 팝업창으로 전송하는 정보 -->
<form name="frmData" id="frmData" method="post">
    <input type="text" name="name" id="name" value="홍길동" />
    <input type="text" name="id" id="id" value="gildong" />
</form>
 
<a href="#" onClick="openPop();">팝업창으로 POST 전송!!</a>



</body>
</html>