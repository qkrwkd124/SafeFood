<%@page import="com.ssafy.vo.Customer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 부트 스트랩 사용 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

<style type="text/css">


.layer .content_box {
	clear:left;
	width: 1100px;
	height: 1000px;
	vertical-align: middle;
}

.layer .content_box .content {
	width: 647px;
	height: 700px;
	display: inline-block;
	vertical-align: middle;
	text-align: left;
}

.layer .blank {
	display: inline-block;
	height: 100%;
	vertical-align: middle;
}
.content h2{
	text-align: left;
	margin-left: 20px;
	margin-top: 20px;
}
input {
	width: 250px;
	height: 20px;
	font-size: 20px;
}
.fooormm div{
	margin-top : 30px;
	margin-left: 100px;
	width: 100px;
}

.fooormm label{
	font-weight: bold;
	margin-bottom: 5px;
}
.fooormm div span{
	width: 400px;
}
.cinput{
	margin-left: 20px;
	margin-right: 10px;
}
.fooormm div span #text{
	margin-right: 20px;
}

.button{
	height: 80px;
    width: 400px;
    margin-top: 50px;
    text-align: center;
}
.dinput{
	height: 40px;
}
	a{
		color : black;
	}

</style>
</head>
<body id="signup2Body">
	<div class="layer">
		<span class="content_box"> <span class="content">
		<%
			Customer c = (Customer)session.getAttribute("c");
		%>
				<h2>회원 정보 수정</h2>
				<form class="fooormm" action="update.dd" method="post">
					<input type="hidden" id="id" 
							class="dinput" name="upuser_id" value="<%=c.getId()%>"/>
					<div>
						<label for="id">아이디 *</label><br> <input type="text" id="tid" disabled="disabled"
							class="dinput" name="upuser_id" value="<%=c.getId()%>"/>
					</div>
					<div>
						<label for="pass">비밀번호 *</label> <input type="password" id="pass"
							class="dinput" name="upuser_pass" />
					</div>
					<div>
						<label for="name">이름 *</label> <input type="text" id="name"
							class="dinput" name="upuser_name" value="<%=c.getName()%>"/>
					</div>
					<div>
						<label for="adress">주소 </label> <input type="text" id="address"
							class="dinput" name="upuser_address" value="<%=c.getAddress()%>"/>
					</div>
					<div>
						<label for="phone">전화번호</label>
						<input class="dinput" type="text" id="phone" name="upphone" value="<%=c.getPhone()%>">
					</div>
					<div id="alregi">
						<p style="font-weight: bold;">알레르기 *</p>
						<span style="display: inline-flex;">
							<input class="cinput" style="width:20px" type="checkbox" name="upalergy1" value="대두">대두
							<input class="cinput" style="width:20px" type="checkbox" name="upalergy2" value="땅콩">땅콩
							<input class="cinput" style="width:20px" type="checkbox" name="upalergy3" value="우유">우유
							<input class="cinput" style="width:20px" type="checkbox" name="upalergy4" value="게">게
						</span>
						<span style="display: inline-flex;">
							<input class="cinput" style="width:20px" type="checkbox" name="upalergy5" value="새우">새우
							<input class="cinput" style="width:20px" type="checkbox" name="upalergy6" value="참치">참치
							<input class="cinput" style="width:20px" type="checkbox" name="upalergy7" value="연어">연어
							<input class="cinput" style="width:20px" type="checkbox" name="upalergy8" value="쑥">쑥
						</span>
						
						<%
								for(String allergy: c.getAllergys()){
						%>
									<script type="text/javascript">
										$("input[value='<%=allergy%>']").prop('checked', true);
									</script>
						<%	
								}
						%>
				</form>
						<span style="display: inline-flex;">
							<button id="okBtn" style="width:100px; height: 40px" type="submit" class="btn btn-default">수정 완료 </button>
							<div style="width: 20px; margin: 0px 0px;"></div>
							<a href="#" id="goodBytbtn" style="width:100px; type="button" height: 40px" class="btn btn-default">탈퇴 하기 </a>
						</span>

		</span>
		</span>
	</div>
</body>
</html>