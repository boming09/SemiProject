<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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


</head>
<body>
 <section class="wrapper">
        
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
                    <li><a href="#"><img class="book book1" src="<%= request.getContextPath() %>/resources/images/pop1.png"></a></li>
                    <li><a href="#"><img class="book" src="<%= request.getContextPath() %>/resources/images/pop2.png"></a></li>
                    <li><a href="#"><img class="book book3" src="<%= request.getContextPath() %>/resources/images/pop3.png"></a></li>
                </ul>  
            </div>
 
        </div>


        
    </section>

</body>
</html>