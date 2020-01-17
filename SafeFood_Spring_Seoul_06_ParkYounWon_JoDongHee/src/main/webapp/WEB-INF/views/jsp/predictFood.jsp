<%@page import="com.ssafy.vo.Customer"%>
<%@page import="com.ssafy.vo.Food"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 부트 스트랩 사용 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css?family=Stylish&amp;subset=korean" rel="stylesheet">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
	var data = []; 
	var carbohydrate = ['carbohydrate',0];
	var protein = ['protein',0];
	var fat = ['fat',0];
	var sugars = ['sugars',0];
	var natrium = ['natrium/100',0];
	var cholesterol = ['cholesterol',0];
	var fatty_acid = ['fatty acid',0];
	var trans_fat = ['trans fat',0];
	var header = ['Nutrition',''];
</script>
<script type="text/javascript">
$('document').ready(function () {
	$('#mainContent').css("height","1500px");
	$('#login').click(function () {
		$('#mainContent').load("html/login.html")
		$('#mainContent').css("height","400px")
	})

	// 제품 상세 정보
	$('.hi').click(function () {
		$('#mainContent').load("detail.dd?num="+$(this).attr("name"))
		$('#mainContent').css("height","2000px")
	})
	
	// 회원 탈퇴 클릭시
	$(document).on('click',"#goodBytbtn",function () {
		location.href = "goodbye.dd"
	})
	
	//로고클릭
	$('#logo').click(function () {
		window.location.href = "main.dd";
	})
	
	// 회원 정보 클릭
	$('#userinfo').click(function () {
		//$('#mainContent').load("html/login.html")
		$('#mainContent').load("signup2.dd")
		$('#mainContent').css("height","800px")
	})
	
	// 로그아웃 클릭
	$('#logout').click(function () {
		location.href = "logout.dd";
	})
	
	// 회원 가입 클릭
	$('#signup').click(function () {
		$('#mainContent').load("html/signup.html")
		$('#mainContent').css("height","800px")
	})
	$(".hover").mouseleave(
				  function () {
				    $(this).removeClass("hover");
				  }
				);

	<%
		String loginCheck = "";
		try{
			loginCheck = (String)session.getAttribute("login");
		}catch(Exception e){
			session.setAttribute("login","");
		}
		if(loginCheck.equals("yes")){
	
	%>
		// 로그인 했을 경우.
		$('#userinfo').css("display","inline-block")
		$('#logout').css("display","inline-block")
		$('#login').css("display","none")
		$('#signup').css("display","none")
		
	<%}else{%>
		// 로그인 안됐으니 그대로
		$('#userinfo').css("display","none")
		$('#logout').css("display","none")
	<%}%>
	
})
</script>
<style type="text/css">
	a{
		color : black;
	}
	#mainBody{
		background-image:url("images/nabi.gif");		
		height: 100%;
		width: 1400px;
		padding-top : 70px;
		padding-bottom: 70px;
		margin: auto;
		font-family: 'Stylish', sans-serif;
	}
	
	#logo{
		float: left;
	}
	
	#topMenu{
		float: left;
		margin-left: 100px;
		background: #FFEEEE;
		background: -webkit-linear-gradient(to bottom, #DDEFBB, #FFEEEE);
		background: linear-gradient(to bottom, #DDEFBB, #FFEEEE);	
		text-align: center;
		margin-left: 40px;
		width: 1100px;
	}
	
		#topMenu ul{
			padding-left: 0px;
		}
		
			#topMenu ul li{
				list-style: none;
				display: inline-block;
				color: white;
				font-size: 15px;
			}
	
	#title{
		clear:left;
		width: 1100px;
		height: 300px;
		background: #FFEEEE;
		background: -webkit-linear-gradient(to top, #DDEFBB, #FFEEEE);
		background: linear-gradient(to top, #DDEFBB, #FFEEEE);
		margin-left: 150px;
		text-align: center;
		padding-top: 10px;
	}
	
		#title .targetDiv{
			float:left;
			margin-left: 100px;
		}
		
		select, #searchBtn{
			height: 40px;
		}
		select{
			width: 100px;
			font-size: 13pt;
		}
		
		#textInput{
			width: 400px;
			height: 40px;
		}
		
		#titleBar1{
			border: 1px solid #777;
			margin: 0px 20px;
		}
		
		#titleBar2{
			border: 3px solid #fff;
		}
		
		#searchBtn{
			margin-top: 30px;
		}
	
	#mainContent{
		clear:left;
		width: 1100px;
		background: #FFEEEE;
		background: -webkit-linear-gradient(to bottom, #DDEFBB, #FFEEEE);
		background: linear-gradient(to bottom, #DDEFBB, #FFEEEE);	
		margin-top: 30px;
		margin-left: 150px;
		text-align: center;
		padding-top: 10px;
	}
	
	footer{
		position: fixed;
		padding-left: 70px;
		bottom: 0px;
		left:0px;
		rigth:0px;
		height: 100px;
		width: 2000px;
		color: white;
		background-color: black;
	}
	
	#chart_div{
		margin: 10px;
	}
	.goodheader{
font-size : 50px;
}
.snip1562 {
  background-color: #c47135;
  border: none;
  color: #ffffff;
  cursor: pointer;
  display: inline-block;
/*   font-family: 'BenchNine', Arial, sans-serif; */
  font-family: 'Stylish', sans-serif;
  font-size: 1em;
  font-size: 15px;
  line-height: 1em;
  margin: 15px 40px;
  outline: none;
  padding: 6px 20px 5px; 
  position: relative;
  text-transform: uppercase;
  font-weight: 700;
}

.snip1562:before,
.snip1562:after {
  border-color: transparent;
  -webkit-transition: all 0.25s;
  transition: all 0.25s;
  border-style: solid;
  border-width: 0;
  content: "";
  height: 24px;
  position: absolute;
  width: 24px;
}

.snip1562:before {
  border-color: #c47135;
  border-left-width: 2px;
  border-top-width: 2px;
  left: -5px;
  top: -5px;
}

.snip1562:after {
  border-bottom-width: 2px;
  border-color: #c47135;
  border-right-width: 2px;
  bottom: -5px;
  right: -5px;
}

.snip1562:hover,
.snip1562.hover {
  background-color: #c47135;
}

.snip1562:hover:before,
.snip1562.hover:before,
.snip1562:hover:after,
.snip1562.hover:after {
  height: 100%;
  width: 100%;
}
	
	.classname {
	-moz-box-shadow:inset 1px 1px 0px 0px #fceaca;
	-webkit-box-shadow:inset 1px 1px 0px 0px #fceaca;
	box-shadow:inset 1px 1px 0px 0px #fceaca;
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #ffce79), color-stop(1, #eeaf41) );
	background:-moz-linear-gradient( center top, #ffce79 5%, #eeaf41 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffce79', endColorstr='#eeaf41');
	background-color:#ffce79;
	-webkit-border-top-left-radius:0px;
	-moz-border-radius-topleft:0px;
	border-top-left-radius:0px;
	-webkit-border-top-right-radius:0px;
	-moz-border-radius-topright:0px;
	border-top-right-radius:0px;
	-webkit-border-bottom-right-radius:0px;
	-moz-border-radius-bottomright:0px;
	border-bottom-right-radius:0px;
	-webkit-border-bottom-left-radius:0px;
	-moz-border-radius-bottomleft:0px;
	border-bottom-left-radius:0px;
	text-indent:0;
	border:1px solid #eeb44f;
	display:inline-block;
	color:#ffffff;
	border-radius:10px;
	font-size:15px;
	font-weight:bold;
	font-style:normal;
	line-height:40px;
	text-decoration:none;
	text-align:center;
	text-shadow:1px 1px 0px #ce8e28;
}
.classname:hover {
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #eeaf41), color-stop(1, #ffce79) );
	background:-moz-linear-gradient( center top, #eeaf41 5%, #ffce79 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#eeaf41', endColorstr='#ffce79');
	background-color:#eeaf41;
}.classname:active {
	position:relative;
	top:1px;
}
</style>

<title>Insert title here</title>
</head>
<body id="mainBody">
	<!-- 툴바(네비게이션 바) -->
	<div class="container">
		<!-- nav: 네비게이션 시작을 알리는 태그. navbar navbar-default: 배경 색상과 테두리 지정해 주는 역할
		navbar-fixed-top: 화면 상단에 고정 -->
		<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
			<div class="container-fluid">
				<!-- navbar-toggle: 화면 사이즈가 크면 안보임 -->
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target=".navbar-ex1-collpase">
						<span class="sr-only">toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
				</div> <!-- class="navbar-header -->
				
				<!-- navbar-collapse: 화면 사이즈가 작으면 안보임 -->
				<div class="collapse navbar-collapse navbar-right navbar-ex1-collpase">
					<button id="login" type="button" class="btn btn-default navbar-btn">로그인</button>
					<button id="logout" type="button" class="btn btn-default navbar-btn">로그아웃</button>
					<button id="signup" type="button" class="btn btn-default navbar-btn">회원가입</button>
					<button id="userinfo" type="button" class="btn btn-default navbar-btn">회원정보</button>
				</div>
			</div>
		</nav>
	</div>
	
	<!-- 로고 있는 줄 -->
	<img id="logo" alt="로고" src="images/logo.PNG" style="width: 100px; height: 100px; margin-left: 10px">
	<div id="topMenu">
		<ul>
			<li><a href="gongji.dd" style="text-decoration: none;" id="product_info"class="snip1562">공지사항</a></li>
			<li><a href="index2.dd" style="text-decoration: none;" id="product_info"class="snip1562">상품정보</a></li>
			<li><a href="bestfood.dd" style="text-decoration: none;" id="product_info"class="snip1562">베스트 섭취 정보</a></li>
			<li><a href="chugaMoum.dd" style="text-decoration: none;" id="product_info"class="snip1562">내 섭취 정보</a></li>
			<li><a href="predict.dd" style="text-decoration: none;" id="product_info"class="snip1562">한 눈에 보기</a></li>
			<li><a href="qna.dd" style="text-decoration: none;" id="product_info"class="snip1562">Q&A</a></li>
		</ul>
	</div>
	
	<!-- 로고 아래 큰 화면 -->
	<div id="title">
		<header class="goodheader">안전한 먹거리 프로젝트</header>
		<hr id="titleBar1">
		<br>
		<br>
		<br>
		<hr id="titleBar2">
		<br>
		<div id="searchDiv" class="targetDiv" style="width: 844px; height: 70px">
			<form method="post" action="search.dd">
				<div class="targetDiv">
					<p>검색 조건</p>
					<select name="target">
						<option value="재료">재료</option>
						<option value="식품명">식품명</option>
						<option value="제조사">제조사</option>
					</select>
				</div>
				<div class="targetDiv">
					<p>검색 단어</p>
					<input id="textInput" type="text" name="word">
				</div>
				<div class="targetDiv">
					<button id="searchBtn" class="classname">검색</button>
				</div>
			</form>
		</div>
	</div>
	
	<br>
	<div id="mainContent">
		<%
			String check = "";
			try{
				check = (String)session.getAttribute("login");
			}catch(Exception e){
				session.setAttribute("login", null);
			}
			if(check!=null &&check.equals("no")){
		%>
				<script type="text/javascript">
					alert("아이디 또는 비밀번호를 확인해 주세요!!")
					$('#mainContent').load("html/login.html")
					$('#mainContent').css("height","800px")
					// 로그인 안됐으니 그대로
					$('#userinfo').css("display","none")
					$('#logout').css("display","none")
				</script>
		<%
				session.setAttribute("login", null);
			}else{
				try{
					check = (String)session.getAttribute("signUpFail");
				}catch(Exception e){
					session.setAttribute("signUpFail", "");
				}
				
				// 가입이 실패 했냐
				if(check.equals("yes")){
			%>
					<script type="text/javascript">
						alert("필수 정보 부족 또는 이미 있는 아이디 입니다.")
						$('#mainContent').load("html/signup.html")
						$('#mainContent').css("height","800px")
					</script>
			<%
					session.setAttribute("signUpFail", "");
						}else{
					// 가입이 실패 안했냐.
					if(check.equals("no")){
					%>
						<script type="text/javascript">
							alert("가입 성공.")
						</script>
					
					<% 
					}
					session.setAttribute("signUpFail", "");
					
					check = (String)session.getAttribute("signUpDateFail");
					if(check.equals("yes")){
						
			%>
					<script type="text/javascript">
						alert("필수 정보를 입력해 주세요")
						$('#mainContent').load("jsp/signup2.jsp")
						$('#mainContent').css("height","800px")
					</script>
			<%
					session.setAttribute("signUpDateFail", "");
					}else{ %>
					
		<%
			session.setAttribute("signUpDateFail", "");
			Customer c = (Customer)session.getAttribute("c");
 			try{
				check = (String)session.getAttribute("login");
			}catch(Exception e){
				session.setAttribute("c",null);
				c = null;
			}
 			if(check==null){
 				c = null;
 			}
 			
			List<Food> list = (List<Food>)session.getAttribute("foods");
			for(Food t: list){
		%>
		             <%
		             	if(c== null){
		             		//로그인 안되어이씀
		             		session.setAttribute("hihihi","hi");
		             %>
		             	<script type="text/javascript">
		             		location.href = "main.dd";
		             	</script>
		             
		             <%}else{ %>
		           
		           
			          
		             <%
		             // 해당 음식이 있따면!
		             	if(c.getFoodcodes().contains(t.getCode())){
             		 %>
             		 	<script type="text/javascript">
             				header.push('<%=t.getName()%>')
             				carbohydrate.push(<%=t.getCarbo()%>);
             				protein.push(<%=t.getProtein()%>);
             				fat.push(<%=t.getFat()%>);
             				sugars.push(<%=t.getSugar()%>);
             				natrium.push(<%=t.getNatrium()%>/100);
             				cholesterol.push(<%=t.getChole()%>);
             				fatty_acid.push(<%=t.getFattyacid()%>);
             				trans_fat.push(<%=t.getTransfat()%>);
           				</script>
	             	<% }
		             }%>

		             
		<%			}
				}
			}
					
			%>
			
		<script type="text/javascript">
		 	google.charts.load('current', {'packages':['bar']});
			google.charts.setOnLoadCallback(drawChart);
		    function drawChart() {
		    	data.push(header);
		        data.push(carbohydrate);
		        data.push(protein);
		        data.push(fat);
		        data.push(sugars);
		        data.push(natrium);
		        data.push(cholesterol);
		        data.push(fatty_acid);
		        data.push(trans_fat);
		        var chart2 = google.visualization.arrayToDataTable(data);
		        var options = {
				          chart: {
				            title: ''
				          },
				          //bars: 'vertical',
				          bars: 'horizontal',
				          vAxis: {format: 'decimal',textStyle: { color: '#000000',fontSize:16 }},
				          height: 1000,
				          slices:[{color : 'black'}],
				          backgroundColor : '#DDEFBB',
				          hAxis: {
				        	  textStyle: { color: '#000000',fontSize: 16 },
				          		gridlines : {color : '#333333'} 
			              },
			              lengend:{
			            	  textStyle: { color: '#000000',fontSize: 16 }
			              }
				        };
		
				        var chart = new google.charts.Bar(document.getElementById('chart_div'));
		
				        chart.draw(chart2, google.charts.Bar.convertOptions(options));
		

		    }
		</script>
		<%}%>
		
		<div style="font-size: 30px; font-weight: bold;">섭취 음식 영양소 비교</div>
        <div id="chart_div"></div>
	
	</div>	

	<footer>
		<header><h3>Contact</h3></header>
		<ul>
			<li>Tel: 123-456</li>
			<li>E-Mail: Saffy@Saffy.com</li>
		</ul>
	</footer>
</body>
</html>