<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<!-- 합쳐지고 최소화된 최신 CSS -->
		<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"> -->
		<!-- 부가적인 테마 -->
		<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css"> -->
	 	
	 	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	 	
<title>Insert title here</title>
<link href="../resources/css/board.css" rel="stylesheet"> 

<script type="text/javascript">
/* ################################################################################################### */
		$(document).ready(function(){
			var formObj = $("form[name='readForm']");
			
			
			// 수정 
			$(".update_btn").on("click", function(){
				formObj.attr("action", "/comment/update_comment");
				formObj.attr("method", "get");
				formObj.submit();				
			})
			
			// 삭제
			$(".delete_btn").on("click", function(){
				
				var deleteYN = confirm("삭제하시겠습니까?");
				if(deleteYN == true){
					
				formObj.attr("action", "/comment/delete");
				formObj.attr("method", "post");
				formObj.submit();
					
				}
			})
			
			// 목록
			$(".list_btn").on("click", function(){
				
				location.href = "/comment/commentlist?page=${scri.page}"
						      +"&perPageNum=${scri.perPageNum}"
						      +"&searchType=${scri.searchType}&keyword=${scri.keyword}";
			})
			
			$(".replyWriteBtn").on("click", function(){
				var formObj = $("form[name='replyForm']");
				if ($("#content2").val() == "") {
					alert("내용을 입력하세요.");
					$("#content2").focus();
					return false;
				}else{
				
				
				formObj.attr("action", "/comment/replyWrite");
				formObj.submit();
				}
			});
			
			//댓글 수정 View
			/* $(".replyUpdateBtn").on("click", function(){
				location.href = "/comment/replyUpdateView?bno=${read.bno}"
								+ "&page=${scri.page}"
								+ "&perPageNum=${scri.perPageNum}"
								+ "&searchType=${scri.searchType}"
								+ "&keyword=${scri.keyword}"
								+ "&rno="+$(this).attr("data-rno");
			}); */
			
			//댓글 삭제 View
			/*  $(".replyDeleteBtn").on("click", function(){
				
				var deleteYN = confirm("삭제하시겠습니까?");
				if(deleteYN == true){
					
				formObj.attr("action", "/comment/replyDelete");
				formObj.attr("method", "post");
				formObj.submit();
					
				}
			});  */
			
			 $(".replyDeleteBtn").on("click", function(){
				 var deleteYN = confirm("정말 삭제하시겠습니까?.");
				 if(deleteYN == true){
					 location.href = "/comment/replyDelete?bno=${read.bno}"
							+ "&page=${scri.page}"
							+ "&perPageNum=${scri.perPageNum}"
							+ "&searchType=${scri.searchType}"
							+ "&keyword=${scri.keyword}"
							+ "&rno="+$(this).attr("data-rno");
				 }
				 else if(deleteYN == false){
				   
				 }
			});
			
			$(document).on("click", "#replyUpdateSub", function(){
				var formObj = $("form[name='updateForm']");		
				
				formObj.attr("action", "/comment/replyUpdate");
				formObj.attr("method", "post");
				formObj.submit();	
				
			});
			$(document).on("click","#replyUpdateCen", function(){
				$(this).parent().remove();
				$(".replyUpdateBtn").show();
			});

		})
		
		
		/* ################################################################################################### */
		
			function fn_fileDown(fileNo){
			var formObj = $("form[name='readForm']");
			$("#FILE_NO").attr("value", fileNo);
			formObj.attr("action", "/comment/fileDown");
			formObj.submit();
		}
		
		function re_update(element, data){
				
			var value = "#replyUpdate" + element;
			var rnoValue = data;
				
			
				$(".replyUpdateBtn").hide();
				
				$(value).append("<form name='updateForm' role='form'>"
				+"<input type='hidden' id='bno' name='bno' value='${read.bno}' />"
				+"<input type='hidden' id='rno' name='rno' value='"+rnoValue+"'>"
				+"<input type='hidden' id='page' name='page' value='${scri.page}'>"
				+"<input type='hidden' id='perPageNum' name='perPageNum' value='${scri.perPageNum}'>"
				+"<input type='hidden' id='searchType' name='searchType' value='${scri.searchType}'>"
				+"<input type='hidden' id='keyword' name='keyword' value='${scri.keyword}'>"
				+"<label for='content'>수정 내용</label><input type='text' id='contentReplyUpdate' name='content'/>"
				+"<br><button type='submit' class='button4' id='replyUpdateSub'>수정</button>"
				+"<button type='button' class='button4' id='replyUpdateCen'>취소</button></form>");	

			
			
		}
		
		
		
		
		
	</script>

</head>
<body>
<%@include file="../header.jsp"%>

<div id="content">
	<div class="container">
		<h2>분양후기 게시판(읽기)</h2>
		<section id="container">
			<form name="readForm" role="form" method="post">
				<input type="hidden" id="bno" name="bno" value="${read.bno}" />
				<input type="hidden" id="page" name="page" value="${scri.page}"> 
				<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}"> 
				<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}"> 
				<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}"> 
				<input type="hidden" id="FILE_NO" name="FILE_NO" value=""> 
			</form>
			<table class="view1">
				<tr>
					<td colspan=2 class="title">
						<input type="text" id="title" name="title" class="form-control"value="${read.title}" readonly="readonly" />
						<br>	
						<a id="writer" class="form-control">${read.writer} </a>
						<a> (<fmt:formatDate value="${read.regdate}" pattern="yyyy-MM-dd" />)</a>
					</td>
				</tr>
				
				<tr>
					<td colspan=2><c:out value="${read.content}" escapeXml="false" /></td>
				</tr>
				<tr>
					<td colspan=2>
						첨부파일<br>
						<c:forEach var="file" items="${file}">
							<a href="#" onclick="fn_fileDown('${file.FILE_NO}'); return false;">${file.ORG_FILE_NAME}</a>(${file.FILE_SIZE}kb)<br>
						</c:forEach>
					</td>
				</tr>
			</table>
				
			<div class="buttongroup">
			<c:choose>
				<c:when test="${member.userId == read.writer}">
					<button type="button" id="button1" class="update_btn">수정</button>
					<button type="button" id="button1" class="delete_btn">삭제</button>
				</c:when>
					
				<c:when test="${member.userId =='root'}">
					<button type="button" id="button1" class="delete_btn">삭제</button>
				</c:when>
				
				</c:choose>
				
				<button type="button" id="button2" class="list_btn">목록</button>	
			</div><br>
			
				<!-- ########################################################################################################################### -->
				
				<%-- <div class="form-group">
					<label for="title" class="col-sm-2 control-label">제목</label>
					<input type="text" id="title" name="title" class="form-control" value="${read.title}" readonly="readonly" />
				</div>
				<div class="form-group">
					<label for="content" class="col-sm-2 control-label">내용</label>
					<textarea id="content" name="content" class="form-control" readonly="readonly"><c:out value="${read.content}" /></textarea>
				</div>
				<div class="form-group">
					<label for="writer" class="col-sm-2 control-label">작성자</label>
					<input type="text" id="writer" name="writer" class="form-control" value="${read.writer}"  readonly="readonly"/>
				</div>
				<div class="form-group">
					<label for="regdate" class="col-sm-2 control-label">작성날짜</label>
					<fmt:formatDate value="${read.regdate}" pattern="yyyy-MM-dd" />	
				</div>
				<hr>
				<span>파일 목록</span>
				<div class="form-group" style="border: 1px solid #dbdbdb;">
					<c:forEach var="file" items="${file}">
						<a href="#" onclick="fn_fileDown('${file.FILE_NO}'); return false;">${file.ORG_FILE_NAME}</a>(${file.FILE_SIZE}kb)<br>
					</c:forEach>
				</div>
				<hr>
								
				<div>
					<button type="button" class="update_btn btn btn-warning">수정</button>
					<button type="button" class="delete_btn btn btn-danger">삭제</button>
					<button type="button" class="list_btn btn btn-primary">목록</button>	
				</div> --%>
				<!-- ########################################################################################################################### -->
				
				
				<!-- 댓글 뷰-->
				댓글
				<table class="view2">
				<tr>
					<td style="width:1300px;">
				
				
				
					<ol class="replyList">
						<c:forEach items="${replyList}" var="replyList" varStatus="status">
						
							<li>
								<p>
									작성자 : ${replyList.writer}
									(<fmt:formatDate value="${replyList.regdate}" pattern="yyyy-MM-dd" />)
									
									<c:choose>
										<c:when test="${member.userId == replyList.writer}">
											<button type="button" id="button4" class="replyUpdateBtn" onclick="re_update(${status.index}, ${replyList.rno})" data-rno="${replyList.rno}">수정</button>
											<button type="button" id="button4" class="replyDeleteBtn" data-rno="${replyList.rno}">삭제</button>
										</c:when>
											
										<c:when test="${member.userId == 'root'}">
											<button type="button" id="button4" class="replyDeleteBtn" data-rno="${replyList.rno}">삭제</button>
										</c:when>
									</c:choose>
												
									
									<%-- <c:if test="${member.userId == replyList.writer}">
									<button type="button" id="button4" class="replyUpdateBtn" data-rno="${replyList.rno}">수정</button>
									<button type="button" id="button4" class="replyDeleteBtn" data-rno="${replyList.rno}">삭제</button>
									</c:if>
			 --%>					
			 
			 </p>
								  
								<p>${replyList.content}</p>
								<br>
								<p id="replyUpdate${status.index}"> </p>
							</li>
						</c:forEach>   
					</ol>
				
					
					</td>
				</tr>
				</table>
		
				<c:if test="${member.userId != null}">
				
				<!-- 댓글 작성-->
				
				
				<form name="replyForm" method="post" class="form-horizontal">
					<input type="hidden" id="bno" name="bno" value="${read.bno}" />
					<input type="hidden" id="page" name="page" value="${scri.page}"> 
					<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}"> 
					<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}"> 
					<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}"> 
				
					<table class = "view3">
						<tr>
							<td class="title3">
							&nbsp;작성자 : <input type="text" readonly placeholder="작성자이름" id="writer" name="writer" value="${member.userId}"/>
							</td>
						</tr>
						<tr>
							<td class="content3">
								<input type="text" id="content2" placeholder="댓글내용작성하시오." name="content"/>
								<button type="button" class="replyWriteBtn" id="button5">작성</button>
							</td>
						</tr>
					</table>
				</form>
			</c:if>
		</section>
	</div>		
	<c:if test="${member.userId == null}">
		<center><p>댓글은 로그인 후에 작성하실 수 있습니다.</p></center>
	</c:if>
</div>
	
<%@include file="../footer.jsp"%>
</body>
</html>