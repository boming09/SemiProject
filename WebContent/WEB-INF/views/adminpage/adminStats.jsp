<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
				<div class="col-md-4">
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
		let salesChart = document.getElementById('salesChart').getContext('2d');
		
		let saChart = new Chart(salesChart, {
			type: 'line',
			data: {
				labels : ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'],
				datasets : [
					{
					label: '매출',
					data : [3000000, 200000, 1500000, 1000000, 1300000, 3500000, 4000000],
					backgroundColor:[
						'red',
						'blue',
						'gray',
						'skyblue',
						'yellow',
						'pink',
						'black'
					]
				}],
			}
		});
	
	
	
		let genderChart = document.getElementById('genderChart').getContext('2d');
		
		let gdChart = new Chart(genderChart, {
			type: 'line',
			data: {
				labels : ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'],
				datasets : [{
					label: '남자',
					data : [30, 25, 15, 20, 35, 40, 17],
					backgroundColor: 'blue',
					boderColor: 'blue',
					borderWidth: 1
				},
				{
					label: '여자',
					data : [17, 22, 10, 40, 32, 27, 13],
					backgroundColor: 'red',
					boderColor: 'red',
					borderWidth: 1
				}
				],
			}
		});
		

		
		
		let addressChart = document.getElementById('addressChart').getContext('2d');
		
		let adChart = new Chart(addressChart, {
			type: 'bar',
			data: {
				labels : ['서울', '경기', '전라도', '경상도', '충청도', '강원도', '제주'],
				datasets : [{
					label: '가입자 지역 통계',
					data : [ 30, 25, 20, 32, 12, 24, 17],
					backgroundColor: [ 'rgba(255, 99, 132, 0.2)'
						, 'rgba(54, 162, 235, 0.2)'
						, 'rgba(255, 206, 86, 0.2)'
						, 'rgba(75, 192, 192, 0.2)'
						, 'rgba(153, 102, 255, 0.2)'
						, 'rgba(255, 159, 64, 0.2)' ]
						, borderColor: [ 'rgba(255, 99, 132, 1)'
						, 'rgba(54, 162, 235, 1)'
						, 'rgba(255, 206, 86, 1)'
						, 'rgba(75, 192, 192, 1)'
						, 'rgba(153, 102, 255, 1)'
						, 'rgba(255, 159, 64, 1)' ]
				}]
			},
			options: {
				responsive: true, 
				legend: false, 
				maintainAspectRatio : false, 
				animation: false, 
				pieceLabel: { mode:"label", position:"outside", fontSize: 11, fontStyle: 'bold' }
			}
		});
	</script>
</body>
</html>