<%@page import="com.ssafy.vo.Customer"%>
<%@page import="com.ssafy.vo.Food"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
	List<Food> list = (List<Food>)session.getAttribute("foods");
	int target = Integer.parseInt((String)session.getAttribute("num"));
	Food food = null;
	for(Food t:list){
		if(t.getCode()==target){
			food = t;
			break;
		}
	}
%>
<!-- 부트 스트랩 사용 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
	google.charts.load('current', {
		'packages' : [ 'corechart' ]
	});
	google.charts.setOnLoadCallback(drawChart);
	function drawChart() {
		var data = google.visualization
				.arrayToDataTable([ [ 'nutrition', 'kcal' ],
						[ 'calorie', <%=food.getCalory()%> ], [ 'carbohydrate', <%=food.getCarbo()%> ],
						[ 'protein', <%=food.getProtein()%> ], [ 'fat', <%=food.getFat()%>], [ 'sugars', <%=food.getSugar()%> ],
						[ 'natrium', <%=food.getNatrium()%> ], [ 'cholesterol', <%=food.getChole()%> ],
						[ 'fatty acid', <%=food.getFattyacid()%> ], [ 'trans fat', <%=food.getTransfat()%> ] ]);

		var options = {
			backgroundColor: 'transparent',
			title : 'nutritional information'
		};

		var chart = new google.visualization.PieChart(document
				.getElementById('piechart'));

		chart.draw(data, options);
		chart.backgroundColor("#eee");
	}
</script>
<script>
$(function(){
  $(document).mousemove(function(e) {
      mouseX = e.pageX;
      mouseY = e.pageY;
      $('#aa').css("left", e.clientX+"px").css("top", e.clientY-50);
 });
});
</script>
<style type="text/css">
	a{
		color : black;
	}
select {
	font-size: 13pt;
}

#detail_img{
	width: 300px;
	height: 300px;
}

#piechart{
	margin: 0px auto;
}

.container{
	margin: 0px auto;
	width: 750px;
}

#map{
	height	: 500px;
	width	: 100%;
}
</style>
<title>상세 정보 페이지</title>
</head>
<body>
<body id="detail_body">
	<header>
		<h1>제품 정보</h1>
	</header>
	<hr>
	<img id="detail_img" alt="제품 사진" src="img/<%=food.getName()%>.png">
	<br>
	<br>
	<div class="container">   
	  <table class="table table-hover">
	    <tbody style=" font-size:17px;">
	      <tr>
	        <td style="width:200px;">제품명</td>
	        <td><%=food.getName() %></td>
	      </tr>
	      <tr>
	        <td>제조사</td>
	        <td><%=food.getMaker() %></td>
	      </tr>
	      <tr>
	        <td>원재료</td>
	        <td style="width:400px;"><%=food.getMaterial() %></td>
	      </tr>
	      <tr>
	        <td>알레르기</td>
	        <%
	        	if(session.getAttribute("login").equals("yes")){	        
	        		Customer c = (Customer)session.getAttribute("c");
	        		%>
	        		<td style="color: red;">
	        		<%
	        		for(String allergy: c.getAllergys()){
	       			%>
	       			<%if(food.getMaterial().contains(allergy)){%>
	       				<%=allergy+"  " %>
   				<%
	       			}
	       			}
        		%>
	        		</td>
	        		<%
	        	}else{
	        %>
	        <td>알레르기 없음</td>
	       <%} %>
	      </tr>
	    </tbody>
	  </table>
	</div>
	<div id="piechart" style="width: 900px; height: 500px;"></div>
	<script type="text/javascript">
		function initMap() {
			var map = new google.maps.Map(
					document.getElementById('map'),{zoom:15,center:{lat:37.5014681,lng:127.0395012}});
			var marker = new google.maps.Marker({position: {lat:37.5014681,lng:127.0395012}, map: map,
				label :{
					text : '<%=food.getName() %>',
					color : "#000000",
					fontSize : '16px',
					fontWeight : 'bold'
				}
			});
		}
	</script>

	<img id="aa" src="img/<%=food.getName()%>.png" style="position:fixed; width: 50px; height: 50px; z-index: 10;"/>
	<h1>파는곳 위치</h1>
	<script async defer
	src = "https://maps.googleapis.com/maps/api/js?key=AIzaSyCDGNlSULCMyQEcS5osxeKQZsWBCTVfOXk&callback=initMap"></script>
	<div id="map"></div>
</body>

</body>
</html>