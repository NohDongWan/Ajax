<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-3.3.1.js"></script>
<title>Insert title here</title>
</head>


<script>
	/*
		-$.get() 메서드를 이용해서 item.xml 파일을 불러옵니다.
		-$.get() 메서드의 첫번째 매개변수에는 서버의 URL 주소를 지정합니다
		-$.get() 메서드의 두번째 매개변수인 콜백함수를 이용해서 서버에서 보내온 XML 형식의 데이터를 data 로 받습니다.
	*/

	$(function(){
		$("button").click(function(){		//버튼을클릭하면
			$.get('items.xml',function(data){
			
				//data에는 item.xml 의 내용이 들어있습니다.
				$("#treeData").append(
					"<tr><td>id</td><td>name</td><td>price</td>"
						+"<td>description</td></tr>");
				
				//서버에서 얻어온 데이터에서 셀렉터로 item 태그를 찾습니다.
				$(data).find('item')
				.each(function(){
					//each() : 반복 하는 메서드로 item 을 찾을 때마다 반복해서 아래 문장들을 수행한다
					//6개의 item 태그 중 현재 처리중인 item 태그를 this 로 접근합니다.
					//$(this)를 사용하여 jQuery 객체를 생성합니다.
					$("#treeData").append(
						"<tr>"
						+"<td>" + $(this).attr("id") + "</td>"
						+"<td>" + $(this).attr("name") + "</td>"
						+"<td>"
						+$(this).find("price").text() + "</td>"
						+"<td>" + $(this).find("description").text() + "</td>"
						+ "</tr>");
					
					
					   /*
			           $(this).attr("id")               :   속성 id의 값을 구해옵니다.
			           $(this).find("price")            :   price 태그를 찾습니다.
			           $(this).find("price").text()       : price 태그 사이의 값을 구해옵니다.
			           $(this).find("description")          : description 태그를 찾습니다.
			           $(this).find("description").text()    : description 태그 사이의 값을 구해옵니다.
			           */   
					
					
				})
			})
		})
	})
</script>


<body>





<button>XML 형식으로 데이터 가져옵니다.</button>

<!-- <table id = "treeData"></table>  -->
<table border = 1>
	<tbody id="treeData"></tbody>
</table>



</body>
</html>