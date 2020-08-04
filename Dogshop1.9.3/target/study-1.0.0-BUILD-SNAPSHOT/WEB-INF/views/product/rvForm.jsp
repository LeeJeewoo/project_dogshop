<%@page import="kr.co.vo.ProductVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>
<style>
#content{
	float:left;
	width:100%; 
	min-height:700px;
}
.c1{
	position:relative;
	left:300px;
	width:1302px;
}
.hap{
	background:#EEEEEE;
	padding:20px;
}
.hap a{
	font-size:14pt;
	font-weight:bold;
}
#button1{ 
	width : 150px;
	height : 48px;
	font-size : 11pt;
	border: 1px solid #747474;
	background-color : white;
	color: black; 
	padding: 5px;
	/* border-radius: 5px; */ 
	cursor:pointer;
}
#button2 {
	width : 150px;
	height : 48px;
	font-size : 11pt;
	border: 1px solid #747474;
	background-color : #747474;
	color: white; 
	padding: 5px;
	/* border-radius: 5px;  */
	cursor:pointer;
}
	table{
		width:1300px;
		border-collapse:separate;
		border-spacing: 1px;
		line-height: 1; 
	}
	table tr th{
		padding: 10px;
		color: #FFFFFF;
		background-color:#747474;
	}
	table tr td{
		padding: 10px;
		border:1 solid white;
		background-color: #EEEEEE;
	}


</style>
<script type="text/javascript">
$(document).ready(function() {
	
	$('[name="rv_cencel"]').on("click", function() {
		
		location.href = "/product/rv_cencel";
	})
	
})


$(function(){
	$('#check').change(function(){
		if($('#check').prop("checked")){
			$("input[type=checkbox]").prop("checked",true);
		}
		else{
			$("input[type=checkbox]").prop("checked",false);
		}
	});
});



</script>
<body>

<%@include file="/WEB-INF/views/header.jsp" %>
<% 
	request.setCharacterEncoding("UTF-8");
	ArrayList<ProductVO> list = (ArrayList<ProductVO>)session.getAttribute("rvlist");
%>

<div id="content">
	<div class="c1">
		<h1 align="center">주문조회</h1>
		<form action="#" method="post">
		<table>
			<tr>
				<th width="50"><input type="checkbox" id="check" name="check"></th>
				<th width="250">견종</th>
				<th width="350">품종명</th>
				<th width="350">상품가격</th>
				
			</tr>
			<%if(list != null) {  
			    	for(ProductVO cart : list) {
			    %>   
				<tr>
					<td align ="center"><input type="checkbox" id="cnt" name="cnt" value="<%=cart.getPno() %>" ></td>
					<td><%=cart.getType() %> </td>
					<td><%=cart.getBreed() %> </td>
					<td><%=cart.getPrice() %>원 </td>
				</tr>
				<%	} 
			    }%>
			<%-- <%	// productList라는 이름으로 세션 설정
		  		ArrayList<ProductVO> list = (ArrayList<ProductVO>)session.getAttribute("productList");
		  		if(list == null) {%>
		  			<tr><td colspan=5>선택한 상품이 없습니다.<td></tr>
		  		<%}
		  		else {
		  			int cnt=0;
		  			
		  			for(ProductVO cart: list) {
		  				int productTotPrice=cart.getProductPrice()*cart.getPeopleNo();
		  	  			String productDay=cart.getProductDay1()+" ~ "+cart.getProductDay2();
		  	  			
		  			%>
		  				<tr>	
		  					<td align ="center"><input type="checkbox" id="cnt" name="cnt" value=<%=cnt %>></td>
		  					
			  				<td><%=cart.getProductName()%></td>
			  				
			  				<td class="center"><%=cart.getProductPrice()%>원</td>
			  				
			  				<td class="center"><%=cart.getPeopleNo()%>명</td>
			
							<td class="center"><%=productTotPrice%>원</td>
			
							<td class="center"><%=productDay%></td>
		  				</tr>
		  				
		  				
		  			<%cnt++;}
		  		}
		  	%>
			 --%>
			
			</table><br>
			
			<!-- <div align ="right" class="hap">
			합계<br>
			<a>원</a>
			</div><br> -->
			
			<div align ="right">
				<!-- <button type = "button" id="button1" onclick = "location.href='#'">전부삭제</button> -->
				<input type="button" id="button2" name="rv_cencel" value="취소하기">
			</div>
			
		</form>
	</div>
</div>

<%@include file="/WEB-INF/views/footer.jsp" %>
</body>
</html>