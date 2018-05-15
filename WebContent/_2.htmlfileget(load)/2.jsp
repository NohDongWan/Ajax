<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src = "http://code.jquery.com/jquery-3.3.1.js"></script>
<title>Insert title here</title>
<style>
	div{display : inline-block;
		width : 300px;
		float : left;
	}

</style>

</head>

<script>

/* 
	-jquery 에서 제공해주는 load() 함수를 사용해서 서버의 menu.html 페이지의 데이터를 가져와서 특정 엘리먼트에 추가합니다.

*/
	$(function(){
	
		$("#menu1").click(function(){
			$("#message1").load("menu.html");
		})
		
		$("#menu2").click(function(){
			$("#message2").load("menu.html li");
			//load() 함수를 이용해서 menu.html 문서의 내용중 li 엘리먼트만 읽어서
			//id 가 message2인 엘리먼트에 넣습니다.
		})
	})
	
</script>
<body>
	<div>
		<a href="#" id="menu1">메뉴 보기 1</a><p>
		<span id = "message1">하하</span>
	</div>
	
	<div>
		<a href="#" id="menu2">메뉴 보기 2</a><p>
		<span id = "message2">하하</span>
	</div>

</body>
</html>