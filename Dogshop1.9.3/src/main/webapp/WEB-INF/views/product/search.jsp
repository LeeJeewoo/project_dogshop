<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link href="../resources/css/size.css" rel="stylesheet">
</head>
<style type="text/css">
	.ss{
		float:left;
		width:100%; 
		min-height:100px;
	}
	.ss ul {
		list-style-type:none;
		display: inline-block;
	}
	.ss li {
		float: left; 
		padding: 6px;
		display: inline
	}
	.ss a{
		position: relative;
		text-decoration:none;
		border:1px solid #AA9EA9;
		padding:4px 8px;
		border-radius:4px;
		color:#404040;
	}
	@charset "utf-8";
    .clicked{
		background: #FBC773; 
    }
</style>

<script type="text/javascript">
	 window.onload=function(){
		var type= '${listType}';
		
		if(type=="small" || type=="middle" || type=="large")
			$('#전체').addClass('clicked');
		else 
			$('#'+type).addClass('clicked');
	} 
</script>  

<body>
<%@include file="/WEB-INF/views/header.jsp" %>

<div id="content">
	<div class="small">
		
	
		
		
		<br><h2>"${keyword}" 검색 결과입니다.</h2>
			
		<c:forEach items="${list}" var = "list">
			<div class="product1">
				<a href="read?pno=${list.pno}"><figure><img src="/product/images/${list.stored_file_name}"><figcaption>${list.title} <fmt:formatNumber value="${list.price }" pattern="#,###" />원</figcaption></figure></a>
			</div>
		</c:forEach>
			<c:if test="${member.userId =='root'}">	
		<div class="product1">
			<div class="insert1">
				<a href="/product/insertView"><img src="../resources/icons/plus.png"></a><br>
			</div>
		</div>
		</c:if>
	</div>
</div>

	<div class="ss" align=center>
	  <ul>
	    <c:if test="${pageMaker.prev}">
	    	<li><a href="searchPage${pageMaker.makeQuery(pageMaker.startPage - 1)}&keyword=${keyword}">이전</a></li>
	    </c:if> 
	
	    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
	    	<li><a href="searchPage${pageMaker.makeQuery(idx)}&keyword=${keyword}">${idx}</a></li>
	    </c:forEach>
	
	    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
	    	<li><a href="searchPage${pageMaker.makeQuery(pageMaker.endPage + 1)}&keyword=${keyword}">다음</a></li>
	    </c:if> 
	  </ul>
	</div>

<!-- <div class="page_wrap">
	<div class="page_nation">
						<a class="arrow prev" href="#"></a>
						<a href="#" class="active">1</a> 
						<a href="#">2</a> 
						<a href="#">3</a>
						<a href="#">4</a> 
						<a href="#">5</a> 
						<a href="#">6</a> 
						<a href="#">7</a>
						<a href="#">8</a> 
						<a href="#">9</a> 
						<a href="#">10</a> 
						<a class="arrow next" href="#"></a>
					</div>
				</div>
</div> -->

<%@include file="/WEB-INF/views/footer.jsp" %>
</body>



</html>