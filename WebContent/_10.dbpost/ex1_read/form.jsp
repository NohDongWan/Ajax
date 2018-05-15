<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src = "http://code.jquery.com/jquery-3.3.1.js"></script>
<script>

$(document).ready(function(){
			//데이터를 보여주는 함수
	function selectData(){
		//#output 내부의 내용물을 제거합니다.
			$('#output').empty();
			//Ajax 를 수행합니다.
				$.getJSON('products.jsp',function(data){//data 는 서버에서 돌려받은 json 형식의 데이터	textStatus 는 성공했다는 메시지
					$(data).each(function(index,item){
						var output = '';
						output += "<tr>";
						output += "<td>" + item.ID +"</td>"
						output += "<td>" + item.NAME +"</td>"
						output += "<td>" + item.MODELNUMBER +"</td>"
						output += "<td>" + item.SERIES +"</td>"
						output += "</tr>";
						$("#output").append(output)
					});
				});
	};
			selectData();
})
</script>
<title>Insert title here</title>
</head>

<body>
	<div>
		<form id="insert_form">
			<fieldset>
				<legend>데이터 추가</legend>
					<table>
						<tr>
							<td><label>상품명</label></td>
							<td><input type="text" name="name" id="name"></td>
						</tr>
						
						<tr>
							<td><label>모델 번호</label></td>
							<td><input type="text" name="modelnumber" id="modelnumber"></td>
						</tr>
						
						<tr>
							<td><label>시리즈</label></td>
							<td><input type="text" name="series" id="series"></td>
						</tr>
					</table>
					<input type="submit" value="추가">
			</fieldset>
		</form>
	</div>
	<table border=1>
		<tbody id="output"></tbody>		
	</table>
</body>
</html>