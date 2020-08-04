<%@page import="kr.co.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/loginpage.css">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">

$(document).ready(function() {

	$(".submit").on("click", function() {
				
		if ($("#userPass").val() == "") {
			alert("비밀번호를 입력해주세요.");
			$("#userPass").focus();
			return false;
		}
		
		
		
	});
	
	$(".cancle").on("click", function() {

			location.href = "/";

		});
	
	
	
	
})

function fn_infoChk(){
			$.ajax({
				url : "/member/passChk",
				type : "post",
				dataType : "json",
				data : {"userId" : $("#userId").val(),
						"userPass" : $("#userPass").val()},
				success : function(data){
					if(data == 1){
						$("#infoForm").submit();
					}else if(data == 0){
						alert("회원정보가 일치하지 않습니다.");
					}
				}
			})
	}

</script>

</head>
<!-- <style>
	#content{
	float:left;
	width:100%; 
	min-height:700px;
	}
	#button1{
	width : 135px;
	height : 40px;
	font-size : 15px;
	border 1px solid;
	background-color : #747474;/* #8FAE48 */
	color: #FFFFFF; padding: 3px;
	border-top-left-radius: 3px; 
	border-bottom-left-radius: 3px;
	border-top-right-radius: 3px; 
	border-bottom-right-radius: 3px;
	
	}
	
table.type1 tr{ height:50px;} -->
</style>
<body>

<%
	MemberVO member = (MemberVO)session.getAttribute("member");
%>


<%@include file="/WEB-INF/views/header.jsp" %>


	<!-- ################################################################################################################################ -->
	<!-- 새로운폼 -->
	
	<div id="content1">
		<div class="c1">
			<center>
				<h1>비밀번호 재확인</h1>
		
				<%=member.getUserId()%>님의 정보를 안전하게 보호하기 위하여<br>비밀번호를 다시 한 번 확인합니다.<br><br>
			</center>

			<form id="infoForm" action="/member/userDrop" method="post">
				<table align="center">
					<tr>
						<td class="title1">아이디</td>
						<td class="content1"><input type="text" id="userId" name="userId" readonly value="<%=member.getUserId()%>"></td>
					</tr>
					<tr>
						<td class="title1">비밀번호</td>
						<td class="content1"><input placeholder="비밀번호를 입력해주세요"
							type="password" id="userPass" name="userPass"></td>
					</tr>
					
										
					
				</table>
				
				<br>
				<center>
						<input type="button" class="cancle button5"  value="취소"/>
						<input id="button1" type="button" onclick="fn_infoChk()" class="submit button6"  value="회원탈퇴"/>
						

				</center>
				<br>
			</form>
		</div>
	</div>
	
	
	<!-- ################################################################################################################################ -->
	<%-- <form  method = "post" action="/member/memberInfoCheck" id="infoForm">
		<table class = "type1" align ="center" border=1>
			<tr>
				<td width="80">아이디</td>
				<td><input type="text" style="height:40px;"readonly="readonly" name = "userId" id="userId" value="<%=member.getUserId()%>"></td>
			</tr>	
			
			<tr>
				<td>비밀번호</td>
				<td><input type="password" style="height:40px;"name = "userPass" id="userPass"></td>
			</tr>
			
			<tr >
				<td align="center" colspan=2><input type="button" class="submit" onclick="fn_infoChk()" value="회원정보수정" id="button1"></td>
			</tr>
		</table>
	</form> --%>
	<!-- ################################################################################################################################ -->
	
	
	
</div>
	
<%@include file="/WEB-INF/views/footer.jsp" %>
</body>
</html>