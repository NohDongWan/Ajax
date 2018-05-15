<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-3.3.1.js"></script>
<title>Insert title here</title>
<script>
	/*  
	.done() : 요청이 성공적으로 처리되었을 때 발생하는 이벤트 메서드 입니다.
	.fail() : 요청이 실패했을때 발생하는 이벤트 메서드입니다.
	.always() : 요청에 대한 처리가 (성공했든 실패했든) 완료 되었을 때 발생하는 이벤트
	 */
	$(function() {
		$.ajaxSetup({
			cache : false
		});
		$('button').one('click',function(){ //버튼 한번만 클릭하게 하기.
					$.getJSON('item.json')

					.done(
							function(data, textStatus) {
								$('#treeData').append(
										"<tr><td>id</td><td>name</td><td>price</td>"
												+ "<td>description</td></tr>");
								$.each(data, function() {
									$("#treeData").append(
											"<tr>" + "<td>" + this.id + "</td>"
													+ "<td>" + this.name
													+ "</td>" + "<td>"
													+ this.price + "</td>"
													+ "<td>" + this.description
													+ "</td>" + "</tr>");
								});//each end
							})//done end
					.fail(function(data, status) {
						alert("error입니다." + status);
					})//fail end

					.always(function() {
						alert("A-잭스가 완료되었습니다")
					})//always end
				})//click end
	});//ready end
</script>
</head>
<body>
	<button>JSON 데이터를 불러옵니다.</button>
	<table border=1>
		<tbody id="treeData"></tbody>
	</table>
</body>
</html>