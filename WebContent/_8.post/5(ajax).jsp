<!--  
	※ 콜백함수의 대해서알아보자

-->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<title>전송 데이터가 한개인 경우</title>
<script src="http://code.jquery.com/jquery-3.3.1.js"></script>
<script>
	/*  
		- $.post() 메서드는 post 방식으로 서버와 통신하는 jQuery 메서드입니다.
			-$.post() 메서드는 서버의 welcome.jsp 페이지를 post 방식으로 요청합니다.
			첫 번째 매개변수 : 두 번째 매개변수에 있는 데이터를 보낼 곳입니다.
			두 번째 매개변수 : 전송할 데이터 입니다.
			세 번째 매개변수 : 서버로 부터 결과 데이터를 받아옵니다.
	*/
	
	$(function(){
		$('form').submit(function(){
					//서버로 보낼 데이터를 폼에서 얻어옵니다.
					// serialize() 메서드는 입력 양식에 적힌 값을 쿼리 문자열로 바꿉니다.
					
		var data1 = $(this).serialize();		//username=홍길동&userage=25
			alert(data1)
			$.ajax({
				type : "POST",
				data : data1,
				url : "welcome3.jsp",
				success : function(msg){
					$('#message').html(msg);
				}
			});
			return false
		});
	})


</script>
</head>
<body>
	<form>
		<!-- form 태그의 action 속성 없습니다. -->
		<label>이름을 입력하세요 : </label> 
		<input type="text" name="username"><br>
		<label>나이을 입력하세요 : </label>
		<input type="text" name="userage"><br> 
		<input type="submit" value="전송">
	</form>
	<div id="message"></div>
</body>
</html>