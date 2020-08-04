<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<script type="text/javascript">

	$(document).ready(function() {
		var passChk = false;
		
		
		$('#userPass').focusout(function() {
			passChk = checkPass();
		})
		
		$('#passChk').keyup(function(){
			
			passChk = checkPass();
		})
		
		$(".changePassBtn").on("click", function() {
			
			
			if ($("#userPass").val() == "") {
				alert("비밀번호를 입력해주세요.");
				$("#userPass").focus();
				return false;
			}
			if ($("#passChk").val() == "") {
				alert("비밀번호 확인을 입력해주세요.");
				$("#chkPass").focus();
				return false;
			}
			if(!(passChk)) {
				alert("비밀번호를 확인 해주세요.");
				$("#chkNotice").focus();
				return false;
			}
			
			$("#changePw").submit();
			alert("비밀번호가 변경되었습니다.");
			close();
			
		})
		
		
		function checkPass(){
			
			var idRegExp = /^[a-zA-z0-9]{8,16}$/;
			
		      $('#chkNotice').html('');
		      
		      if (!idRegExp.test($("#userPass").val())) {
		    	  $('#chkNotice').html('비밀번호는 8~16자 문자, 숫자를 혼합하여 설정해야합니다.');
		    	  $('#chkNotice').attr('color', '#f82a2aa3');
		          return false;
		        }
		      
		      var chk = 0;
		      if($("#userPass").val().search(/[0-9]/g) != -1 ) chk ++;
		      if($("#userPass").val().search(/[a-z]/ig)  != -1 ) chk ++;
		      if(chk < 2)
		      {
		    	  $('#chkNotice').html('비밀번호는 8~16자 문자, 숫자를 혼합하여 설정해야합니다.');
		    	  $('#chkNotice').attr('color', '#f82a2aa3');
		          return false;
		      }
		    

		      if($('#userPass').val() != $('#passChk').val()){
		          $('#chkNotice').html('비밀번호 일치하지 않음<br><br>');
		          $('#chkNotice').attr('color', '#f82a2aa3');
		          return false;
		        } else{
		          $('#chkNotice').html('비밀번호 일치함<br><br>');
		          $('#chkNotice').attr('color', '#199894b3');
		          return true;
		        }
		        

		    
		}
		
	})
	

</script>

<body>

<div class="container">
	<section id="container">
	<h1>비밀번호 변경</h1><hr>
		<form id="changePw" role="form" method="post" action="/member/changePw">
			<input type="hidden" id="userId" name="userId" value="${userId}">
			<div class="form-group">
					<label for="title" class="col-sm-2 control-label">새로운 비밀번호</label>
					<input type="password" id="userPass" name="userPass" class="form-control">
			</div>
			<div class="form-group">
					<label for="title" class="col-sm-2 control-label">비밀번호 확인</label>
					<input type="password" id="passChk" name="passChk" class="form-control">
			</div>
			<div class="form-group">
				<font id="chkNotice" size="2"/>
			</div>
			<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<button type="button" class="changePassBtn btn btn-success">변경하기</button>
						</div>
			</div>
		</form>
	</section>
</div>


<form> 
	

</form>

</body>
</html>