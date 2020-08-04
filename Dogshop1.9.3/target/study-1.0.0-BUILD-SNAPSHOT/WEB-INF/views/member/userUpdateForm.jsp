<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="../resources/css/userUpdatePage.css" rel="stylesheet">

<style>
#content{
	float:left;
	width:100%; 
	min-height:700px;
}
	#button1{
	width : 135px;
	height : 40px;
	font-size : 15px;
	border: 1px solid;
	background-color : #747474;/* #8FAE48 */
	color: #FFFFFF; padding: 3px;
	border-top-left-radius: 3px; 
	border-bottom-left-radius: 3px;
	border-top-right-radius: 3px; 
	border-bottom-right-radius: 3px;
	}
	
	#button_address{
	width:100px;
	height:38px;
	background-color:#FBC773; /* 노랑색 */
	color:black;
	border:0;
	font-size:10pt;
	padding:10px;
	border-radius:5px;
	
	
	/* width : 85px;
	height : 38px;
	font-size : 12px;
	border 1px solid;
	background-color : #747474; #8FAE48
	color: #FFFFFF; padding: 3px;
	border-top-left-radius: 3px; 
	border-bottom-left-radius: 3px;
	border-top-right-radius: 3px; 
	border-bottom-right-radius: 3px; */
}
	
	table.type1 tr{ height:50px;}
</style>
<!-- 합쳐지고 최소화된 최신 CSS -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"> -->
<!-- 부가적인 테마 -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css"> -->
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script><!-- daum 도로명주소 api -->
</head>

<script type="text/javascript">
	
	$(document).ready(function() {
		
		var passChk = false;
		var telChk = true;

		
		$("#cencle").on("click", function() {

			location.href = "/";

		})
		
		 $('#userPass').focusout(function() {
			passChk = checkPass();
		})
		
		$('#passChk').keyup(function(){
			
			passChk = checkPass();
		}) 
		
		$('#phone1').change(function(){
	      	telChk = checkTel();
		});
		
		$('#phone2').focusout(function(){
		  	telChk = checkTel();
		});
		
		$('#phone3').focusout(function(){
		   	telChk = checkTel();
		});
		
		
		$(".submit").on("click", function() {
			

			if ($("#userPass").val() == "") {
				alert("비밀번호를 입력해주세요.");
				$("#userPass").focus();
				return false;
			}

			if ($("#userMail").val() == "") {
				alert("이메일을 입력해주세요.");
				$("#userGen").focus();
				return false;
			}
			
			if( !(chkEmail($("#userMail").val())) ) {
				alert("이메일을 양식을 맞춰주세요.");
				$("#userGen").focus();
				return false;
			}
			
			if ($("#phone2").val() == "" || $("#phone3").val() == "") {
				alert("휴대번호를 입력해주세요.");
				$("#userTel").focus();
				return false;
			}
			if ($("#userOaddress").val() == "" || $("#userDateaddress").val() == "" || $("#userAddress").val() == "") {
				alert("주소를 입력해주세요.");
				$("#userOaddress").focus();
				return false;
			}

			if(!(passChk)) {
				alert("비밀번호는 8~16자의 문자, 숫자를 혼합하여 설정해야합니다.");
				$("#chkNotice").focus();
				return false;
			}
			
			
			if(!(telChk)) {
				alert("휴대번호를 잘못 입력했습니다.");
				return false;
			}
			
			var tel = $('#phone1').val() + $('#phone2').val() + $('#phone3').val();
			$("#userTel").attr("value", tel);
			$("#updateForm").submit();
			alert('회원정보 수정 완료');
		});
		
		
	});
	
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
	
	
	
	/* function checkPass(){
		
		var idRegExp = /^[a-zA-z0-9]{8,16}$/;

	      if (!idRegExp.test($("#userPass").val())) {
	          return false;
	        }
	      
	      var chk = 0;
	      if($("#userPass").val().search(/[0-9]/g) != -1 ) chk ++;
	      if($("#userPass").val().search(/[a-z]/ig)  != -1 ) chk ++;
	      if(chk < 2)
	      {
	          return false;
	      }
	      
	      return true;
	    
	} */
	
	function chkEmail(str) {
	    var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	    if (regExp.test(str)) return true;
	    else return false;

	}
	
function checkTel() {
		
		var phone1 = $("#phone1").val();
		var phone2 = $("#phone2").val();
		var phone3 = $("#phone3").val();
		
		 if (phone1 == "" || phone2 == "" || phone3 == "") {
	        	return false;
	        }
		 
		 var pattern_num = /[0-9]/;
	     var pattern_eng = /[a-zA-Z]/;	// 문자 
	     var pattern_spc = /[~!@#$%^&*()_+|<>?:{}]/; // 특수문자
	     var pattern_kor = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/; // 한글체크
	     
	     if( (pattern_num.test(phone2)) && !(pattern_eng.test(phone2)) && !(pattern_spc.test(phone2)) && !(pattern_kor.test(phone2)) ){		
	    	}else{
	        	return false;
	    	}
	    	
	    	if( (pattern_num.test(phone3)) && !(pattern_eng.test(phone3)) && !(pattern_spc.test(phone3)) && !(pattern_kor.test(phone3)) ){		
	    	}else{
	        	return false;
	    	}
	    	
	    	if( (phone2.length != 4) || (phone3.length != 4) ) {
	        	return false;
	    	}
	    	
	    	return true;

		
	}
	
	
	
	function execPostCode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
						// 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
						var extraRoadAddr = ''; // 도로명 조합형 주소 변수
						// 법정동명이 있을 경우 추가한다. (법정리는 제외)
						// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
						if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
							extraRoadAddr += data.bname;
						}
						// 건물명이 있고, 공동주택일 경우 추가한다.
						if (data.buildingName !== '' && data.apartment === 'Y') {
							extraRoadAddr += (extraRoadAddr !== '' ? ', '
									+ data.buildingName : data.buildingName);
						}
						// 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
						if (extraRoadAddr !== '') {
							extraRoadAddr = ' (' + extraRoadAddr + ')';
						}
						// 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
						if (fullRoadAddr !== '') {
							fullRoadAddr += extraRoadAddr;
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						console.log(data.zonecode);
						console.log(fullRoadAddr);
						/* var a = console.log(data.zonecode);
						var b = console.log(fullRoadAddr);
						if(a == null || b = null){
						alert("주소를 확인하세요.");
						return false;
						} */
						$("[name=userOaddress]").val(data.zonecode);
						$("[name=userDateaddress]").val(fullRoadAddr);
						document.getElementById('userOaddress').value = data.zonecode; //5자리 새우편번호 사용
						document.getElementById('userDateaddress').value = fullRoadAddr;
						//document.getElementById('mem_detailaddress').value = data.jibunAddress;
					}
				}).open();
	}

</script>

<body>
<%@include file="/WEB-INF/views/header.jsp" %>

<!-- #################################################################################################################################### -->
<!-- 새로운폼 -->
<div id="content1">
	<div class="c1">
		<center><h1>회원정보수정</h1></center>
		<form id="updateForm" action="/member/userUpdate" method="post">
			<table align="center">
				<tr>
					<td class="title1">아이디</td>
					<td class="content1">
						<input type="text"  id ="userId" name = "userId" readonly value="${info.userId}">
						
					</td>
				</tr>
				<tr>
					<td class="title1">비밀번호</td>
					<td class="content1"><input placeholder="8~16자리의 문자,숫자를 혼합하여 설정해주세요" type="password" id="userPass" name = "userPass"></td>
				</tr>
				
				<tr>
					<td class="title1">비밀번호확인</td>
					<td class="content1"><input type="password" id="passChk" name = "passChk"></td>
				</tr>
				
				
				<tr>
					<td class="title1">비밀번호체크</td>
					<td class="content1"><font id="chkNotice" size="2"/></td>
					
				</tr>
				<tr>
					<td class="title1">이름</td>
					<td class="content1"><input type="text" maxlength="10" id="userName" name = "userName" readonly value="${info.userName}"></td>
				</tr>
				<tr>
					<td class="title1">성별</td>
					<td class="radio"><input type="radio" id="userGen" name = "userGen" value="남자" checked="checked" /> 남자 &nbsp; &nbsp; &nbsp; &nbsp;
					<input type="radio" id="userGen" name = "userGen" value="여자" /> 여자</td>
				</tr>
				<tr>
					<td class="title1">이메일</td>
					<td class="content1"><input type="text" id="userMail" name = "userMail" value="${info.userMail}"></td>
				</tr>
				
				<tr>
					<td class="title1">휴대번호</td>
					<td class="content1">
						<select  name="phone1" id="phone1">
							<option value="010" selected="selected">010</option>
							<option value="011">011</option>
							<option value="016">016</option>
							<option value="017">017</option>
							<option value="018">018</option>
							<option value="019">019</option>				
						</select>
						<label> - </label>
						<input type="text" name="phone2" id="phone2" style="width:80px;"  maxlength="4" value="${fn:substring(info.userTel,3,7)}"   >
						<label> - </label>
						<input type="text" name="phone3" id="phone3" style="width:80px;" maxlength="4" value="${fn:substring(info.userTel,7,11)}"  >
						<input type="hidden" id="userTel" name = "userTel">
						<font id="telno" size="2" />
					
					</td>
				</tr>
				
				
				<tr>
					<td class="title1">생년월일</td>
					<td class="content1">
						<input type="text" name="yy" id="yy" style="width:80px;"  maxlength="4" readonly value="${fn:substring(info.userBirth,0,4)}">
						<label>/</label>
						<input type="text" name="mm" id="mm" style="width:80px;"  maxlength="2" readonly value="${fn:substring(info.userBirth,4,6)}">
						<label>/</label>
						<input type="text" name="dd" id="dd" style="width:80px;"  maxlength="2" readonly value="${fn:substring(info.userBirth,6,8)}">
						<input type="hidden" id="userBirth" name = "userBirth">
						<font id="birno" size="2" />
					</td>
				</tr>
				
				<tr>
					<td class="title1">우편번호</td>
					<td class="content1">
					
						<input readonly type="text" id="userOaddress" name = "userOaddress" readonly="readonly" value="${info.userOaddress}">
						<input type="button" id="button_address" value="우편번호찾기" onclick="execPostCode();">
					
					</td>
				</tr>
				
				<tr>
					<td class="title1">도로명/지번주소</td>
					<td class="content1">
						<input style="height:30px;width:365px;" type="text" id="userDateaddress" name = "userDateaddress" readonly="readonly" value="${info.userDateaddress}">
					</td>
				<tr>
				<tr>
					<td class="title1">상세주소</td>
					<td class="content1">
						<input type="text" id="userAddress" name = "userAddress" value="${info.userAddress}">
					
				</td>
				
				
				
					
				</tr>
			</table><br>
			<center>
				<input class = "button1" type="button" id="cencle" value="취소">
				<!-- <input  class="cencle"type="button" value="취소" id="button1"> -->
				<input class="submit button2" type="button" value="회원정보수정" >
				<!-- <input  class="submit" type="button" value="회원정보수정" id="button1"> -->
				
				
				
			
				
			</center><br>
		</form>
	</div>
</div>










<!-- #################################################################################################################################### -->
<%-- <div id="content">
	<h1 align="center">회원정보수정</h1>
	<form id="updateForm" method = "post" action="/member/userUpdate">
		<table class = "type1" align="center" border=1>
			<tr>
				<td width="80">아이디</td>
				<td><input type="text" style="height:40px;width:280px;"readonly="readonly"  id="userId" name = "userId" value="${info.userId}"></td>
			</tr>	
			
			<tr>
				<td>비밀번호</td>
				<td><input type="password" style="height:40px;width:280px;" id="userPass" name ="userPass"></td>
			</tr>
			
			<tr>
				<td>이메일</td>
				<td><input type="text" style="height:40px;width:280px;"name = "userMail" id="userMail" value="${info.userMail}"></td>
			</tr>
			
			<tr>
				<td>이름</td>
				<td><input type="text" style="height:40px;width:280px;" readonly="readonly" "userName" id="userName" value="${info.userName}"></td>
			</tr>
			
			<tr>
				<td>휴대번호</td>
				<td>
				<select  name="phone1" id="phone1">
					<option value="010" selected="selected">010</option>
					<option value="011">011</option>
					<option value="016">016</option>
					<option value="017">017</option>
					<option value="018">018</option>
					<option value="019">019</option>
				</select>
				<label> - </label>
				<input type="text" name="phone2" id="phone2" style="width:40px;"  maxlength="4" value="${fn:substring(info.userTel,3,7)}"    >
				<label> - </label>
				<input type="text" name="phone3" id="phone3" style="width:40px;" maxlength="4"  value="${fn:substring(info.userTel,7,11)}" >
				<input type="hidden" id="userTel" name = "userTel">
				</td>
			</tr>
			
			<tr>
				<td>생년월일</td>
				<td>
				<input type="text" name="yy" id="yy" style="width:40px;"  maxlength="4" value="${fn:substring(info.userBirth,0,4)}" readonly="readonly">
				<label>/</label>
				<input type="text" name="mm" id="mm" style="width:40px;"  maxlength="2" value="${fn:substring(info.userBirth,4,6)}" readonly="readonly">
				<label>/</label>
				<input type="text" name="dd" id="dd" style="width:40px;"  maxlength="2" value="${fn:substring(info.userBirth,6,8)}" readonly="readonly">
				</td>
			</tr>
			
			<tr>
				<td>우편번호</td><td colspan=2><input style="height:30px;width:280px;" readonly type="text" id="userOaddress" name = "userOaddress" readonly="readonly" value="${info.userOaddress}">
				<input type="button" id="button_address" value="우편번호찾기" onclick="execPostCode();">
				</td>
			</tr>
			
			<tr>
				<td>도로명/지번주소</td><td colspan=2><input style="height:30px;width:365px;" type="text" id="userDateaddress" name = "userDateaddress" readonly="readonly" value="${info.userDateaddress}"></td>
			</tr>
			
			<tr>
				<td>상세주소</td><td colspan=2><input style="height:30px;width:365px;" type="text" id="userAddress" name = "userAddress" value="${info.userAddress}"></td>
			</tr>
			
			<tr>
				<td align="center" colspan=2><input  class="submit" type="button" value="회원정보수정" id="button1"><input  class="cencle"type="button" value="취소" id="button1"></td>
			</tr>
		</table>
	</form>
</div> --%>

<!-- #################################################################################################################################### -->

<%@include file="/WEB-INF/views/footer.jsp" %>
</body>
</html>