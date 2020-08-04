<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<style>
body {
	margin: 0;
	padding: 0;
}

div {
	margin: 0;
	padding: 0;
}

#popup1 {
	width: 100%;
	height: 581px;
}

#popup2 {
	width: 100%;
	height: 29px;
	background-color: #404040;
	color: #D9D9D9;
}

#popup2 div {
	padding-top: 3px;
	text-align: center;
	font-size: 11pt;
}

#popup2 div button.closeToday {
	width: 170px;
	margin: 0;
	margin-left: 20px;
	margin-right: 20px;
	spacing: 0;
	background-color: #404040;
	color: #D9D9D9;
	/* border:1px solid black; */
	border: 0;
	cursor: pointer;
	outline: none;
	font-size: 11pt;
}

#popup2 div button.close {
	width: 100px;
	margin: 0;
	margin-left: 20px;
	spacing: 0;
	background-color: #404040;
	color: #D9D9D9;
	/* border:1px solid black; */
	border: 0;
	cursor: pointer;
	outline: none;
	font-size: 11pt;
}

#popup2 div img {
	width: 12px;
}
</style>
<script>
	function setCookie(cname, value, expire) {
		var todayValue = new Date();

		todayValue.setDate(todayValue.getDate() + expire);
		document.cookie = cname + "=" + encodeURI(value) + "; expires="
				+ todayValue.toGMTString() + "; path=/;";
	}

	function closeToday() {

		setCookie("popup1", "end", 1);
		window.close();
	}
</script>

<body>

	<div id="popup1">
		<img src="../resources/images/open3.png">
	</div>

	<div id="popup2">
		<div>
			<button class="closeToday" onclick="closeToday()">오늘 하루 열지
				않음</button>
			<button class="close" onclick="self.close()">
				닫기 <img src="../resources/icons/cancel.png">
			</button>
		</div>
	</div>

</body>
</html>