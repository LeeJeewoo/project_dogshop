<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../resources/css/header.css" rel="stylesheet"> 
<script>
function menu(){ 
	if(document.all.subcate0.style.visibility=="visible"){
		document.all.subcate0.style.visibility="hidden";
		document.all.subcate0.style.opacity=0;
	}
	else{
		document.all.subcate0.style.visibility="visible";
		document.all.subcate0.style.opacity=1;
	}		
}
function mypage(){ 
	if(document.all.mypage1.style.visibility=="visible"){
		document.all.mypage1.style.visibility="hidden";
		document.all.mypage1.style.opacity=0;
	}
	else{
		document.all.mypage1.style.visibility="visible";
		document.all.mypage1.style.opacity=1;
	}		
}

$(document).ready(function(){
	$("#logoutLi").on("click", function(){
		location.href="member/logout";
	})
	
})


</script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>

<div id="header">
	<div id="menu">
		<ul class="mainmenu1">
			<li><a href="/notice/noticelist">공지사항</a></li>
			<li><a>|</a></li>
			<li><a href="/board/qnalist">상품문의</a></li>
			<li><a>|</a></li>
			<li><a href="/comment/commentlist">상품후기</a></li>
		</ul>
		<ul class="mainmenu2">
		<c:if test="${member != null }">
			<li><a onclick="mypage()">마이페이지▼</a>
				<ul class="mypage1" id="mypage1">
					<li onmouseover="this.style.background='#FBC773'" onmouseout="this.style.background='white'"><a href="/product/rForm">주문조회</a></li>
					<li onmouseover="this.style.background='#FBC773'" onmouseout="this.style.background='white'"><a href="/member/memberInfoCheck">정보관리</a></li>
					<li onmouseover="this.style.background='#FBC773'" onmouseout="this.style.background='white'"><a href="/member/memberInfoCheckDrop">회원탈퇴</a></li>
				</ul>
			</li>
			<li><a>|</a></li>
		</c:if>
			<li><a href="/product/cartView">장바구니</a></li>
			<c:if test="${member == null}">
			<li><a>|</a></li>
			<li><a href="/member/register">회원가입</a></li>
			<li><a>|</a></li>
			<li><a href="/member/login">로그인</a></li>
			</c:if>
			<c:if test="${member != null }">
			<li><a>|</a></li>
			<li><a href="/member/logout">로그아웃</a></li>	
			<li><a>|</a></li>
			<li><a>${member.userId}님</a></li>
			</c:if>
		</ul>
	</div>
	
	<div id="middle_section">
		<div class="logo">
			<a href="/"><img src="../resources/icons/logo.png"></a>
		</div>
		
		<div class="search">
			<form name="searchForm" role="form" method="get" action="/product/searchPage">
			<input type="text" name="keyword">
			<button class="btn_search_submit"><img src="../resources/icons/search.png"></button>
			</form>
		</div>
		<!-- <div class="search2">
			<ul>
				<li><a><img src="../resources/icons/search.png"></a></li>
				<li><a href="#">검색어1</a></li>
				<li><a>|</a></li>
				<li><a href="#">검색어2</a></li>
				<li><a>|</a></li>
				<li><a href="#">검색어3</a></li>
			</ul>
		</div> -->
	</div>
	
	<div id="category">
		<ul class="maincate">
			<li class="cate1"><a class="allcate" onclick="menu()">≡ 전체 카테고리</a>
				<ul class="subcate0" id="subcate0">
					<div class="s">
						<li><a class="title">소형견</a></li>
						<li><a class="hover2" href="/product/listPage?type=포메라니안">포메라니안</a></li>
						<li><a class="hover2" href="/product/listPage?type=닥스훈트">닥스훈트</a></li>
						<li><a class="hover2" href="/product/listPage?type=푸들">푸들</a></li>
					</div>
					<div class="m">
						<li><a class="title">중형견</a></li>
						<li><a class="hover2" href="/product/listPage?type=비글">비글</a></li>
						<li><a class="hover2" href="/product/listPage?type=슈나우저">슈나우저</a></li>
						<li><a class="hover2" href="/product/listPage?type=스피츠">스피츠</a></li>
					</div>
					<div class="l">
						<li><a class="title">대형견</a></li>
						<li><a class="hover2" href="/product/listPage?type=허스키">허스키</a></li>
						<li><a class="hover2" href="/product/listPage?type=사모예드">사모예드</a></li>
						<li><a class="hover2" href="/product/listPage?type=골든리트리버">골든리트리버</a></li>
					</div>
				</ul>
			</li> 
			<li class="cate3"><a href="/product/sizePage?shape=small">소형견분양</a>
				<ul class="subcate1">
					<li onmouseover="this.style.background='#FBC773'" onmouseout="this.style.background='white'"><a href="/product/listPage?type=포메라니안">포메라니안</a></li>
					<li onmouseover="this.style.background='#FBC773'" onmouseout="this.style.background='white'"><a href="/product/listPage?type=닥스훈트">닥스훈트</a></li>
					<li onmouseover="this.style.background='#FBC773'" onmouseout="this.style.background='white'"><a href="/product/listPage?type=푸들">푸들</a></li>
				</ul>
			</li>
			<li class="cate3"><a href="/product/sizePage?shape=middle">중형견분양</a>
				<ul class="subcate1">
					<li onmouseover="this.style.background='#FBC773'" onmouseout="this.style.background='white'"><a href="/product/listPage?type=비글">비글</a></li>
					<li onmouseover="this.style.background='#FBC773'" onmouseout="this.style.background='white'"><a href="/product/listPage?type=슈나우저">슈나우저</a></li>
					<li onmouseover="this.style.background='#FBC773'" onmouseout="this.style.background='white'"><a href="/product/listPage?type=스피츠">스피츠</a></li>
				</ul>
			</li>
			<li class="cate3"><a href="/product/sizePage?shape=large">대형견분양</a>
				<ul class="subcate1">
					<li onmouseover="this.style.background='#FBC773'" onmouseout="this.style.background='white'"><a href="/product/listPage?type=허스키">허스키</a></li>
					<li onmouseover="this.style.background='#FBC773'" onmouseout="this.style.background='white'"><a href="/product/listPage?type=사모예드">사모예드</a></li>
					<li onmouseover="this.style.background='#FBC773'" onmouseout="this.style.background='white'"><a href="/product/listPage?type=골든리트리버">골든리트리버</a></li>
				</ul>
			</li>
		</ul>
	</div>
</div>


</body>
</html>