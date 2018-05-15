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
			//서버로 보낼 데이터를 입력창에서 얻어옵니다.
			var username= $('.username1').val();
			
			//입력창에서 입력받은 데이터를 문자열 형식으로 변환합니다.
			//username="홍길동" 전송;
			var sendData = 'username=' + username;
			
			$.get(				//get 방식으로 자료를 전달합니다.
					
					'welcome.jsp',				//문자열 형식의 데이터 welcome.jsp 로 보냅니다.
					sendData,					// username="홍길동"; 형식으로 전송합니다.
					function(msg){				//서버의 welcome.jsp 에서는 msg 로 받은데이터를
												//인사말 덧붙여서 돌려줍니다.
												//콜백함수는 서버에서 보내온 데이터를 매개변수로 얻어옵니다
				alert(msg);
			//<div> 태그는 영역을 설정하기 위한 태그입니다.
			//영역 설정된 곳에 msg를 html화 합니다.
			//서버로부터 받은 데이터를 id가 message인 엘리머트에 설정합니다.
				$('#message').html(msg);
			});//post end
			return false
			
		});
	})


</script>
</head>
<body>
	<form>
		<!-- form 태그의 action 속성 없습니다. -->
		<label>이름을 입력하세요 : </label> <input type="text" name="username"
			class="username1"><br> <input type="submit" value="전송">
	</form>
	<div id="message"></div>
</body>
</html>