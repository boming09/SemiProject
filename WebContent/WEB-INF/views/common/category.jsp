<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>category</title>
<style>
	.wrapper {
		min-width : 800px;
		width : 1100px;
		margin : 0px auto;
	}
	
	.content {
		display : flex;
	}
	
	#category {
		width : 18%;
		height : 500px;
		background : rgb(196, 217, 195);
	}
	
	#main-content {
		width : 64%;
		height : 500px;
		border : 1px solid black;
	}
	
	#sidebar {
		width : 18%;
		height : 500px;
		border : 1px solid black;
	}
	
	.q-search {
		text-align : center;
		height : 70px;
		display : flex;
		justify-content : center;	
		align-items: center;
		font-size : 1.2rem;
		font-weight : bold;
	}
	
	#category li {
		list-style : none;
		text-align : left;
	}
	
	#category a {
		text-decoration : none;
		text-align : center;
		color : black;
	}
	
</style>
</head>
<body>
	<div class="content wrapper">
		<aside id="category">
			<div class="q-search">빠른분야찾기</div>
			<ul class="q-list">
				<li><a href="#">국내도서</a></li>
				<li><a href="#">국외도서</a></li>
				<li><a href="#">eBook</a></li>
				<li><a href="#">웹소설/코믹</a></li>
				<li><a href="#">공연</a></li>
				<li><a href="#">중고샵</a></li>
			</ul>
		</aside>
		<article id="main-content">
		</article>
		<aside id="sidebar">
		</aside>
	</div>

</body>
</html>