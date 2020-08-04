<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link href="../resources/css/detailpage.css" rel="stylesheet">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>

<script type="text/javascript">

	$(document).ready(function() {
		var formObj = $("form[name='readForm']");
		
		$(".cart_btn").on("click", function() {
			location.href = "/product/cart?pno=${read.pno}";
		})
		
		$(".login_btn").on("click", function() {
			alert("장바구니는 로그인 후에 이용 가능합니다.");
			location.href = "/member/login";
		})
		
	$(".delete_btn").on("click", function(){
		var deleteYN = confirm("삭제하시겠습니까?");
		if(deleteYN == true){
			
		formObj.attr("action", "/product/delete");
		formObj.attr("method", "post");
		formObj.submit();
			
		}
			
		})
		
					// 수정 
	$(".update_btn").on("click", function(){
		formObj.attr("action", "/product/updateView");
		formObj.attr("method", "get");
		formObj.submit();				
	})
				
})



</script>



<body>
<%@include file="/WEB-INF/views/header.jsp" %>


<div id="content"> 
	<div class="c1">
		<br><br>
		
		<div class="left">
		<img src="/product/images/${img[0].stored_file_name}">
		
		<form name="readForm" role="form" method="post">
		<input type="hidden" id="pno" name="pno" value="${read.pno}" />	
<%-- 		<input type="hidden" id="title" name="title" value="${read.title}" />	
		<input type="hidden" id="content" name="content" value="${read.content}" />	
		<input type="hidden" id="sex" name="sex" value="${read.sex}" />	
		<input type="hidden" id="age" name="age" value="${read.age}" />	
		<input type="hidden" id="price" name="price" value="${read.price}" />	
		<input type="hidden" id="breed" name="breed" value="${read.breed}" />	
		<input type="hidden" id="inoculation" name="inoculation" value="${read.inoculation}" />	
		<input type="hidden" id="shape" name="shape" value="${read.shape}" />	 --%>
		<input type="hidden" id="type" name="type" value="${read.type}" />	
		<input type="hidden" id="FILE_NO" name="FILE_NO" value=""> 
			
		</form>
			
			
		</div>
		<div class="right_top">
			<h2>${read.title}</h2>
			<c:if test="${member.userId == 'root'}">
			<button type="submit" class="delete_btn">삭제</button>
			<button type="submit" class="update_btn">수정</button>
			</c:if>
			<div>
				${read.content}
			</div>
			<table>
				<tr>
					<td>견종</td>
					<td>${read.type}</td>
				</tr>
				<tr>
					<td>성별</td>
					<td>${read.sex}</td>
				</tr>
				<tr>
					<td>나이</td>
					<td>${read.age}</td>
				</tr>
				<tr>
					<td>분양가</td>
					<td>${read.price}</td>
				</tr>
				<tr>
					<td>품종명</td>
					<td>${read.breed}</td>
				</tr>
				<tr>
					<td>접종</td>
					<td>${read.inoculation}</td>
				</tr>
			</table>
		</div>
		<div class="right_bottom" >
			<c:if test="${member.userId == null}">
			<button class="login_btn">장바구니</button>
			</c:if>
			<c:if test="${member.userId != null}">
			<button class="cart_btn">장바구니</button>
			</c:if>
			<button>결제하기</button>
		</div>
		
		
		
		<div class="bottom" align=center>
			<img class="description" src="../resources/images/${read.type}설명.png">
			<c:forEach var="img" items="${img }" begin="1" end="${img.size()}" >
			<img src="/product/images/${img.stored_file_name}"><br>
			</c:forEach>
		</div>
		
		
		<div class="service1" align=center>
			<h1>SERVICES</h1>
			<font class="font4">AAA 애견샵의 해택</font>
			<table>
				<tr>
					<td class="title1"><font class="font1">01</font></td>
					<td><font class="font2">분양시 용품 증정</font><br><font class="font3">15만원 상당의 용품을 증정해드립니다<br>(품종에 따라 다를 수 있습니다)<br></font></td>
					<td class="title1"><font class="font1">02</font></td>
					<td><font class="font2">토탈 케어 서비스</font><br><font class="font3">귀, 구강, 항문낭, 안구세정, 발톱관리 등<br><br></font></td>
				</tr>
				<tr>
					<td class="title1"><font class="font1">03</font></td>
					<td><font class="font2">전문 훈련사 배정</font><br><font class="font3">배변 훈련, 분리 불안, 짖음 등의 문제를 트레이닝 해드립니다<br><br></font></td>
					<td class="title1"><font class="font1">04</font></td>
					<td><font class="font2">24시간 상담 서비스</font><br><font class="font3">담당자를 배정하고 실시간 24시간 상담을 진행해드립니다<br><br></font></td>
				</tr>
			</table>
		</div><br>
	</div>
</div>

<%@include file="/WEB-INF/views/footer.jsp" %>
</body>
</html>