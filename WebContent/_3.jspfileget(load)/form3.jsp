<!-- 

		폼의 값을 보내고 받고를 한페이지 안에서한다.


 -->


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-3.3.1.js"></script>
<title>Insert title here</title>
<style>
body {
	text-align: center
}
</style>

<script>
	$(function() {
		$('form')
				.submit(
						function(e) {//전송버튼 클릭시
							e.preventDefault();

							var check = 0;//이름에 포커스를 줄때는 check=0입니다.
							//나이에 포커스를 줄때는 check=0입니다.
							//주소에 포커스를 줄때는 check=0입니다.

							if ($("#name").val() == "") {//이름을 입력하지 않은 경우
								$("#name").attr("placeholder", "이름을 입력하세요");
								//이름에 포커스를 줍니다.
								$("#name").focus();
								check++;
							}

							if ($("#age").val() == "") {//이름을 입력하지 않은 경우
								$("#age").attr("placeholder", "나이를 입력하세요");
								//나이에 포커스를 줍니다.
								$("#age").focus();
								check++;
							}

							if ($("#address").val() == "") {//주소를 입력하지 않은 경우
								$("#address").attr("placeholder", "주소를 입력하세요");
								//이름에 포커스를 줍니다.
								$("#address").focus();
								check++;
							}

							//input 태그 중 빈 곳이 한곳이라도 있으면 placeholder 의 색상을 변경합니다.
							if (check != 0) {
								//placeholder 의 색상을 빨간색으로 변경하는 스타일을 head 태그 뒤에 추가합니다.
								$(
										"<style>input::-webkit-input-placeholder{color:red}</style>")
										.appendTo("head")//크롬
								$(
										"<style>input::-moz-input-placeholder{color:red;opacity:1}</style>")
										.appendTo("head")//파이어 폭스
								$(
										"<style>input::-ms-input-placeholder{color:red}</style>")
										.appendTo("head")//IE
							} else {
								$("style").remove(); //style 엘리먼트를 삭제합니다.
								//서버로 보낼 데이터를 폼에서 얻어옵니다.
								//입력 양식에 적힌 값을 쿼리 문자열로 바꿔줍니다.
								var data =$('form').serialize();		//데이터를 폼에서 얻어온다.
								$("div").load("process.jsp", data);
							}
						})
	})
</script>

</head>
<body>


	<form>
		<span>이름</span> <input type="text" placeholder="이름" id="name"
			name="name"><br> <span>나이</span> <input type="text"
			placeholder="나이" id="age" name="age"><br> <span>주소</span>
		<input type="text" placeholder="주소" id="address" name="address"><br>

		<input type="submit" value="전송"> <input type="reset"
			value="취소">
	</form>

	<div></div>


</body>
</html>