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
    <link href="<%= request.getContextPath() %>/resources/css/mypage-style.css" rel="stylesheet">
</head>
<body>
    <!-- 메뉴바 -->
	<%@ include file="/WEB-INF/views/common/menubar.jsp" %>
        <div class="content wrapper">
            <aside id="category">
                <div class="q-search">빠른분야찾기</div>
                <ul class="q-list">
                    <li><a href="#">국내도서</a>
                        <div class="sublist kbook">
                                <ul class="kbook1">
                                    <li><a href="#">소설/시/희곡</a></li>
                                </ul>
                                <ul>
                                    <li><a href="#">만화</a></li>
                                </ul>
                            </div>
                        </div>
                    </li>
                    <li><a href="#">국외도서</a>
                        <div class="sublist fbook">
                                <ul>
                                    <li><a href="#">문학 소설</a></li>
                                </ul>
                            </div>
                        </div>
                    </li>
                    <li><a href="#">eBook</a>
                        <div class="sublist ebook">
                                <ul> 
                                    <li><a href="#">소설</a></li>
                                </ul>
                            </div>
                        </div>
                    </li>
                    <li><a href="#">웹소설/코믹</a>
                        <div class="sublist webcomic">                           
                                <ul>
                                    <li><a href="#">로맨스</a></li>
                                </ul>
                            </div>
                        </div>
                    </li>
                    <li><a href="#">공연</a>
                        <div class="sublist show">                            
                                <ul>
                                    <li><a href="#">콘서트</a></li>                                    
                                </ul>
                            </div>
                        </div>
                    </li>
                    <li><a href="#">중고샵</a>
                        <div class="sublist used">                            
                                <ul>
                                    <li><a href="#">가정과 생활</a></li>                                    
                                </ul>
                            </div>
                        </div>
                    </li>
                </ul>
            </aside>
        </div>
    <!-- footer -->
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>