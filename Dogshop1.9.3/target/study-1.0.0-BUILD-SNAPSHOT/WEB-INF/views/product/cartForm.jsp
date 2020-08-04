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
		var formObj = $("form[name='cartForm']");	
		
		$(".sDelete_btn").on("click", function() {
			formObj.attr("action", "/product/sDelete");
			formObj.attr("method", "post");
			formObj.submit();
		})
		
		$(".allDelete_btn").on("click", function() {
			
			location.href = "/product/allDelete";
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
<% 
	request.setCharacterEncoding("UTF-8");
	ArrayList<ProductVO> list = (ArrayList<ProductVO>)session.getAttribute("productlist");
	int price=0;
	String breed = null;
%>
<%@include file="/WEB-INF/views/header.jsp" %>

<div id="content">
	<div class="c1">
		<h1 align="center">장바구니</h1>
		<form name="cartForm" role="form" method="post" action="">
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
				<% breed = cart.getBreed(); %>
				<%	price += cart.getPrice();} 
			    }%>
			</table><br>
			
			<div align ="right" class="hap">
			합계<br>
			<a><%=price %>원</a>
			<script type="text/javascript">
			$(document).ready(function() {
			$(".re_btn").on("click", function() {
				var IMP = window.IMP; // 생략가능
				IMP.init("imp58656529"); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
				
				IMP.request_pay({
				    pg : 'kakaopay', // version 1.1.0부터 지원.
				    pay_method : 'card',
				    merchant_uid : 'merchant_' + new Date().getTime(),
				    name : '<%=breed%>',
				    amount : <%=price%>,
				    buyer_email : 'iamport@siot.do',
				    buyer_name : '구매자이름',
				    buyer_tel : '1234-5678',
				    buyer_addr : '서울특별시 종로구 돈화문로 26, 5층(묘동, 단성사)',
				    buyer_postcode : '03138',
				    m_redirect_url : 'https://www.yourdomain.com/payments/complete'
				}, function(rsp) {
				    if ( rsp.success ) {
				        var msg = '결제가 완료되었습니다.';
				        msg += '고유ID : ' + rsp.imp_uid;
				        msg += '상점 거래ID : ' + rsp.merchant_uid;
				        msg += '결제 금액 : ' + rsp.paid_amount;
				        msg += '카드 승인번호 : ' + rsp.apply_num;
				        
				    } else {
				        var msg = '결제에 실패하였습니다.';
				        msg += '에러내용 : ' + rsp.error_msg;
				        
				    }
				    alert(msg);
				    location.href="/product/rvForm"
				});
			})
			})
			</script>
			</div><br>
			
			<div align ="right">
				<button type ="button" id="button1" class="sDelete_btn">선택삭제</button>
				<button type ="button" id="button1" class="allDelete_btn">전부삭제</button>
				<button type="button" id="button2" class="re_btn" >결제하기</button>
			</div>
					
			
		</form>
	</div>
</div>

<%@include file="/WEB-INF/views/footer.jsp" %>
</body>
</html>