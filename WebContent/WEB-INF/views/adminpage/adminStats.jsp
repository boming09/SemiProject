<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.6.0/chart.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<jsp:include page="/WEB-INF/views/common/menubar.jsp" />
<div class="csarea wrapper">
<jsp:include page="/WEB-INF/views/adminpage/adminCategory.jsp" />
	
	<div class="container">
		<div>
			<div class="row" style="border: 3px solid pink; width: 90vh; height: 60vh; position: inherit; margin: 5px;">
				<div class="col-md-6">
					<canvas id="genderChart"></canvas>
				</div>
				<div class="col-md-6">
					<canvas id="addressChart"></canvas>
				</div>
				<div class="col-md-8">
					<canvas id="salesChart"></canvas>
				</div>
			</div>
		</div>
	</div>
</div>
	<script>
	let today = new Date();
	let one = new Date();
	one.setDate(one.getDate()-1);
	one.setMonth(one.getMonth()+1);
	let two = new Date();
	two.setDate(two.getDate()-2);
	two.setMonth(two.getMonth()+1);
	let three = new Date();
	three.setDate(three.getDate()-3);
	three.setMonth(three.getMonth()+1);
	let four = new Date();
	four.setDate(four.getDate()-4);
	four.setMonth(four.getMonth()+1);
	let five = new Date();
	five.setDate(five.getDate()-5);
	five.setMonth(five.getMonth()+1);
	let six = new Date();
	six.setDate(six.getDate()-6);
	six.setMonth(six.getMonth()+1);
	
	
	
	
		let salesChart = document.getElementById('salesChart').getContext('2d');
		
		let saChart = new Chart(salesChart, {
			type: 'line',
			data: {
				labels : [six.getMonth()+'월 '+six.getDate()+'일', five.getMonth()+'월 '+five.getDate()+'일', four.getMonth()+'월 '+four.getDate()+'일', three.getMonth()+'월 '+three.getDate()+'일', two.getMonth()+'월 '+two.getDate()+'일', one.getMonth()+'월 '+one.getDate()+'일', '오늘'],
				datasets : [
					{
					label: '매출',
					data : [3000000, 200000, 1500000, 1000000, 1300000, 3500000, 4000000],
					backgroundColor: [ 'rgba(255, 99, 132, 0.2)'
						, 'rgba(200, 99, 132, 0.2)'
						, 'rgba(54, 162, 235, 0.2)'
						, 'rgba(255, 206, 86, 0.2)'
						, 'rgba(75, 192, 192, 0.2)'
						, 'rgba(153, 102, 255, 0.2)'
						, 'rgba(255, 159, 64, 0.2)' ]
						, borderColor: [ 'rgba(255, 99, 132, 1)'
						, 'rgba(200, 99, 132, 0.2)'
						, 'rgba(54, 162, 235, 1)'
						, 'rgba(255, 206, 86, 1)'
						, 'rgba(75, 192, 192, 1)'
						, 'rgba(153, 102, 255, 1)'
						, 'rgba(255, 159, 64, 1)' ]
				}]
			},
			options: {
				responsive: true,
				plugins:{
					legend:{
						display: false
					},
					title:{
						display : true,
						text : '최근 1주일 매출 통계',
					}
				}
			}
		});
	
	
	
		let genderChart = document.getElementById('genderChart').getContext('2d');
		
		let gdChart = new Chart(genderChart, {
			type: 'bar',
			data: {
				labels : [six.getMonth()+'월 '+six.getDate()+'일', five.getMonth()+'월 '+five.getDate()+'일', four.getMonth()+'월 '+four.getDate()+'일', three.getMonth()+'월 '+three.getDate()+'일', two.getMonth()+'월 '+two.getDate()+'일', one.getMonth()+'월 '+one.getDate()+'일', '오늘'],
				datasets : [{
					label: '남자',
					data : ['${areaList.man6}', '${areaList.man5}', '${areaList.man4}', '${areaList.man3}', '${areaList.man2}', '${areaList.man1}', '${ areaList.man }'],
					backgroundColor: 'blue',
					boderColor: 'blue',
				},
				{
					label: '여자',
					data : ['${ areaList.woman6 }', '${ areaList.woman5 }', '${ areaList.woman4 }', '${ areaList.woman3 }', '${ areaList.woman2 }', '${ areaList.woman1 }', '${ areaList.woman }'],
					backgroundColor: 'red',
					boderColor: 'red',
				}]
			},
			options : {
				responsive: true,
			    plugins: {
			      legend: {
			        display : true
			      },
				title: {
					display : true,
					text : '최근 1주일 남녀 가입자 통계',
					}
			    }
			}
		});
		

		
		
		let addressChart = document.getElementById('addressChart').getContext('2d');
		
		let adChart = new Chart(addressChart, {
			type: 'bar',
			data: {
				labels : ['서울', '인천', '경기', '전라도', '경상도', '충청도', '강원도', '제주'],
				datasets : [{
					label: '가입자 지역 통계',
					data : [ '${areaList.seoul}', '${areaList.incheon}', '${areaList.gyeonggi}', '${areaList.gangwon}'
						, '${areaList.gyeongsang}', '${areaList.chungcheong}', '${areaList.jeolla}', '${areaList.jeju}'],
					backgroundColor: [ 'rgba(255, 99, 132, 0.2)'
						, 'rgba(200, 99, 132, 0.2)'
						, 'rgba(54, 162, 235, 0.2)'
						, 'rgba(255, 206, 86, 0.2)'
						, 'rgba(75, 192, 192, 0.2)'
						, 'rgba(153, 102, 255, 0.2)'
						, 'rgba(255, 159, 64, 0.2)'
						, 'rgba(185, 139, 64, 0.2)']
						, borderColor: [ 'rgba(255, 99, 132, 1)'
						, 'rgba(200, 99, 132, 0.2)'
						, 'rgba(54, 162, 235, 1)'
						, 'rgba(255, 206, 86, 1)'
						, 'rgba(75, 192, 192, 1)'
						, 'rgba(153, 102, 255, 1)'
						, 'rgba(255, 159, 64, 1)'
						, 'rgba(185, 139, 64, 0.2)']
				}]
			},
			options : {
				responsive: true,
			    plugins: {
			      legend: {
			        display : false
			      },
				title: {
					display : true,
					text : '지역별 가입자 통계',
					}
			    }
			}
		});
	</script>
</body>
</html>