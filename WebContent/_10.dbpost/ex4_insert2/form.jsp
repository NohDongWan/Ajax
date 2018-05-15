<!--  
			products2 에서 put에담고 array 로 보내줘야된다.
			담은 걸 out 으로 넘겨준다.


-->

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
			var data =$("#insert_form").serialize();
			//Ajax 를 수행합니다.
				$.getJSON('products2.jsp',data,function(rdata){
					$(rdata).each(function(index,item){
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
	
	//초기화면에 데이터를 표시합니다.
			selectData();
			$('#insert_form').submit(function(event){
				if($("#name").val()==""){
					alert("아이디를입력하세요.");
					return false;
				}
				
				if($("#modelnumber").val()==""){
					alert("모델 번호를 입력하세요.");
					return false;
				}
				
				if($("#series").val()==""){
					alert("시리즈를 입력하세요.");
					return false;
				}
			selectData();
			
			event.preventDefault();
			})
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