<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<!-- 합쳐지고 최소화된 최신 CSS -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"> -->
<!-- 부가적인 테마 -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css"> -->
	 	
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	 	
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="/resources/editor/js/HuskyEZCreator.js" charset="utf-8"></script>


<title>게시판</title>
<link href="../resources/css/board.css" rel="stylesheet">
</head>
<script type="text/javascript">
		$(document).ready(function(){
			var formObj = $("form[name='writeForm']");
			
			$(".write_btn").on("click", function(){
				obj.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
				if(fn_valiChk()){
					return false;
				}
				
				formObj.attr("action", "/board/qna_write");
				formObj.attr("method", "post");
				

				formObj.submit();
			});
			fn_addFile();
		})
 		
		
		function fn_valiChk(){
			var regForm = $("form[name='writeForm'] .chk").length;
			for(var i = 0; i<regForm; i++){
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
</script>
<body>
<%@include file="../header.jsp" %>

<div id="comment">
	<div id="root">
		<h2 align="center">분양문의 작성</h2>



	<div align="center">	
	<section id="container">
		<form name="writeForm" enctype="multipart/form-data">
			<table class="write">
				<tbody>
					<c:if test="${member.userId != null}">
						<tr>
							<td class="title">
								<label for="title">제목</label>
							</td>
							<td class="content" align="left">
								<input type="text" id="title" name="title" class="chk" name="qnaTitle" maxlength="50" title="제목을 입력하세요."/>
							</td>
						</tr>	
						<tr>
							<td>
								<label for="content">내용</label></td><td><textarea id="content" name="content" class="chk" maxlength="2048" title="내용을 입력하세요." ></textarea>
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
					</script>

							</td>
						</tr>								
						<tr>
							<td>
								<label for="writer">작성자</label></td><td align="left"><input type="text" id="writer" name="writer" readonly class="chk" title="작성자를 입력하세요." value="${member.userId}" />
								
							</td>
						</tr>
						<tr>
							<td align="right" colspan=2>
								<!-- <button class="fileAdd_btn" type="button">파일추가</button> -->			
								<button class="write_btn" id="button1" type="button">글쓰기</button>	
								<button type="button" class="button1" id="button2"  onclick="location='qnalist'" >이전페이지</button>
							</td>
						</tr>
						
												
						 </c:if>
						
						<c:if test="${member.userId == null}">
							<p>로그인 후에 작성하실 수 있습니다.</p>
						</c:if> 
						
					</tbody>	
				</table>	
			</form>	
		</section>
		</div>
		

</div>
<%@ include file="../footer.jsp" %>
</body>
</html>