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
		
	
		<c:choose>
		
		<c:when test='${ list[0].shape eq "small"}'>
		<center><h1>소형견분양</h1></center>
		<ul>
			<li><a href="/product/sizePage?shape=small" class="hover1" id="전체">전체</a></li>
			<li><a href="/product/listPage?type=포메라니안" class="hover1" id="포메라니안">포메라니안</a></li>
			<li><a href="/product/listPage?type=닥스훈트" class="hover1" id="닥스훈트">닥스훈트</a></li>
			<li><a href="/product/listPage?type=푸들" class="hover1" id="푸들">푸들</a></li>
		</ul>
		</c:when>
		
		<c:when test='${ list[0].shape eq "middle"}'>
		<center><h1>중형견분양</h1></center>
		<ul>
			<li><a href="/product/sizePage?shape=middle" class="hover1" id="전체">전체</a></li>
			<li><a href="/product/listPage?type=비글" class="hover1" id="비글">비글</a></li>
			<li><a href="/product/listPage?type=슈나우저" class="hover1" id="슈나우저">슈나우저</a></li>
			<li><a href="/product/listPage?type=스피츠" class="hover1" id="스피츠">스피츠</a></li>
		</ul>
		</c:when>
		
		<c:when test='${ list[0].shape eq "large"}'>
		<center><h1>중형견분양</h1></center>
		<ul>
			<li><a href="/product/sizePage?shape=large" class="hover1" id="전체">전체</a></li>
			<li><a href="/product/listPage?type=허스키" class="hover1" id="허스키">허스키</a></li>
			<li><a href="/product/listPage?type=사모예드" class="hover1" id="사모예드">사모예드</a></li>
			<li><a href="/product/listPage?type=골든리트리버" class="hover1" id="골든리트리버">골든리트리버</a></li>
		</ul>
		</c:when>
		
		</c:choose>
		
		
			
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
	    	<li><a href="sizePage${pageMaker.makeQuery(pageMaker.startPage - 1)}&shape=${list[0].shape}">이전</a></li>
	    </c:if> 
	
	    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
	    	<li><a href="sizePage${pageMaker.makeQuery(idx)}&shape=${list[0].shape}">${idx}</a></li>
	    </c:forEach>
	
	    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
	    	<li><a href="sizePage${pageMaker.makeQuery(pageMaker.endPage + 1)}&shape=${list[0].shape}">다음</a></li>
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