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
	var formObj = $("form[name='updateForm']");
	
	$(document).on("click","#fileDel", function(){
		$(this).parent().remove();
	})
	
	fn_addFile();
	
	$(".cancel_btn").on("click", function(){
		event.preventDefault();
		location.href = "/product/read?pno=${update.pno}"
	})
	
	$(".update_btn").on("click", function(){
		if(fn_valiChk()){
			return false;
		}
		formObj.attr("action", "/product/update");
		formObj.attr("method", "post");
		formObj.submit();
	})
})
	
function fn_valiChk(){
	var updateForm = $("form[name='updateForm'] .chk").length;
	for(var i = 0; i<updateForm; i++){
		if($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null){
			alert($(".chk").eq(i).attr("title"));
			return true;
		}
	}
}
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
	 var fileNoArry = new Array();
	var fileNameArry = new Array();
	function fn_del(value, name){
		
		fileNoArry.push(value);
		fileNameArry.push(name);
		$("#fileNoDel").attr("value", fileNoArry);
		$("#fileNameDel").attr("value", fileNameArry);
	} 
</script>

</script>

<body>
<%@include file="/WEB-INF/views/header.jsp" %>

<div id="content1">
	<div class="c1">
	
		<center><h1>상품수정</h1></center>
			
		<form name="updateForm" role="form" action="product/update" method="post" enctype="multipart/form-data">
		<input type="hidden" name="pno" value="${update.pno}" readonly="readonly"/>
		<input type="hidden" id="fileNoDel" name="fileNoDel[]" value=""> 
		<input type="hidden" id="fileNameDel" name="fileNameDel[]" value=""> 
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
					<td class="content1"><input type="text" name="title" id="title" value="${update.title}"></td>
				</tr>
				<tr>
					<td class="title1">사진</td>
				<%-- <c:forEach var="file" items="${file}" varStatus="var">
					<div>
						<input type="hidden" id="FILE_NO" name="FILE_NO_${var.index}" value="${file.FILE_NO }">
						<input type="hidden" id="FILE_NAME" name="FILE_NAME" value="FILE_NO_${var.index}">
						<a href="#" id="fileName" onclick="return false;">${file.ORG_FILE_NAME}</a>(${file.FILE_SIZE}kb)
						<button id="fileDel"  onclick="fn_del('${file.FILE_NO}','FILE_NO_${var.index}');" type="button">삭제</button><br>
					</div>
				</c:forEach> --%>
					<td class="content1"><button class="fileAdd_btn" type="button">파일추가</button></td>
					
					<td id="fileIndex"></td>
				</tr>
				<tr>
					<td class="title1">견종</td>
					<td class="content1"><input type="text" name="type" id="type" value="${update.type}"></td>
				</tr>
				<tr>
					<td class="title1">성별</td>
					<td class="radio"><input type="radio" value="남아" name="sex" id="sex">남아 <input type="radio" value="여아" name="sex" id="sex">여아</td>
				</tr>
				<tr>
					<td class="title1">나이</td>
					<td class="content1"><input type="text" name="age" id="age" value="${update.age}"></td>
				</tr>
				<tr>
					<td class="title1">분양가</td>
					<td class="content1"><input type="text" name="price" id="price" value="${update.price}"></td>
				</tr>
				<tr>
					<td class="title1">품종명</td>
					<td class="content1"><input type="text" name="breed" id="breed" value="${update.breed}"></td>
				</tr>
				<tr>
					<td class="title1">접종</td>
					<td class="content2"><input type="text" name="inoculation" id="inoculation" value="${update.inoculation}"></td>
				</tr>
				<tr>
					<td class="title1">상세설명</td>
					<td class="description"><textarea name="content" id="content" style="resize:none"><c:out value="${update.content}"/></textarea></td>
				</tr>
			</table><br>
			<center>
				<button type="submit" id="button1" class="update_btn">저장</button>
				<button type="submit" id="button2" class="cancel_btn">취소</button>
			</center><br>
		</form>
	</div>
</div>

<%@include file="/WEB-INF/views/footer.jsp" %>
</body>
</html>