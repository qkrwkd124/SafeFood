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
<script src="https://unpkg.com/vue"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.18.0/axios.js"></script>
<script type="text/javascript">
	$('document').ready(function () {
		$('#mainContent').css("height","6500px");
		$('#login').click(function () {
			$('#mainContent').load("html/login.html")
			$('#mainContent').css("height","400px")
		})
	
		// 제품 상세 정보
		$('.hi').click(function () {
			$('#mainContent').load("detail.dd?num="+$(this).attr("name"))
			$('#mainContent').css("height","1500px")
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
		// 네이버 추가
		$('#addNaver').click(function(){
			<%
				if(session.getAttribute("c")==null){
			%>
				alert('로그인 하셔야합니다.')
				$('#mainContent').load('html/login.html')
			<%
				}else{
			%>
				$('#mainContent').load("addnaver.dd")
				$('#mainContent').css("height","800px")
			<%}%>
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
	
	#anserCommit{
		color : white;
		border-radius: 10px;
background: #0052D4;  /* fallback for old browsers */
background: -webkit-linear-gradient(to left, #6FB1FC, #4364F7, #0052D4);  /* Chrome 10-25, Safari 5.1-6 */
background: linear-gradient(to left, #6FB1FC, #4364F7, #0052D4); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */


		width : 9%;
	}
	#anserNoCommit{
		color : white;
		border-radius: 10px;
background: #e52d27;  /* fallback for old browsers */
background: -webkit-linear-gradient(to left, #b31217, #e52d27);  /* Chrome 10-25, Safari 5.1-6 */
background: linear-gradient(to right, #b31217, #e52d27); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
		width : 9%;
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
<div id="total">
	<div id="title">
		<header class="goodheader">안전한 먹거리 프로젝트 게시판</header>
		<hr id="titleBar1">
		<br>
		<br>
		<br>
		<hr id="titleBar2">
		<br>
		<div id="searchDiv" class="targetDiv" style="width: 844px; height: 70px">
				<div class="targetDiv">
					<p>검색 조건</p>
					<select name="target" v-model="find">
						<option value="title">제목</option>
						<option value="content">내용</option>
						<option value="writer">글쓴이</option>
					</select>
				</div>
				<div class="targetDiv">
					<p>검색 단어</p>
					<input id="textInput" type="text" name="word" v-model="content">
				</div>
				<!-- <div class="targetDiv">
					<button id="searchBtn">검색</button>
				</div> -->
		</div>
	</div>
	
	<br>
		<div id="mainContent">
			<button style="margin-left: 90%; margin-bottom: 20px" id="addNaver" class="classname">글쓰기</button>
			<br>
			<table class="table-hover">
				<tr style="font-size: 20px;">
					<td width=50px" align="center">번호</td>
					<td width="700px" align="center">제목</td>
					<td width="150px" align="center">글쓴이</td>
					<td width="150px" align="center">날짜</td>
					<td width="150px" align="center">답변상태</td>
				</tr>
				<tr>
					<td width= "1000px" colspan="5" bgcolor="hotpink" height="3px"></td> 
				</tr>
				<template v-if="find=='title'">
		 			<template v-for="naver in info" v-if="naver.title.includes(content)">
					<tr  style="font-size: 17px;" >
						<td align="center">{{naver.num }}</td>
						<td align="center"><a :href='"naverdetail.dd?num="+naver.num+"&writer="+naver.writer'>{{naver.title }}</a></td>
						<td align="center">{{naver.writer }}</td>
						<td align="center">{{naver.day}}</td>
						<td v-if="comm.includes(naver.num)" id="anserCommit">답변완료</td>
						<td v-else id="anserNoCommit">답변대기</td>
					</tr>
					<div style="margin-bottom :2px;"></div>
					<td width= "1000px" colspan="5" bgcolor="gray" height="1px"></td> 
					<div style="margin-bottom :2px;"></div>
					</template>
				</template>
				<template v-if="find=='content'">
	 				<template v-for="naver in info" v-if="naver.contents.includes(content)">
					<tr  style="font-size: 17px;">
						<td align="center">{{naver.num }}</td>
						<td align="center"><a :href='"naverdetail.dd?num="+naver.num+"&writer="+naver.writer'>{{naver.title }}</a></td>
						<td align="center">{{naver.writer }}</td>
						<td align="center">{{naver.day}}</td>
						<td v-if="comm.includes(naver.num)" id="anserCommit">답변완료</td>
						<td v-else id="anserNoCommit">답변대기</td>
					</tr>
					<hr>
					</template>
				</template>
				<template v-if="find=='writer'">
	 				<template v-for="naver in info" v-if="naver.writer.includes(content)">
					<tr  style="font-size: 17px;">
						<td align="center">{{naver.num }}</td>
						<td align="center"><a :href='"naverdetail.dd?num="+naver.num+"&writer="+naver.writer'>{{naver.title }}</a></td>
						<td align="center">{{naver.writer }}</td>
						<td align="center">{{naver.day}}</td>
						<td v-if="comm.includes(naver.num)" id="anserCommit">답변완료</td>
						<td v-else id="anserNoCommit">답변대기</td>
					</tr>
					<br>
					</template>
				</template>
				<tr>
				</tr>
			</table>
			
			<%
				String hi = "";
				hi = (String)session.getAttribute("hihihi");
				if(hi!=null && hi.equals("hi")){
					
			%>
					<script type="text/javascript">
						alert("로그인 후 볼 수 있습니다.")
					</script>
			<%
					session.setAttribute("hihihi", "");
				}
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
							$('#mainContent').load("signup2.dd")
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
			%>
			 
			<% }}}%>
	
		</div>
	</div>
	
	<footer>
		<header><h3>Contact</h3></header>
		<ul>
			<li>Tel: 123-456</li>
			<li>E-Mail: Saffy@Saffy.com</li>
		</ul>
	</footer>
	
	<script type="text/javascript">
		var first = new Vue({
			el : '#total',
			data() {
				return{
				num : -1,
				info : [],
				comm : [],
				find : 'title',
				content : '',
				loading : true,
				errored	: false
				}
			},
			mounted() {
				axios.get('list.json')
				.then(response=>{
					this.info = response.data
				})
				.catch(error=>{
					console.log(error)
					this.errored = true
				})
				.finally(()=> this.loading = false)
				
				axios.get('commentList2.json')
					.then(response=>{
						this.comm = response.data	
					})
					.catch(error=>{
						console.log(error)
						this.errored = true
					})
					.finally(()=> this.loading = false)
			}
		});
		</script>
</body>
</html>