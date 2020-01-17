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
<script src='https://code.jquery.com/jquery-2.2.4.min.js'></script>
<script type="text/javascript">
$('document').ready(function () {
	$('#mainContent').css("height","2500px");
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
	
	$(".hover").mouseleave(
				  function () {
				    $(this).removeClass("hover");
				  }
				);
	
	var max = 600; //100% 투명할때의 스크롤 값
	var t = 420;
	$(window).scroll(function(){
		var scrollPX = $(this).scrollTop();
		var rgbaCol = 'rgba('+0+','+0+','+0+','+(1.3-((t)/420))+')';
		t = scrollPX-max;
		if(t<0) t*=-1;
		if(scrollPX<max){
			$("body").css('background-color',rgbaCol);
		}else{
			$("body").css('background-color',rgbaCol);
		}
	});
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
	
	/* 이벤트 적용 */
	@-webkit-keyframes sparkle {
	  from {
	    background-position: 0% 100%;
	  }
	  to {
	    background-position: 200% 100%;
	  }
	}
	
	@keyframes sparkle {
	  from {
	    background-position: 0% 100%;
	  }
	  to {
	    background-position: 200% 100%;
	  }
	}
	.test {
	  background: white;
	  display: inline-block;
	  padding: 1em;
	  font-family: Helvetica Neue;
	  border-radius: 4px;
	  position: relative;
	}
	.test:before {
	  -webkit-animation: sparkle 4s infinite linear;
	          animation: sparkle 4s infinite linear;
	  background: linear-gradient(90deg, #7FEFBD 0%, #FFF689 11%, #EC0B43 22%, #7FEFBD 33%, #FFF689 44%, #EC0B43 55%, #7FEFBD 66%, #FFF689 77%, #EC0B43 88%, #7FEFBD 100%);
	  background-size: 300% 100%;
	  content: '';
	  position: absolute;
	  left: 0;
	  top: 0;
	  width: 100%;
	  height: 100%;
	  border-radius: 4px;
	  -webkit-filter: blur(3px);
	          filter: blur(3px);
	   z-index: -1;
	  -webkit-transform: scale(0.99) translateY(3px);
	          transform: scale(0.99) translateY(3px);
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
		<br>

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
 			
		%>
		<div id = "best">
			<template v-for="(best,index) in info">
     		         <div class="pdlist col-md-12 test" style="z-index:1; margin-bottom:20px; border-radius: 20px; border: solid rgba(255, 0, 0, 0.0) 3px;" onmouseover="this.style.border='3px solid rgba(255, 0, 0, 0.8)';"
			 			onmouseleave="this.style.border='3px solid rgba(255, 0, 0, 0.0)';" v-if="index == 0">
			 			<img src="images/best1.png">
			             <div class="hi" style="padding:10px" :name='best.code'>
				             
				             <!--  <a href="detail_info.html"></a>-->
					             <div :id="best.code">
					             	<img style="width:300px; height:300px;" :src="best.img">
					             </div>
					             <div class="caption"></div>
					             <div style="text-align: center;font-family: 'Stylish', sans-serif; font-size: 50px; font-weight: bold;" :id="best.code" :value="best.name">{{best.name}}</div>
             			</div>
	      			</div>
     		         <div class="pdlist col-md-6" style="border-radius: 20px; border: solid rgba(255, 0, 0, 0.0) 3px;" onmouseover="this.style.border='3px solid rgba(255, 0, 0, 0.8)';"
			 			onmouseleave="this.style.border='3px solid rgba(255, 0, 0, 0.0)';" v-else-if="index == 1">
			 			<img src="images/best2.png" style="width:300px; height:150px;">
			             <div class="hi" style="padding:10px" :name='best.code'>
				             <!--  <a href="detail_info.html"></a>-->
					             <div :id="best.code">
					             	<img style="width:300px; height:300px;" :src="best.img">
					             </div>
					             <div class="caption"></div>
					             <h3 style="text-align: center" :id="best.code" :value="best.name">{{best.name}}</h3>
             			</div>
	      			</div>
     		         <div class="pdlist col-md-6" style="border-radius: 20px; border: solid rgba(255, 0, 0, 0.0) 3px;" onmouseover="this.style.border='3px solid rgba(255, 0, 0, 0.8)';"
			 			onmouseleave="this.style.border='3px solid rgba(255, 0, 0, 0.0)';" v-else-if="index == 2">
			 			<img src="images/best3.png" style="width:300px; height:150px;">
			             <div class="hi" style="padding:10px" :name='best.code'>
				             <!--  <a href="detail_info.html"></a>-->
					             <div :id="best.code">
					             	<img style="width:300px; height:300px;" :src="best.img">
					             </div>
					             <div class="caption"></div>
					             <h3 style="text-align: center" :id="best.code" :value="best.name">{{best.name}}</h3>
             			</div>
	      			</div>
     		         <div class="pdlist col-md-4" style="border-radius: 20px; border: solid rgba(255, 0, 0, 0.0) 3px;" onmouseover="this.style.border='3px solid rgba(255, 0, 0, 0.8)';"
			 			onmouseleave="this.style.border='3px solid rgba(255, 0, 0, 0.0)';" v-else>
			             <div class="hi" style="padding:10px" :name='best.code'>
				             
				             <!--  <a href="detail_info.html"></a>-->
					             <div :id="best.code">
					             	<img style="width:300px; height:300px;" :src="best.img">
					             </div>
					             <div class="caption"></div>
					             <h3 style="text-align: center" :id="best.code" :value="best.name">{{best.name}}</h3>
             			</div>
	      			</div>
				</template>
				<img id="bb" src="images/best1.png" style="position:fixed; width: 50px; height: 50px; z-index: 10;"/>
				<img id="aa" :src="img" style="position:fixed; width: 50px; height: 50px; z-index: 10;"/>
			</div>
		<%}}} %>
	</div>
	
	<footer style="z-index: 2;">
		<header><h3>Contact</h3></header>
		<ul>
			<li>Tel: 123-456</li>
			<li>E-Mail: Saffy@Saffy.com</li>
		</ul>
	</footer>
	<script>
		$(function(){
		  $(document).mousemove(function(e) {
		      mouseX = e.pageX;
		      mouseY = e.pageY;
		      $('#aa').css("left", e.clientX+"px").css("top", e.clientY-50);
		      $('#bb').css("left", e.clientX-50+"px").css("top", e.clientY-50);
		 });
		});
	</script>

	<script type="text/javascript">
		new Vue({
			el : '#best',
			data(){
				return{
					info :[],
					loading : true,
					errored : false,
					count : 0,
					img : ''
				}
			},
			mounted() {
				axios.get('best.json')
				.then(response=>{
					this.info = response.data
				})
				.catch(error=>{
						console.log(error)
						this.errored = true
					})
				.finally(()=>{
					this.loading = false;
					this.img = this.info[0].img
					});
			},
			computed :{
				check : function(){
					if(this.info.data < 3){
						this.count = this.count+1
						alert(this.count)
						return true
					}else{
						return false
					}
				}
			}
		});
	
	</script>
</body>
</html>