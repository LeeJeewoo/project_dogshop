<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../resources/css/loginpage.css" rel="stylesheet">
<!-- 합쳐지고 최소화된 최신 CSS -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
부가적인 테마
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css"> -->
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<script type="text/javascript">

	$(document).ready(function() {
		
		
		$(".submit").on("click", function() {
			
			if ($("#userId").val() == "") {
				alert("아이디를 입력해주세요.");
				$("#userId").focus();
				return false;
			}
			
			if ($("#userName").val() == "") {
				alert("이름을 입력해주세요.");
				$("#userName").focus();
				return false;
			}
			
			if ($("#userTel").val() == "") {
				alert("연락처를 입력해주세요.");
				$("#userTel").focus();
				return false;
			}
			
		})
		
	})
	
	function fn_infoChk(){
			$.ajax({
				url : "/member/searchPw",
				type : "post",
				dataType : "json",
				data : {"userId" : $("#userId").val(),
						"userName" : $("#userName").val(),
						"userTel" : $("#userTel").val()
					   },
				success : function(data){
					if(data == 1){
						popup();
					}else if(data == 0){
						alert("회원정보가 일치하지 않습니다.");
					}
				}
			})
	}
	
	function popup(){
		var userId = $("#userId").val();
        var url = "/member/popup_pass?userId="+userId;
        var name = "비밀번호 변경";
        var option = "width = 500, height = 500, top = 100, left = 200, location = no"
        window.open(url, name, option);
    }
	

</script>

<body>
<%@include file="/WEB-INF/views/header.jsp" %>
<!-- ################################################################################################################################################# -->
<div id="content1">
		<div class="c1">
			<center>
				<button type ="button" class="button3" id="search_id" onclick = "location.href='/member/searchId'">아이디찾기</button>
				<button type="button" class="button4" id="search_pw" onclick = "location.href='/member/searchPw'">비밀번호찾기</button>
			</center>

			<form id="loginForm" action="/member/login" method="post">
				<table align="center">
					<tr>
						<td class="title1">아이디</td>
						<td class="content1"><input type="text" maxlength="5" name="userName" id="userId"></td>
					</tr>
					
					
					<tr>
						<td class="title1">이름</td>
						<td class="content1"><input type="text" maxlength="5" name="userName" id="userName"></td>
					</tr>
					<tr>
						<td class="title1">연락처</td>
						<td class="content1"><input type="text" name="userTel" id="userTel" placeholder="-를 제외하고 입력해주세요." maxlength="11"></td>
					</tr>
					
										
					
				</table>
				
				<br>
				<center>
						<input type="button" class ="button2" onclick="fn_infoChk()" value="확인" id="submit">
						
					 <br> 
					
				</center>
				<br>
			</form>
		</div>
	</div>



<!-- ################################################################################################################################################# -->


<!-- <div align="center">
<button type = "button" id= "search_id" onclick = "location.href='/member/searchId'" name="search_id" >아이디찾기</button>
<button type="button" id ="search_pw" onclick = "location.href='/member/searchPw'"name="search_pw">비밀번호찾기</button>
</div>
<form method="post" name="searchPw">



		<table align="center"border=1>
			<tr height="30">
				<td width="80">아이디</td>
				<td width="200"><input type="text" maxlength="15"
					style="width: 100px" name="userId" id="userId"></td>
			</tr>
			
			<tr height="30">
				<td width="80">이름</td>
				<td width="200"><input type="text" maxlength="5"
					style="width: 100px" name="userName" id="userName"></td>
			</tr>
			

			<tr height="30">
				<td width="80">연락처</td>
				<td><input type="text" name="userTel" id="userTel" placeholder="-를 제외하고 입력해주세요." maxlength="11">
				</td>
			</tr>



			</tr>
			<tr>
				<td align="center" colspan=2><input type="button" onclick="fn_infoChk()" value="확인" id="submit"></td>
			</tr>




		</table>
	</form>	 -->
	<!-- ################################################################################################################################################# -->
	
	
<%@include file="/WEB-INF/views/footer.jsp" %>

</body>
</html>