<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../resources/css/board.css" rel="stylesheet">
<!-- 합쳐지고 최소화된 최신 CSS -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">  -->
<!-- 부가적인 테마 -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css"> -->		
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>
<%@ include file="../header.jsp" %>

<div id="content" align="center">
	<h1 align="center">분양후기</h1>

	<section id="container">
		<form  role="form" method="get">
			<table align ="center" class="commentlist">
      			<thead>
      				<tr>
			            <th width="100" scope="cols">번호</th>
			            <th width="600" scope="cols">제목</th>
			            <th width="150" scope="cols">작성자</th>
			            <th width="200" scope="cols">등록일</th>			      
			      	</tr>
			    </thead>
      			<tbody>
					<c:forEach items="${list}" var = "list">
						<tr>
							<td><c:out value="${list.bno}" /></td>
							<td>
								<a href="/comment/view_comment?bno=${list.bno}&page=${scri.page}&perPageNum=${scri.perPageNum}&searchType=${scri.searchType}&keyword=${scri.keyword}"><c:out value="${list.title}" /></a>
							</td>
							<td><c:out value="${list.writer}" /></td>
							<td><fmt:formatDate value="${list.regdate}" pattern="yyyy-MM-dd"/></td>
						</tr>
					</c:forEach>
			</table>
			<table>
				<tr align ="left">
					<td width="980px">
						<div style="display:inline;">
							<div style="display:inline;">
								<select name="searchType" id="searchType">
									<option value="n"<c:out value="${scri.searchType == null ? 'selected' : ''}"/>>-----</option>
									<option value="t"<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
									<option value="c"<c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>내용</option>
									<option value="w"<c:out value="${scri.searchType eq 'w' ? 'selected' : ''}"/>>작성자</option>
									<option value="tc"<c:out value="${scri.searchType eq 'tc' ? 'selected' : ''}"/>>제목+내용</option>
								</select>
							</div>
						 
							<div style="display:inline;">
								<div style="display:inline;">
									<input type="text" name="keyword" id="keywordInput" value="${scri.keyword}"/>
									<span>
										<button id="searchBtn" type="button">검색</button> 	
									</span>
								</div>
							</div>
						 
							<script>
								 $(function(){
									 $('#searchBtn').click(function() {
										 self.location = "commentlist" + '${pageMaker.makeQuery(1)}' + "&searchType=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
									 });
								 });   
							</script>
						</div>
					<td align="right" colspan="4"><button type="button" id="button3" onclick="location='write_comment'">글쓰기</button></td>
					
				</tr>
			</table>
					
					<!-- ##################################################################################################################################################################### -->
					<%-- <div class="search row">
						<div class="col-xs-2 col-sm-2">
							<select name="searchType" class="form-control">
								<option value="n"<c:out value="${scri.searchType == null ? 'selected' : ''}"/>>-----</option>
								<option value="t"<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
								<option value="c"<c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>내용</option>
								<option value="w"<c:out value="${scri.searchType eq 'w' ? 'selected' : ''}"/>>작성자</option>
								<option value="tc"<c:out value="${scri.searchType eq 'tc' ? 'selected' : ''}"/>>제목+내용</option>
							</select>
						</div>
						 
						<div class="col-xs-10 col-sm-10">
							<div class="input-group">
								<input type="text" name="keyword" id="keywordInput" value="${scri.keyword}" class="form-control"/>
								<span class="input-group-btn">
									<button id="searchBtn" type="button" class="btn btn-default">검색</button> 	
								</span>
							</div>
						</div>
						 
						<script>
							 $(function(){
								 $('#searchBtn').click(function() {
									 self.location = "list" + '${pageMaker.makeQuery(1)}' + "&searchType=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
								 });
							 });   
						</script>
					</div> --%>
					<!-- ##################################################################################################################################################################### -->
					
			<div>
				<ul class="pagination">
					<c:if test="${pageMaker.prev}">
						<li><a href="commentlist${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
					</c:if> 
							
					<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
						<li <c:out value="${pageMaker.cri.page == idx ? 'class=info' : ''}" />>
						<a href="commentlist${pageMaker.makeSearch(idx)}">${idx}</a></li>
					</c:forEach>
							
					<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
						<li><a href="commentlist${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
					</c:if> 
				</ul>
			</div>
		</form>	
	</section>
</div>
		
<%@ include file="../footer.jsp" %>
</body>
</html>