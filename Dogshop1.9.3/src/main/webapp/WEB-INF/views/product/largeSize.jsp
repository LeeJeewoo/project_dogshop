<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link href="./resources/css/size.css" rel="stylesheet">
</head>
<body>
<%@include file="/WEB-INF/views/header.jsp" %>

<div id="content">
	<div class="small">
		
		<center><h1>대형견분양</h1></center>
		
		<ul>
			<li><a onmouseover="this.style.color='#BD0000'" onmouseout="this.style.color='black'">전체</a></li>
			<li><a onmouseover="this.style.color='#BD0000'" onmouseout="this.style.color='black'">허스키</a></li>
			<li><a onmouseover="this.style.color='#BD0000'" onmouseout="this.style.color='black'">사모예드</a></li>
			<li><a onmouseover="this.style.color='#BD0000'" onmouseout="this.style.color='black'">골든리트리버</a></li>
		</ul>
		<table border=0>
			<tr>
				<td><a href="detailPage"><img src="./resources/images/포메라니안1.jpg"></a></td>
				<td><a href="detailPage"><img src="./resources/images/포메라니안1.jpg"></a></td>
				<td><a href="detailPage"><img src="./resources/images/포메라니안1.jpg"></a></td>
				<td><a href="detailPage"><img src="./resources/images/포메라니안1.jpg"></a></td>
			</tr>
		</table>
		
	</div>
</div>

<%@include file="/WEB-INF/views/footer.jsp" %>
</body>
</html>