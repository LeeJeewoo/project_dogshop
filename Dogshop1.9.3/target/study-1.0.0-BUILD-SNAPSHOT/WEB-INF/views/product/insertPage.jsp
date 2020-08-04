<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../resources/css/insertpage.css" rel="stylesheet">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>

<script type="text/javascript">

	$(document).ready(function(){
		
		fn_addFile();
	})
	
	function fn_addFile(){
			var fileIndex = 1;
			//$("#fileIndex").append("<div><input type='file' style='float:left;' name='file_"+(fileIndex++)+"'>"+"<button type='button' style='float:right;' id='fileAddBtn'>"+"추가"+"</button></div>");
			$(".fileAdd_btn").on("click", function(){
				$("#fileIndex").append("<div><input type='file' style='float:left;' name='file_"+(fileIndex++)+"'>"+"</button>"+"<button type='button' style='float:right;' id='fileDelBtn'>"+"삭제"+"</button></div>");
			});
			$(document).on("click","#fileDelBtn", function(){
				$(this).parent().remove();
				
			});
		}

</script>

<body>
<%@include file="/WEB-INF/views/header.jsp" %>

<div id="content1">
	<div class="c1">
		<center><h1>상품추가</h1></center>
		<form action="write" method="post" enctype="multipart/form-data">
			<table align="center">
				<tr>
					<td class="title1">사이즈</td>
					<td class="content1">
						<select name="shape" id="shape">
							<option value="small">소형견</option>
							<option value="middle">중형견</option>
							<option value="large">대형견</option>
						</select>
					</td>
				</tr>
				<tr>
					<td class="title1">제목</td>
					<td class="content1"><input type="text" name="title" id="title"></td>
				</tr>
				<tr>
					<td class="title1">사진</td>
					<td class="content1"><button class="fileAdd_btn" type="button">파일추가</button></td>
					<td id="fileIndex"></td>
				</tr>
				<tr>
					<td class="title1">견종</td>
					<td class="content1"><input type="text" name="type" id="type"></td>
				</tr>
				<tr>
					<td class="title1">성별</td>
					<td class="radio"><input type="radio" value="남아" name="sex" id="sex">남아 <input type="radio" value="여아" name="sex" id="sex">여아</td>
				</tr>
				<tr>
					<td class="title1">나이</td>
					<td class="content1"><input type="text" name="age" id="age"></td>
				</tr>
				<tr>
					<td class="title1">분양가</td>
					<td class="content1"><input type="text" name="price" id="price"></td>
				</tr>
				<tr>
					<td class="title1">품종명</td>
					<td class="content1"><input type="text" name="breed" id="breed"></td>
				</tr>
				<tr>
					<td class="title1">접종</td>
					<td class="content2"><input type="text" name="inoculation" id="inoculation"></td>
				</tr>
				<tr>
					<td class="title1">상세설명</td>
					<td class="description"><textarea name="content" id="content" style="resize:none"></textarea></td>
				</tr>
			</table><br>
			<center>
				<input class="button1" type="button" onclick="location='/'" value="취소">
				<input class="button2" type="submit" value="추가">
			</center><br>
		</form>
	</div>
</div>

<%@include file="/WEB-INF/views/footer.jsp" %>
</body>
</html>