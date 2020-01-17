<%@page import="com.ssafy.vo.Naver"%>
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
</head>
<body>
	<div id="NN">
		<form method="post" @submit.prevent="upDateNaver">
			제목 <br>
			<input type="text" style="width: 200px;" name = "title" v-model='title' :value='title'><br> 내용 <br>
			<textarea rows="10" cols="30" style="width: 220px; height: 300px;" name="contents" v-model="contents"></textarea><br>
			<input type="submit" value="등록">
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
			mounted() {
				axios.get('oneg.json')
				.then(response=>{
					this.num = response.data.num,
					this.title = response.data.title,
					this.writer = response.data.writer,
					this.contents = response.data.contents,
					this.day = response.data.day,
					this.id = response.data.id
				})
				.catch(error=>{
					console.log(error)
					this.errored = true
				})
				.finally(()=> this.loading = false)
			},
			methods:{
				upDateNaver(){
					if(this.title ==''){alert('제목를 입력하세요'); return;}
					if(this.contents ==''){alert('내용을 입력하세요'); return;}
					
					axios.post('update2g.json',{
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