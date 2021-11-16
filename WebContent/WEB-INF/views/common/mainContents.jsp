<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="main.model.vo.Recommend"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="main-recomm">
<title>메인_추천</title>

<!-- CSS -->

<!-- 브라우저별로 디폴트로 적용 된 CSS에 차이(여백, 폰트 크기 등)가 있어 CSS가 별도로
지정 되지 않은 요소는 브라우저별로 다르게 보일 가능성이 있음. 만들어져 있는 리셋 CSS 활용.-->
<!--ress.css(모든 CSS 리셋이 아니라 디폴트 스타일을 활용해서 브라우저들의 최소한의 오차를 없앰)
https://github.com/filipelinhares/ress-->
<link rel="stylesheet" href="https://unpkg.com/ress/dist/ress.min.css">
 <!-- 외부 스타일 시트 -->
 <link href="<%= request.getContextPath() %>/resources/css/style.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

</head>
<body>
  <section class="main">  
        
        <div class="tab_content">
 
            <input type="radio" name="tabmenu" id="tab01" checked>
            <label for="tab01">이 주의 책</label>
       	
            <input type="radio" name="tabmenu" id="tab02">
            <label for="tab02">신간 도서</label>
       	
            <input type="radio" name="tabmenu" id="tab03">
            <label for="tab03">화제의 책</label>
        	
            <div class="conbox con1">
                <ul class="recomm">          
                    <li><a href="#"><img class="book book1" src="<%= request.getContextPath() %>/resources/images/thisweek1.png"></a></li>
                    <li><a href="#"><img class="book" src="<%= request.getContextPath() %>/resources/images/thisweek2.png"></a></li>
                    <li><a href="#"><img class="book book3" src="<%= request.getContextPath() %>/resources/images/thisweek3.png"></a></li>
                </ul>  
            </div>
            <div class="conbox con2">
                <ul class="recomm">
                    <li><a href="#"><img class="book book1" src="<%= request.getContextPath() %>/resources/images/new1.png"></a></li>
                    <li><a href="#"><img class="book" src="<%= request.getContextPath() %>/resources/images/new2.png"></a></li>
                    <li><a href="#"><img class="book book3" src="<%= request.getContextPath() %>/resources/images/new3.png"></a></li>
                </ul>  
            </div>
            <div class="conbox con3">
                <ul class="recomm">
                    <li><a href="<%= request.getContextPath() %>/book/detail"><img class="book book1" src="<%= request.getContextPath() %>/resources/images/pop1.png"></a></li>
                    <li><a href="#"><img class="book" src="<%= request.getContextPath() %>/resources/images/pop2.png"></a></li>
                    <li><a href="#"><img class="book book3" src="<%= request.getContextPath() %>/resources/images/pop3.png"></a></li>
                </ul>  
            </div>
 
        </div>

	<div class="main_bottom">
		<div class="todays">
			<div class="todays_recom">
				<table id="today">
					<tr>
					    <td rowspan="4" name="todayImg"></td>
					    <td>
					        <b>오늘의 책</b>
					        <c:if test="${ !empty loginUser && loginUser.userId == 'admin' }">
					        <button type="button" name="editBtn" onclick="location.href='${ contextPath }/admin/todaybook'" style="border: 1px solid black; width: 30px; background: pink; color: white; margin-left: 10px;">edit</button>
					        </c:if>
					    </td>
					</tr>
					<tr>
					</tr>
					<tr>
					    <td>
					    <div class="tri" style="width: 200px; height: 130px; overflow: hidden; margin-top: 5px; font-size: 16px; color: #bfbfbf; text-overflow: ellipsis; display: -webkit-box; -webkit-line-clamp: 5; -webkit-box-orient: vertical; line-height: 1.2em; height: 5.9em;"></div>
					    </td>
					</tr>
					<tr>
					    <td id=tbn2></td>
					</tr>
				</table>
			</div>
		</div>
	
	
		<div class="best">  
	        <div class="best-seller">
	            <p id="bs">주간 베스트 셀러</p><br>
	    
	            <table id="bs_tb">
	                <tr>
	                    <td><b>1</b><br>-</td>
	                    <td><a href=""><img class="bsb" src="<%= request.getContextPath() %>/resources/images/pop1.png"></a></td>
	                    <td><a href="<%= request.getContextPath() %>/book/detail"><span class="bsn">킹덤</span><br><span class="bsw">요네스뵈 저</span></a></td>
	                </tr>
	                <tr>
	                    <td><b>2</b><br>-</td>
	                    <td><a href=""><img class="bsb" src="<%= request.getContextPath() %>/resources/images/pop2.png"></a></td>
	                    <td><a href=""><span class="bsn">나와 밍들의 세계</span><br><span class="bsw">천선란 저</span></a></td>
	                </tr>
	                <tr>
	                    <td><b>3</b><br>-</td>
	                    <td><a href=""><img class="bsb" src="<%= request.getContextPath() %>/resources/images/thisweek3.png"></a></td>
	                    <td><a href=""><span class="bsn">뇌 과학의 모든 역사</span><br><span class="bsw">매튜 코브 저</span></a></td>
	                </tr>
	                <tr>
	                    <td><b>4</b><br>-</td>
	                    <td><a href=""><img class="bsb" src="<%= request.getContextPath() %>/resources/images/thisweek2.png"></a></td>
	                    <td><a href=""><span class="bsn">어떻게 쓰지 않을 수 있겠어요</span><br><span class="bsw">이윤주</span></a></td>
	                </tr>
	                <tr>
	                    <td><b>5</b><br>-</td>
	                    <td><a href=""><img class="bsb" src="<%= request.getContextPath() %>/resources/images/thisweek1.png"></a></td>
	                    <td><a href=""><span class="bsn">은밀한 결정</span><br><span class="bsw">오가와 요코</span></a></td>
	                </tr>
	            </table>
	        </div>
		</div> 
	</div>

        
   </section>



<script>

$(document).ready(function(){
	$.ajax({
		url : "${pageContext.servletContext.contextPath}/admin/todayajax",
		dataType : "json",
		type : "get",
		success : function(stock){
			var stockPrice = stock.salePrice.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
			$('td#tbn2').append('<b>'+stock.btitle+'</b><br>'+stock.author+' 저| '+stock.publisher+'<br><b>'+stockPrice+'</b>원(10% 할인)');
			$('.tri').append(stock.bintro);
			$('td[name=todayImg]').append('<a href="#"><img class="bookk book4" src="${contextPath}'+stock.bimg+'"></a>');
		},
		error : function(e){
			console.log(e);
		}
	});
});


</script>




</body>
</html>