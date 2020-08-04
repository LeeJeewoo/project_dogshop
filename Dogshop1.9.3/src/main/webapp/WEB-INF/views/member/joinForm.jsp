<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/button.css">
<link href="../resources/css/joinpage.css" rel="stylesheet">

<style>
#content{
	float:left;
	width:100%; 
	min-height:700px;
}
#button1{
	width:250px;
	height:70px;
	background-color:#FBC773; /* 노랑색 */
	color:black;
	border:0;
	font-size:16pt;
	padding:10px;
	border-radius:5px;
}
#button2{
	width:250px;
	height:70px;
	background-color:#D9D9D9; 
	color:black;
	border:0;
	font-size:16pt;
	padding:10px;
	border-radius:5px;
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
}

table.type1{
		border-collapse:separate;
		border-spacing: 1px;
		line-height: 1; 
		
		}
		
	table.type1 tr th{
		
		padding: 10px;
		border:1 solid white;
		color: #FFFFFF;
		background-color:#747474;
		
	}
	table.type1 tr td{
		height:30px;
		padding: 10px;
		border:1 solid white;
		
		background-color: #EEEEEE;
		
	}


/* table.type1 tr{ height:50px;} */



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
		var telChk = false;
		var birthChk = false;
		
		// 취소
		$(".cencle").on("click", function() {

			location.href = "/";

		})
		
		$('#userId').change(function(){
			$("#idChk").attr("value", "N");
		});
		
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
		
		
		$('#yy').focusout(function(){
	      	birthChk = checkBirthday();
		});
		
		$('#mm').focusout(function(){
			birthChk = checkBirthday();
		});
		
		$('#dd').focusout(function(){
			birthChk = checkBirthday();
		});
		
		$(".submit").on("click", function() {
			
			

			
			if ($("#userId").val() == "") {
				alert("아이디를 입력해주세요.");
				$("#userId").focus();
				return false;
			}
			if ($("#userPass").val() == "") {
				alert("비밀번호를 입력해주세요.");
				$("#userPass").focus();
				return false;
			}
			if ($("#userName").val() == "") {
				alert("성명을 입력해주세요.");
				$("#userName").focus();
				return false;
			}
			if ($("#userGen").val() == "") {
				alert("성별 입력해주세요.");
				$("#userGen").focus();
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
			if ($("#yy").val() == "" || $("#mm").val() == "" || $("#dd").val() == "") {
				alert("생년월일을 입력해주세요.");
				$("#userBirth").focus();
				return false;
			}
			
			if($("#idChk").val() == "N") {
				alert("아이디 중복확인을 해주세요.");
				$("#idChk").focus();
				return false;
			}
			if(!(passChk)) {
				alert("비밀번호를 확인 해주세요.");
				$("#chkNotice").focus();
				return false;
			}
			
			if(!(birthChk)) {
				alert("생년월일을 확인 해주세요.");
				return false;
			}
			
			if(!(telChk)) {
				alert("휴대번호를 확인 해주세요.");
				return false;
			}
			
			alert('회원가입 완료');
			
			var tel = $('#phone1').val() + $('#phone2').val() + $('#phone3').val();
			var birth = $('#yy').val() + $('#mm').val() + $('#dd').val();
			$("#userTel").attr("value", tel);
			$("#userBirth").attr("value", birth);
			
			
			
		});
})	
	
	function fn_idChk(){
		
		var idRegExp = /^[a-zA-z0-9]{4,12}$/; //아이디 유효성 검사
        if (!idRegExp.test($("#userId").val())) {
            alert("아이디는 영문 대소문자와 숫자 4~12자리로 입력해야합니다!");
            $("#userId").focus();
            return false;
        }
		
		
			$.ajax({
				url : "/member/idChk",
				type : "post",
				dataType : "json",
				data : {"userId" : $("#userId").val()},
				success : function(data){
					if(data == 1){
						alert("중복된 아이디입니다.");
					}else if(data == 0){
						$("#idChk").attr("value", "Y");
						alert("사용가능한 아이디입니다.");
					}
				}
			})
	}
	
	
	
	
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
	        	$('#telno').html('빈 칸을 채워주세요.');
	        	$('#telno').attr('color', '#f82a2aa3');
	        	return false;
	        }
		 
		 var pattern_num = /[0-9]/;
	     var pattern_eng = /[a-zA-Z]/;	// 문자 
	     var pattern_spc = /[~!@#$%^&*()_+|<>?:{}]/; // 특수문자
	     var pattern_kor = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/; // 한글체크
	     
	     if( (pattern_num.test(phone2)) && !(pattern_eng.test(phone2)) && !(pattern_spc.test(phone2)) && !(pattern_kor.test(phone2)) ){		
	    	}else{
	    		$('#telno').html('숫자만 입력해주세요.');
	        	$('#telno').attr('color', '#f82a2aa3');
	        	return false;
	    	}
	    	
	    	if( (pattern_num.test(phone3)) && !(pattern_eng.test(phone3)) && !(pattern_spc.test(phone3)) && !(pattern_kor.test(phone3)) ){		
	    	}else{
	    		$('#telno').html('숫자만 입력해주세요.');
	        	$('#telno').attr('color', '#f82a2aa3');
	        	return false;
	    	}
	    	
	    	if( (phone2.length != 4) || (phone3.length != 4) ) {
	    		$('#telno').html('휴대번호를 제대로 입력해주세요.');
	        	$('#telno').attr('color', '#f82a2aa3');
	        	return false;
	    	}
	    	
	    	$('#telno').html('휴대번호 입력 완료');
	    	$('#telno').attr('color', '#199894b3');
	    	return true;

		
	}
	
	
	function checkBirthday() {
		var yy = $("#yy").val();
        var mm = $("#mm").val();
        var dd = $("#dd").val();
        
        
        
        if (yy == "" || mm == "" || dd == "") {
        	$('#birno').html('빈 칸을 채워주세요.');
        	$('#birno').attr('color', '#f82a2aa3');
        	return false;
        }
        
        if (mm.length == 1) {
            mm = "0" + mm;
        }
        
        if (dd.length == 1) {
            dd = "0" + dd;
        }
        
        var pattern_num = /[0-9]/;
        var pattern_eng = /[a-zA-Z]/;	// 문자 
    	var pattern_spc = /[~!@#$%^&*()_+|<>?:{}]/; // 특수문자
    	var pattern_kor = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/; // 한글체크
        
    	if( (pattern_num.test(yy)) && !(pattern_eng.test(yy)) && !(pattern_spc.test(yy)) && !(pattern_kor.test(yy)) ){		
    	}else{
    		$('#birno').html('생년월일을 제대로 입력해주세요.');
        	$('#birno').attr('color', '#f82a2aa3');
    		return false;
    	}
    	
    	if( (pattern_num.test(mm)) && !(pattern_eng.test(mm)) && !(pattern_spc.test(mm)) && !(pattern_kor.test(mm)) ){		
    	}else{
    		$('#birno').html('생년월일을 제대로 입력해주세요.');
        	$('#birno').attr('color', '#f82a2aa3');
    		return false;
    	}
    	
    	if( (pattern_num.test(dd)) && !(pattern_eng.test(dd)) && !(pattern_spc.test(dd)) && !(pattern_kor.test(dd)) ){		
    	}else{
    		$('#birno').html('생년월일을 제대로 입력해주세요.');
        	$('#birno').attr('color', '#f82a2aa3');
    		return false;
    	}
    	
    	
    	
         var birthday = yy + mm + dd;
        
        if (!isValidDate(birthday)) {
        	$('#birno').html('날짜가 안맞아요.');
        	$('#birno').attr('color', '#f82a2aa3');
    		return false;
        }
        var age = calcAge(birthday);
        if (age < 0) {
        	$('#birno').html('아직 안태어나셨어요!!');
        	$('#birno').attr('color', '#f82a2aa3');
    		return false;
        } else if (age >= 100) {
        	$('#birno').html('정말이신가요?');
        	$('#birno').attr('color', '#f82a2aa3');
    		return false;
        } 
        
        
    	$('#birno').html('생년월일 입력 완료');
    	$('#birno').attr('color', '#199894b3');
    	return true;
        
	}
	
	function calcAge(birth) {
        var date = new Date();
        var year = date.getFullYear();
        var month = (date.getMonth() + 1);
        var day = date.getDate();
        if (month < 10)
            month = '0' + month;
        if (day < 10)
            day = '0' + day;
        var monthDay = month + '' + day;

        birth = birth.replace('-', '').replace('-', '');
        var birthdayy = birth.substr(0, 4);
        var birthdaymd = birth.substr(4, 4);

        var age = monthDay < birthdaymd ? year - birthdayy - 1 : year - birthdayy;
        return age;
    }
	
	function isValidDate(param) {
        try {
            param = param.replace(/-/g, '');

            // 자리수가 맞지않을때
            if (isNaN(param) || param.length != 8) {
                return false;
            }

            var year = Number(param.substring(0, 4));
            var month = Number(param.substring(4, 6));
            var day = Number(param.substring(6, 8));

            if (month < 1 || month > 12) {
                return false;
            }

            var maxDaysInMonth = [ 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 ];
            var maxDay = maxDaysInMonth[month - 1];

            // 윤년 체크
            if (month == 2 && (year % 4 == 0 && year % 100 != 0 || year % 400 == 0)) {
                maxDay = 29;
            }

            if (day <= 0 || day > maxDay) {
                return false;
            }
            return true;

        } catch (err) {
            return false;
        }
        ;
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
<!-- ########################################################################################################################################################################## -->
<div id="content1">
	<div class="c1">
		<center><h1>회원가입</h1></center>
		<form action="/member/register" method="post">
			<table align="center">
				<tr>
					<td class="title1">아이디</td>
					<td class="content1">
						<input type="text"  id ="userId" name = "userId">
						<button class="idChk" type="button" id="button_address" onclick="fn_idChk();" value="N">중복확인</button>
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
					<td class="content1"><input type="text" maxlength="10" id="userName" name = "userName"></td>
				</tr>
				<tr>
					<td class="title1">성별</td>
					<td class="radio"><input type="radio" id="userGen" name = "userGen" value="남자" checked="checked" /> 남자 &nbsp; &nbsp; &nbsp; &nbsp;
					<input type="radio" id="userGen" name = "userGen" value="여자" /> 여자</td>
				</tr>
				<tr>
					<td class="title1">이메일</td>
					<td class="content1"><input type="text" id="userMail" name = "userMail"></td>
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
						<input type="text" name="phone2" id="phone2" style="width:80px;"  maxlength="4"    >
						<label> - </label>
						<input type="text" name="phone3" id="phone3" style="width:80px;" maxlength="4"   >
						<input type="hidden" id="userTel" name = "userTel">
						<font id="telno" size="2" />
					
					</td>
				</tr>
				
				
				<tr>
					<td class="title1">생년월일</td>
					<td class="content1">
						<input type="text" name="yy" id="yy" style="width:80px;"  maxlength="4" >
						<label>/</label>
						<input type="text" name="mm" id="mm" style="width:80px;"  maxlength="2" >
						<label>/</label>
						<input type="text" name="dd" id="dd" style="width:80px;"  maxlength="2" >
						<input type="hidden" id="userBirth" name = "userBirth">
						<font id="birno" size="2" />
					</td>
				</tr>
				
				<tr>
					<td class="title1">우편번호</td>
					<td class="content1">
					
						<input readonly type="text" id="userOaddress" name = "userOaddress" readonly="readonly">
						<input type="button" id="button_address" value="우편번호찾기" onclick="execPostCode();">
					
					</td>
				</tr>
				
				<tr>
					<td class="title1">도로명/지번주소</td>
					<td class="content1">
						<input style="height:30px;width:365px;" type="text" id="userDateaddress" name = "userDateaddress" readonly="readonly">
					</td>
				<tr>
				<tr>
					<td class="title1">상세주소</td>
					<td class="content1">
						<input type="text" id="userAddress" name = "userAddress">
					
				</td>
				
				
				
					
				</tr>
			</table><br>
			<center>
				<input type="button" class="cencle button1" value="취소" id = "button2">
				<input class="submit button2" type="submit" id = "button1" value="회원가입" >
				
				
			
				
			</center><br>
		</form>
	</div>
</div>

<!-- ########################################################################################################################################################################## -->



<!-- <div id="content">
	<h1 align="center">회원가입</h1>
	
	<form action="/member/register" method="post">
		<table class="type1" align="center" border=0>
			<tr>
				<td>아이디</td><td colspan=2><input type="text" style="height:30px;width:365px;" id ="userId" name = "userId"></td>
				<td><button class="idChk" type="button" id="idChk" onclick="fn_idChk();" value="N">중복확인</button></td>
			</tr>
			
			<tr>
				<td>비밀번호</td><td colspan=3><input style="height:30px;width:365px;" placeholder="8~16자리의 문자,숫자를 혼합하여 설정해주세요" type="password" id="userPass" name = "userPass"></td>
			</tr>
			
			<tr>
				<td>비밀번호확인</td><td colspan=3><input style="height:30px;width:365px;" type="password" id="passChk" name = "passChk"></td>
			</tr>
			
			<tr>
				<td colspan="4">
				<font id="chkNotice" size="2"/>
				</td>
			</tr>
			
			<tr>
				<td width="80">이름</td><td colspan="3"><input style="height:30px; width:365px;"type="text" maxlength="10" id="userName" name = "userName"></td><td width="80"><input type="radio" name = "userGender" value="man">남<input type="radio" name = "userGender" value="woman">여</td>
			</tr>
			
			<tr>
				<td width="80">성별</td>
				<td colspan=3>
					<input type="radio" id="userGen" name = "userGen" value="남자" checked="checked" /> 남자 &nbsp; &nbsp; &nbsp; &nbsp;
					<input type="radio" id="userGen" name = "userGen" value="여자" /> 여자
				</td>
			</tr>
			
			<tr>
				<td>이메일</td><td colspan=3><input style="height:30px;width:365px;"type="text" id="userMail" name = "userMail"></td>
			</tr>
			
			<tr>
				<td >휴대번호</td>
				<td colspan=2>
				<select  name="phone1" id="phone1">
					<option value="010" selected="selected">010</option>
					<option value="011">011</option>
					<option value="016">016</option>
					<option value="017">017</option>
					<option value="018">018</option>
					<option value="019">019</option>				
				</select>
				<label> - </label>
				<input type="text" name="phone2" id="phone2" style="width:40px;"  maxlength="4"    >
				<label> - </label>
				<input type="text" name="phone3" id="phone3" style="width:40px;" maxlength="4"   >
				<input type="hidden" id="userTel" name = "userTel">
				</td>
				<td>
				<font id="telno" size="2" />
				</td>
				<input style="height:30px;width:365px;" type="text" id="userTel" name = "userTel">
			</tr>
			
			<tr>
				<td>생년월일</td>
				<td colspan=2>
				<input type="text" name="yy" id="yy" style="width:40px;"  maxlength="4" >
				<label>/</label>
				<input type="text" name="mm" id="mm" style="width:40px;"  maxlength="2" >
				<label>/</label>
				<input type="text" name="dd" id="dd" style="width:40px;"  maxlength="2" >
				<input type="hidden" id="userBirth" name = "userBirth">
				</td>
				<td>
				<font id="birno" size="2" />
				</td>
				<input style="height:30px;width:365px;" type="text" id="userBirth" name ="userBirth">
			</tr>
			
			<tr>
				<td >우편번호</td><td colspan=3><input style="height:30px;width:280px;" readonly type="text" id="userOaddress" name = "userOaddress" readonly="readonly">
				<input type="button" id="button_address" value="우편번호찾기" onclick="execPostCode();">
				</td>
			</tr>
			
			<tr>
				<td >도로명/지번주소</td><td colspan=3><input style="height:30px;width:365px;" type="text" id="userDateaddress" name = "userDateaddress" readonly="readonly"></td>
			</tr>
			
			<tr>
				<td >상세주소</td><td colspan=3><input style="height:30px;width:365px;" type="text" id="userAddress" name = "userAddress"></td>
			</tr>
			
			<tr>
				<td colspan=4 align=center><input type="submit" value="회원가입" id = "button1" class="submit"><input type="button" class="cencle" value="취소" id = "button1"></td>
			</tr>
		</table>
	</form><br>
</div> -->

<%@include file="/WEB-INF/views/footer.jsp" %>
</body>
</html>