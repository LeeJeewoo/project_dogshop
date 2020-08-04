<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="/resources/editor/js/HuskyEZCreator.js" charset="utf-8"></script>
<title>Insert title here</title>
</head>
<link href="../resources/css/board.css" rel="stylesheet"> 
<script type="text/javascript">
$(document).ready(function(){
	var formObj = $("form[name='updateForm']");
	
	$(document).on("click","#fileDel", function(){
		$(this).parent().remove();
	})
	
	fn_addFile();
	
	$(".cancel_btn").on("click", function(){
		event.preventDefault();
		location.href = "/comment/view_comment?bno=${update.bno}"
			   + "&page=${scri.page}"
			   + "&perPageNum=${scri.perPageNum}"
			   + "&searchType=${scri.searchType}"
			   + "&keyword=${scri.keyword}";
	})
	
	$(".update_btn").on("click", function(){
		obj.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
		if(fn_valiChk()){
			return false;
		}
		formObj.attr("action", "/comment/update");
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
<body>
<%@include file="../header.jsp" %>

<br>
<div id="root" align="center">
	<header>
	<h2>상품후기 수정</h2>
	</header>

<div align="center">
<section id="container">
<form name="updateForm" role="form" method="post" action="/comment/update" enctype="multipart/form-data">
<input type="hidden" name="bno" value="${update.bno}" readonly="readonly"/>
<input type="hidden" id="page" name="page" value="${scri.page}"> 
<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}"> 
<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}"> 
<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}"> 
<input type="hidden" id="fileNoDel" name="fileNoDel[]" value=""> 
<input type="hidden" id="fileNameDel" name="fileNameDel[]" value=""> 
<table class="update">
      <!-- <thead>
      <tr style="height:1px;visibility:hidden">
      총 15열
                <th scope="cols"></th>
                <th scope="cols"></th>
                <th scope="cols"></th>
                <th scope="cols"></th>
                <th scope="cols"></th>
                <th scope="cols"></th>
                <th scope="cols"></th>
                <th scope="cols"></th>
                <th scope="cols"></th>
                <th scope="cols"></th>
                <th scope="cols"></th>
                <th scope="cols"></th>
                <th scope="cols"></th>
                <th scope="cols"></th>
                <th scope="cols"></th>
                
            	
      </tr>
      <tr>
      총 15열
                <th colspan="2" scope="cols">분류</th>
                
                <th colspan="13" scope="cols">제목</th>
            	
      </tr>
         </thead> -->
 <tbody>
		<tr>
			<td>글제목</td>
			<td><input type="text" style="height:20px;width:900px" maxlength="50"  id="title" name="title" value="${update.title}"></td>
		</tr>
		<tr>
			<td >글내용</td>
			<td ><textarea maxlength="2048" style="height:350px; width:900px;resize:none" id="content" name="content"><c:out value="${update.content}"/></textarea>
			<script type="text/javascript">
    							//전역변수
    							var obj = [];
   							 //스마트에디터 프레임생성
   							 nhn.husky.EZCreator.createInIFrame({
     						 oAppRef: obj,
      						 elPlaceHolder: "content",
       						 sSkinURI: "../resources/editor/SmartEditor2Skin.html",
       						 htParams : {
         					   // 툴바 사용 여부
          					  bUseToolbar : true,
           					 // 입력창 크기 조절바 사용 여부
           					 bUseVerticalResizer : true,
            				// 모드 탭(Editor | HTML | TEXT) 사용 여부
           					 bUseModeChanger : true,
   						     }
  						  });
					</script></td>
		</tr>
		<tr>
			<td>
			<label for="writer">작성자</label></td>
			<td align="left"><input type="text" id="writer" name="writer" value="${update.writer}" readonly="readonly"/>
			</td>
		</tr>
		<tr>
			<td>
				<label for="regdate">작성날짜</label></td>
				<td align="left">
				<fmt:formatDate value="${update.regdate}" pattern="yyyy-MM-dd"/>					
			</td>
		</tr>	
     	 <tr>
			<td colspan=2 id="fileIndex">
				<c:forEach var="file" items="${file}" varStatus="var">
					<div>
						<input type="hidden" id="FILE_NO" name="FILE_NO_${var.index}" value="${file.FILE_NO }">
						<input type="hidden" id="FILE_NAME" name="FILE_NAME" value="FILE_NO_${var.index}">
						<a href="#" id="fileName" onclick="return false;">${file.ORG_FILE_NAME}</a>(${file.FILE_SIZE}kb)
						<button id="fileDel"  onclick="fn_del('${file.FILE_NO}','FILE_NO_${var.index}');" type="button">삭제</button><br>
					</div>
				</c:forEach>
			</td>
		</tr>
		
     	<tr>
	      	<td colspan="2" align="right">
	      		<button type="button" id="button1" class="fileAdd_btn">파일추가</button>	
	      		<button type="submit" id="button1" class="update_btn">저장</button>
				<button type="submit" id="button2" class="cancel_btn">취소</button>
			</td>
      	</tr>
      
      
       
      		</tbody>
		</table>
	</form>
	</section>
	</div>
</div>
	
<%@include file="../footer.jsp" %>
</body>
</html>