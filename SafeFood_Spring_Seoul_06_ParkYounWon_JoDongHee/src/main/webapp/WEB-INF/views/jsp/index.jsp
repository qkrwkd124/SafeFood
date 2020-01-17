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
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css?family=Stylish&amp;subset=korean" rel="stylesheet">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script src="https://unpkg.com/vue"></script>
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
		
		$('.codeBtn').click(function () {
			//alert(this.attr('value'))
			$(this).html('<i class="fa fa-heart" aria-hidden="true"></i> 찜');
		    $(this).children('.fa-heart').addClass('animate-like');
			var t = $(this).attr('value');
			$(this).removeClass('codeBtn');
			$.ajax({
			    url: "chuga.dd", // 클라이언트가 요청을 보낼 서버의 URL 주소
			    data: { code: t },              		  // HTTP 요청과 함께 서버로 보낼 데이터
			    type: "GET"                             // HTTP 요청 방식(GET, POST)
			})
			var event = window.event;
			if(event.stopPropagation()){
				event.stopPropagation();
			}
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
<!-- 하트(찜하기) -->
<!--  <script src="https://use.fontawesome.com/7ad89d9866.js"></script>-->
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
		/*  background-color: #ccc;*/
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
				font-size: 20px;
/* 				padding-left: 30px; */
/* 				padding-right: 50px; */
/* 				padding-top: 10px; */
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
.goodheader{
font-size : 50px;
}

	
	/* 이벤트 관련 */
	.btn-secondary {
		display: block;
		margin: 40px auto 0px;
		text-align: center;
		background: #ed2553;
		border-radius: 3px;
		box-shadow: 0 10px 20px -8px rgb(240, 75, 113);
		padding: 10px 17px;
		font-size: 18px;
		cursor: pointer;
		border: none;
		outline: none;
		color: #ffffff;
		text-decoration: none;
		-webkit-transition: 0.3s ease;
		transition: 0.3s ease;
	}
	
	.btn-secondary:hover {
		transform: translateY(-3px);
	}
	
	.btn-secondary .fa {
		margin-right: 5px;
	}
	
	.animate-like {
		animation-name: likeAnimation;
		animation-iteration-count: 1;
		animation-fill-mode: forwards;
		animation-duration: 0.65s;
	}
	
	@keyframes likeAnimation { 
		0% {transform: scale(30);}
		100%{transform :scale(1);}
	}
	
	
	/* 마우스 이벤트 */
	/*
	* core styles
	*/
	
	.sm-link{
	    --uismLinkDisplay: var(--smLinkDisplay, inline-flex);   
	    --uismLinkTextColor: var(--smLinkTextColor);
	    --uismLinkTextColorHover: var(--smLinkTextColorHover);  
	    
	    display: var(--uismLinkDisplay);
	    color: var(--uismLinkTextColor);
	    position: relative;
	    overflow: hidden;
	}
	
	a.sm-link{
	    text-decoration: none;
	}
	
	.sm-link__label{
	  display: block;
	}
	
	/* sm-link_padding-all */ 
	
	.sm-link_padding-all{
	    --uismLinkLineWeight: var(--smLinkLineWeight, 2px);
	    --uismLinkLineColor: var(--smLinkLineColor, #000);
	    --uismLinkPadding: var(--smLinkPadding, 5px);
	    
	    padding: var(--uismLinkPadding);
	}
	
	.sm-link_padding-all::before, 
	.sm-link_padding-all::after{
	  width: 100%;
	  height: var(--uismLinkLineWeight);
	  left: 0;
	}
	
	.sm-link_padding-all::before{
	  top: 0;
	}
	
	.sm-link_padding-all::after{
	  bottom: 0;
	}
	
	.sm-link_padding-all .sm-link__label::before,
	.sm-link_padding-all .sm-link__label::after{
	  width: var(--uismLinkLineWeight);
	  height: 100%;
	  top: 0;
	}
	
	.sm-link_padding-all .sm-link__label::before{
	  left: 0;
	}
	
	.sm-link_padding-all .sm-link__label::after{
	  right: 0;
	}
	
	.sm-link_padding-all::before,
	.sm-link_padding-all::after,
	.sm-link_padding-all .sm-link__label::before,
	.sm-link_padding-all .sm-link__label::after{
	  content: "";     
	    background-color: var(--uismLinkLineColor);
	  position: absolute; 
	    opacity: 0;
	    
	    will-change: transform, opacity;
	    transition-property: transform, opacity;
	}
	
	.sm-link_padding-all:hover::before,
	.sm-link_padding-all:hover::after,
	.sm-link_padding-all:hover .sm-link__label::before,
	.sm-link_padding-all:hover .sm-link__label::after{
	    opacity: 1;
	}
	
	/* sm-link_padding-bottom */ 
	
	.sm-link_padding-bottom{
	    --uismLinkLineWeight: var(--smLinkLineWeight, 2px);
	    --uismLinkLineColor: var(--smLinkLineColor, #000);  
	    
	    padding-bottom: var(--uismLinkLineWeight);  
	    position: relative;
	}
	
	.sm-link_padding-bottom::after{
	  content: "";
	  width: 100%;
	  height: var(--uismLinkLineWeight);
	    background-color: var(--uismLinkLineColor);
	    
	  position: absolute;
	  left: 0;
	  bottom: 0;
	}
	
	/* sm-link_bg */ 
	
	.sm-link_bg {
	    --uismLinkLineColor: var(--smLinkLineColor, #000);  
	    --uismLinkTextColorHover: var(--smLinkTextColorHover, #fff);    
	    --uismLinkPadding: var(--smLinkPadding, 5px);
	    
	    padding: var(--uismLinkPadding);
	    transition: color .3s ease-out;
	}
	
	.sm-link_bg::before, 
	.sm-link_bg::after{
	  content: "";
	    background-color: var(--uismLinkLineColor); 
	  opacity: 0;
	  position: absolute;
	    
	    transition: transform .2s ease-out, opacity .2s ease-out .03s;
	}
	
	.sm-link_bg .sm-link__label{
	  position: relative;
	  z-index: 2;
	}
	
	.sm-link_bg:hover::before, 
	.sm-link_bg:hover::after{
	  opacity: 1;
	    transition-duration: .35s, .35s;
	    transition-delay: 0s, 0s;
	}
	
	.sm-link_bg:hover{
	    color: var(--uismLinkTextColorHover);
	}
	
	/* sm-link_text */ 
	
	.sm-link_text::before{
	  content: attr(data-sm-link-text);
	    color: var(--uismLinkTextColorHover);
	  position: absolute;
	}
	
	.sm-link_text::before, 
	.sm-link_text .sm-link__label{
	  transition-property: transform;
	    transition-timing-function: cubic-bezier(.86, .6, .08, 1.01); 
	    transition-duration: .3s;
	}
	
	.sm-link_text:hover::before,
	.sm-link_text:hover .sm-link__label{
	    transition-duration: .4s;
	}
	
	/* effect 1 */
	
	.sm-link1::before{
	  transform: translate3d(-105%, 0, 0);
	}
	
	.sm-link1::after{
	  transform: translate3d(105%, 0, 0);
	}
	
	.sm-link1 .sm-link__label::before{
	  transform: translate3d(0%, -100%, 0);
	}
	
	.sm-link1 .sm-link__label::after{
	  transform: translate3d(0%, 100%, 0);
	}
	
	.sm-link1::before,
	.sm-link1::after,
	.sm-link1 .sm-link__label::before,
	.sm-link1 .sm-link__label::after{
	    transition-timing-function: ease-out;
	    transition-duration: .2s, .15s;
	    transition-delay: 0s, .15s;
	}
	
	.sm-link1:hover::before,
	.sm-link1:hover::after,
	.sm-link1:hover .sm-link__label::before,
	.sm-link1:hover .sm-link__label::after{
	  transform: translate3d(0, 0, 0);
	    opacity: 1;
	    
	    transition-duration: .25s;
	    transition-delay: 0s;
	}
	
	/*
	SETTINGS
	*/
	
	.sm-link{
	    --smLinkPadding: 10px 15px;
	    --smLinkLineWeight: 5px;
	    --smLinkLineColor: red;
	    --smLinkTextColor: #243aab;
	    --smLinkTextColorHover: #1b255a;
	}
	
	.sm-link_bg{
	    --smLinkTextColorHover: #fff;
	}
	
	
	
/* 상세정보 뜨게하기 */
	.snip1264 {
	  color: #fff;
	  position: relative;
	  overflow: hidden;
	  width: 500px;
	  height: 400px;
	  color: #000000;
	  text-align: center;
	  z-index: 4;
	}
	.snip1264 * {
	  -webkit-transition: all 0.6s ease;
	  transition: all 0.6s ease;
	}
	.snip1264 img {
	  max-width: 100%;
	  -webkit-transition: opacity 0.35s;
	  transition: opacity 0.35s;
	}
	.figcaption {
	  position: absolute;
	  top: 50%;
	  -webkit-transform: translateY(-50%);
	  transform: translateY(-50%);
	  width: 100%;
	  z-index: 1;
	}
	.snip1264 h2,
	.snip1264 p,
	.snip1264 hr,
	.snip1264 p button {
	  margin: 0;
	  left: 0;
	  opacity: 0;
	}
	.snip1264 h2 {
	  margin-right:50px;
	  padding: 0 30px;
	  display: inline-block;
	  font-weight: 400;
	  text-transform: uppercase;
	  bottom: 50%;
	  -webkit-transform: translateX(-100px);
	  transform: translateX(-100px);
	}
	.snip1264 h2 span {
	  font-weight: 400;
	}
	.snip1264 p {
	  top: 50%;
	  padding: 0 50px;
	  font-size: 0.8em;
	  font-weight: 500;
	  margin-right:50px;
	  -webkit-transform: translateX(-50px);
	  transform: translateX(-50px);
	}
	
	.snip1264:hover .downtoup{
	 -webkit-transform: translateY(-258px);
	 		transform: translateY(-258px);
	}
	
	
	.snip1264 .icons {
	  -webkit-transform: translateX(50px);
	  transform: translateX(50px);
	  opacity: 0;
	}
	.snip1264 i {
	  padding: 2px 5px;
	  display: inline-block;
	  font-size: 28px;
	  color: #000000;
	  opacity: 0.5;
	}
	.snip1264 i:hover {
	  opacity: 1;
	}
	.snip1264:hover img,
	.snip1264.hover img {
	  -webkit-filter: grayscale(100%);
	  filter: grayscale(100%);
	  opacity: 0.2;
	}
	.snip1264:hover h2,
	.snip1264.hover h2,
	.snip1264 hr,
	.snip1264:hover p,
	.snip1264.hover p,
	.snip1264 p button,
	.snip1264:hover .icons,
	.snip1264.hover .icons {
	  -webkit-transition-delay: 0.2s;
	  transition-delay: 0.2s;
	  -webkit-transform: translateX(0);
	  transform: translateX(0);
	}
	.snip1264:hover h2,
	.snip1264.hover h2,
	.snip1264 hr,
	.snip1264 p button,
	.snip1264:hover .icons,
	.snip1264.hover .icons {
	  opacity: 1;
	}
	.snip1264:hover p,
	.snip1264.hover p {
	  opacity: 0.7;
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
<!-- 			<li><button class="snip1575" value="Submit">Submit</button></li> -->
			<li><a href="gongji.dd" style="text-decoration: none;" id="product_info" class="snip1562">공지사항</a></li>
			<li><a href="index2.dd" style="text-decoration: none;" id="product_info" class="snip1562">상품정보</a></li>
			<li><a href="bestfood.dd" style="text-decoration: none;" id="product_info" class="snip1562">베스트 섭취 정보</a></li>
			<li><a href="chugaMoum.dd" style="text-decoration: none;" id="product_info" class="snip1562">내 섭취 정보</a></li>
			<li><a href="predict.dd" style="text-decoration: none;" id="product_info" class="snip1562">한 눈에 보기</a></li>
			<li><a href="qna.dd" style="text-decoration: none;" id="product_info" class="snip1562">Q&A</a></li>
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
<!-- 	<img id="aa" :src="img" style="position:fixed;border:1px solid black; width: 50px; height: 50px; z-index: 10;"/>-->
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
 			
			List<Food> list = (List<Food>)session.getAttribute("foods");
			for(Food t: list){
		%>
		 	<div class="sm-link sm-link_padding-all sm-link1 pdlist col-md-6 snip1264" style="align-content:center; border-radius: 20px; margin-left:35px; border: solid rgba(255, 0, 0, 0.0) 3px;">
             <div class="sm-link__label hi" style="padding:10px" name="<%=t.getCode()%>">
	             <!--  <a href="detail_info.html"></a>-->
	             	<img style="width:300px; height:300px; margin-left:70px;" src="<%=t.getImg()%>">
	             	<div class="downtoup" style="font-size: 30px; margin-left:70px;"><%= t.getName() %></div>
		             <div class="caption figcaption">
			             <h2 style="text-align: center"id="<%=t.getCode()%>n" value="<%=t.getName()%>"></h2>
			             <br>
			             <br>
			             <br>
			             <p style="display:inline-block; font-size: 13px; overflow:hidden; height:180px;"><%=t.getMaterial() %></p>
			             <%
			             	if(c== null){
			             		//로그인 안되어이씀
			             %>
			             <%}else{ %>
			             <%
			             	if(c.getFoodcodes().contains(t.getCode())){
	             		%>
	             			<p>
					             <!-- <a href="#" class="btn btn-primary" role="button" style="display: inline-block; margin-left: 0px;margin-right:20px;">상세보기</a> -->
					             <button class="btn-secondary like-review" style="margin:0 35%; width: 100px;">
									<i class="fa fa-heart" aria-hidden="true"></i> 찜
								</button>
				             </p>
		             	<% }else{%>
	          	   			<p>
	          	   				<button class="btn-secondary like-review codeBtn" style="margin:0 35%; width: 100px;" value="<%=t.getCode()%>">
									 찜 하기
								</button>
								<!--  -->
				             </p>
			             <%}} %>
		             </div>
	             </div>
             </div>
		<% }}}}%>
	
	</div>
	
	<footer style="z-index: 50;">
		<header><h3>Contact</h3></header>
		<ul>
			<li>Tel: 123-456</li>
			<li>E-Mail: Saffy@Saffy.com</li>
		</ul>
	</footer>
	<script type="text/javascript">
		new Vue({
			el : '#mainContent',
			data (){
				return{
					img : 'images/logo.PNG'
				}
			}
		});
	
	</script>
</body>
</html>