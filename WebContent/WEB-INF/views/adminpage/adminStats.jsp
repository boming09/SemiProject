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
				datasets : [{
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
				}]
			}
		});
	
	
	
		let genderChart = document.getElementById('genderChart').getContext('2d');
		
		let gdChart = new Chart(genderChart, {
			type: 'bar',
			data: {
				labels : ['남자', '여자'],
				datasets : [{
					label: '가입자 성별 통계',
					data : [30, 25],
					backgroundColor:[
						'blue',
						'red'
					]
				}],
			}
		});
		
		
		
		
		let addressChart = document.getElementById('addressChart').getContext('2d');
		
		let adChart = new Chart(addressChart, {
			type: 'pie',
			data: {
				labels : ['서울', '경기', '전라도', '경상도', '충청도', '강원도', '제주'],
				datasets : [{
					label: '가입자 지역 통계',
					data : [30, 25, 20, 32, 12, 24, 17],
					backgroundColor:[
						'red',
						'blue',
						'gray',
						'skyblue',
						'yellow',
						'pink',
						'black'
					]
				}]
			}
		});
	</script>
</body>
</html>