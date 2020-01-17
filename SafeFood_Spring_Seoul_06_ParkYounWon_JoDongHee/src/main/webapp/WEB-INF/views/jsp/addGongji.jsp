<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.ssafy.vo.Customer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://unpkg.com/vue"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.18.0/axios.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<style type="text/css">
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
</head>
<body>
	<div id="NN">
		<form method="post" @submit.prevent="addGongji">
			<font style="font-size: 30px;">제목</font> <br>
			<input type="text" style="width: 200px;" name = "title" v-model='title' ><br><font style="font-size: 30px;">내용</font> <br>
			<textarea rows="10" cols="30" style="width: 220px; height: 300px;" name="contents" v-model="contents"></textarea><br>
			<input type="submit" value="등록" class="classname">
		</form>
	</div>

	<script type="text/javascript">
		new Vue({
			el : '#NN',
			data () {
				return {
					loading : true,
					errored : false,
					num : 0,
					title : '',
					writer : '',
					contents : '',
					day :'',
					id : ''
				}
			},
			methods:{
				addGongji(){
					if(this.title ==''){alert('제목를 입력하세요'); return;}
					if(this.contents ==''){alert('내용을 입력하세요'); return;}
					
					axios.post('addg.json',{
						num : this.num,
						title : this.title,
						writer : this.writer,
						id :  this.id,
						day :  this.day,
						contents : this.contents
					})
					.then(response=>{
						
					})
					.catch(error =>{
						console.log(error)
						this.errored = true
					})
					.finally(()=> this.loading = false)
					
					location.href="gongji.dd";
				}
			}
		});
	</script>
</body>
</html>