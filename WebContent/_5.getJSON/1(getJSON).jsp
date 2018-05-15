<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-3.3.1.js"></script>
<title>Insert title here</title>
  <script>
 
  /*  
  	-JSON 은 Javascript Object Notation 의 약어로 XML 데이터를 대신하기 위해서
  	사용됩니다.
  	-JSON 은 키와 값을 쌍으로 가지는 구조입니다.
  	-배열을 사용할 때는 대괄호([ ])안에 중괄호({ })를 사용하여 조합합니다.
  		이를 로드할 수 있는 $.getJSON() 메서드를 제공합니다.
  	
  	-서버로 부터 get 방식의 요청을 하고, 응답을 JSON 형식으로 받기 위해서
  		$.getJON() 메서드를 사용합니다.
  	-$.getJSON() 메서드의 첫번째 매개변수는 서버의 URL 주소를 지정합니다.
  		('item.json')
  	-서버로 요청이 성공적으로 완료되면,
  	     두번째 매개변수로 기술한 콜백함수가 호출됩니다.
  	    (function(data, textStatus))
  	     콜백함수의 첫번째 매개변수인 data는 서버에서 돌려받은 JSON 객체 형식의 데이터이고,
  	     두번째 매개변수인 textStatus는 성공일때 "success" 라는 문자열이 전달됩니다.
  	     
  	     
  	     
  	     자바 스크립트의 JSON 객체는 JSON 데이터를 자바스크립트 객체로 변환할 수 있습니다.
  	     또한 자바스크립트 객체를 문자열로 반환하기도 합니다.
  	     - JSON.stringfy() 메서드는 자바스크립트 객체를 JSON 형식의 문자열로 변환합니다.
  	     이를 이용해서 자바스크립트 객체를 브라우저로부터 다른 애플리케이션으로 전송할 수 있습니다
  	     
  	     -JSON.parse() 메서드는 JSON 데이터를 브라우저가 사용할 수 있는 자바스크립트 객체로 변환합니다.
  */
  
  
  //각각 일때는 디스로 바로접근해야한다.
  $(function(){
	  $('button').click(function(){	//버튼을 클릭하면
		  
		  $.getJSON('item.json',function(data, textStatus){
			 //.getJSON() 을 사용할 경우에는 키를 알고 있어야 값을 구할 수 있습니다.
			 $('#treeData').append(
					 "<tr><td>id</td><td>name</td><td>price</td>"
						+"<td>description</td></tr>");
			$(data).each(function(){
				$("#treeData").append(
				"<tr>"
				+"<td>" + this.id +"</td>"
				+"<td>" + this.name +"</td>"
				+"<td>" + this.price +"</td>"
				+"<td>" + this.description +"</td>"
				+"</tr>");
			})
			 
			
		/* 	$.each(data,function(){	//each 반복함수 *data 끝까지 반복)		//이방법도가능
			//each() : 반복 하는 메서드로 객체6개에 대해서 처리합니다.
			//6개의 객체 중에서 현재 처리 중인 것을 this 로 접근합니다.
			//this.id 는 현재 처리중인 객체의 id 키 값을 의미합니다.
				$("#treeData").append(
						"<tr>"
						+"<td>" + this.id +"</td>"
						+"<td>" + this.name +"</td>"
						+"<td>" + this.price +"</td>"
						+"<td>" + this.description +"</td>"
						+"</tr>");
			}) */
		  });
		  
	  })
  })
  
  
  
  
  
  
  
  
  
  
  
  
  </script>
</head>
<body>
  <button>JSON 데이터를 불러옵니다.</button>
    <table border=1>
    	<tbody id="treeData"></tbody>
    </table>
</body>
</html>