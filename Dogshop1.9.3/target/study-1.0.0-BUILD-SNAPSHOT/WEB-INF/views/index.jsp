<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title> 
<link href="./resources/css/index.css" rel="stylesheet">
<script>
	function slide(){
		$('.slide').animate({left:-1302}, function(){
			$('.slide li:first').appendTo('.slide');
			$('.slide').css({left:0})
		})
	}
	setInterval(slide, 3906)
	
	
	
	function getCookie(name) {
	   var cookieName = name + "=";
	   var x = 0;
	   while ( x <= document.cookie.length ) {
	      var y = (x+cookieName.length);
	      if ( document.cookie.substring( x, y ) == cookieName) {
	         if ((lastChrCookie=document.cookie.indexOf(";", y)) == -1)
	            lastChrCookie = document.cookie.length;
	         return decodeURI(document.cookie.substring(y, lastChrCookie));
	      }
	      x = document.cookie.indexOf(" ", x ) + 1;
	      if ( x == 0 )
	         break;
	      }
	   return "";
	}
	
	window.onload=function(){ //window.onload = 웹페이지가 열리자마자
		var result = getCookie('popup1');
		if (result == 'end') {
		   return false;
		}
		else {
			window.open("/product/popUp","popUp","width=521,height=611,top=50,left=350,location=no,scrollbars=no,resizeable=no,directories=no");
		}
	}
</script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
</head>

<body>
<%@ include file="header.jsp" %>

	<div id="spot">
		<ul class="slide">
			<li><a href="#"><img src="resources/images/slide1.jpg" width="1302px"/></a></li>
			<li><a href="#"><img src="resources/images/slide2.jpg" width="1302px"/></a></li>
			<li><a href="#"><img src="resources/images/slide3.jpg" width="1302px"/></a></li>
		</ul>
	</div><br>
	
	<div id="content">
		<div class="c1"><hr>
			<br><center><h1>The <font color="#C86F3D">NEW</font> Puppy</h1><a>DogShop의 가족을 기다리는 새로운 아이들을 소개합니다</a></center><br>
			
			<c:forEach items="${indexProduct}" var = "indexProduct">
			
			<div class="product1">
				<a href="product/read?pno=${indexProduct.pno}"><img src="product/images/${indexProduct.stored_file_name}"></a>
			</div>
			
			</c:forEach>
			
		</div><br><br>
	
		<div class="c2"><hr>
			<div class="c22">
				<br><center><h1>DogShop <font color="#C86F3D">I</font>nformation</h1></center>
				<table align=center><br>
					<tr>
						<td align="center">DogShop는 반려동물의 행복과 동시에 고객만족을 위해 항상 변화하며</td>
					</tr>
					<tr>
						<td align="center">발전을 위하여 노력을 기울이고 있습니다.</td>
					</tr>
					<tr>
						<td align="center">올바른 반려동물문화를 지향하고 항상 처음과 같이 곧은 길로 나아가고자 </td>
					</tr>
					<tr>
						<td align="center">지속적인 노력에 힘을 기울이고 있습니다.</td>
					</tr>
					
				</table>
			</div>
			<div class="c21">
				<br><center><h1>DogShop <font color="#C86F3D">N</font>otice</h1></center>
				<table align=center>
					<c:forEach items="${indexNotice}" var="indexNotice">
					<tr>
						<td><a href="/notice/view_notice?bno=${indexNotice.bno}">${indexNotice.title}</a></td><td class="date"><fmt:formatDate value="${indexNotice.regdate}" pattern="yyyy-MM-dd" /></td>
					</tr>
					</c:forEach>	
					
				</table>
			</div><br><br>
		</div>
		
	
		<div class="c3"><hr>
			<br><center><h1>DogShop <font color="#C86F3D">STORE</font></h1><a>AAA 애견샵 전국 가맹점을 소개합니다</a></center>
			<table align=center>
				<tr>
					<td><img src="resources/images/store1.jpg"><br>서울종로본점<br>010-1111-1111</td>
					<td><img src="resources/images/store2.jpg"><br>강남점<br>010-2222-2222</td>
					<td><img src="resources/images/store3.jpg"><br>분당판교점<br>010-3333-3333</td>
					<td><img src="resources/images/store4.jpg"><br>의정부점<br>010-4444-4444</td>
					<td><img src="resources/images/store5.jpg"><br>부산점<br>010-5555-5555</td>
				</tr>
				
			</table><br>
		</div>
	</div><br>
	
	
	
<%@ include file="footer.jsp" %>
</body>
</html>