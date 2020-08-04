<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../resources/css/loginpage.css" rel="stylesheet">

</head>
<!-- <style>
 #content{
	float:left;
	width:100%; 
	min-height:700px;
}
#menu{
	float:left;
	width:100%;
	height:33px;
	margin:0;
	padding:0;
	background-color:white;
	border:0;
	border-bottom:1px solid #D9D9D9;
}
.menu1>li>a{
	display:block;
	padding: 8px 8px;
	color:black;
	font-size:9pt;
	letter-spacing:-1px;
	text-align:center;
	text-decoration:none;
}


#login_btn1{
	width : 270px;
	height : 50px;
	font-size : 25px;
	border: 1px solid;
	background-color : #747474; #8FAE48
	color: #FFFFFF; padding: 3px;
	border-top-left-radius: 3px; 
	border-bottom-left-radius: 3px;
	border-top-right-radius: 3px; 
	border-bottom-right-radius: 3px;
}
</style>
 -->
<script type="text/javascript">

function fn_infoChk(){
	$.ajax({
		url : "/member/passChk",
		type : "post",
		dataType : "json",
		data : {"userId" : $("#userId").val(),
				"userPass" : $("#userPass").val()},
		success : function(data){
			if(data == 1){
				$("#loginForm").submit();
			}else if(data == 0){
				alert("아이디 혹은 비밀번호를 잘못 입력하였습니다.");
			}
		}
		,error : function(data) {
			alert("아이디 혹은 비밀번호를 잘못 입력하였습니다.");
		}
	})
}

</script>

<body>
<%@include file="/WEB-INF/views/header.jsp" %>
<!-- #################################################################################################################################### -->
<!-- 새로운폼 -->
<br>
	<div id="content1">
		<div class="c1">
			<center>
				<h1>회원 로그인</h1>
			</center>

			<form id="loginForm" action="/member/login" method="post">
				<table align="center">
					<tr>
						<td class="title1">아이디</td>
						<td class="content1"><input placeholder="아이디를 입력해주세요"
							type="text" id="userId" name="userId"></td>
					</tr>
					<tr>
						<td class="title1">비밀번호</td>
						<td class="content1"><input placeholder="비밀번호를 입력해주세요"
							type="password" id="userPass" name="userPass"></td>
					</tr>
					
										
					
				</table>
				
				<br>
				<center>
						<input type="button" class="button2" onclick="fn_infoChk()" value="로그인"/>
					 <br> 
					<a href="/member/searchId" style="text-decoration: none; color: black;">아이디찾기</a>	&nbsp;|&nbsp; 
					<a href="/member/searchPw" style="text-decoration: none; color: black;">비밀번호찾기</a>&nbsp;|&nbsp; 
					<a href="/member/register" style="text-decoration: none; color: black;">회원가입</a>

				</center>
				<br>
			</form>
		</div>
	</div>


	<!-- #################################################################################################################################### -->
<!-- <div id="content">
	<h1 align="center">회원 로그인</h1>
	
	<form id="loginForm" action = "/member/login" method="post">
		<table border=0 align="center">
			<tr height = 30>
				<td width=50 align="center"><img src="./resources/icons/loginuser.png" border = 0 name = "loginuser"></td>
				<td colspan=2 width=150 ><input type="text" style="border:1;height:40px;width:265px" placeholder="아이디를 입력하세요" maxlength = "15" id ="userId" name = "userId"></td>
			</tr>
	
			<tr height = 30>
				<td width = 50 align="center"><img src="./resources/icons/loginpw.png"  border=0 name = "loginpw"></td>
				<td colspan=2 width = 150><input type="password"  style="border:1;height:40px;width:265px" maxlength = "15" placeholder="비밀번호를 입력하세요"  id="userPass" name = "userPass"></td> maxlength="10"
			</tr>
		
			<tr>
				<td colspan = 2><input type="button" onclick="fn_infoChk()" value = "로그인" id="login_btn1"></td>
			</tr>
				
			<tr>	
				<td colspan = 2><a href="/member/searchId" style="text-decoration:none;color:black;">아이디찾기</a>  &nbsp;|&nbsp; <a href="/member/searchPw"style="text-decoration:none; color:black;">비밀번호찾기</a> &nbsp;|&nbsp; <a href="/member/register"style="text-decoration:none;color:black;">회원가입</a></td>	
			</tr>	
		</table>
	</form>
</div> -->

<!-- #################################################################################################################################### -->
	
<%@include file="/WEB-INF/views/footer.jsp" %>
</body>
</html>