<!-- 

		폼의 값을 보내고 받고를 한페이지 안에서한다.
		이것이 a-jax 이다..!
		
		 load() 의 첫번재 매개변수 는 가져올 곳 의 주소 , 보낼값이다.
		
		load("1.jsp",data);

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
	$(function() {				//onload 랑 똑같은거다 왜이걸 노이해
		$('form')
				.submit(
						function(e) {//전송버튼 클릭시
							e.preventDefault();												//안넘어가게 만들고 입력이안된상태에서 버튼을 눌렀을때 체크가 1씩 증가하게 만든다.

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
										"<style>input::-webkit-input-placeholder{color:red}</style>")									//브라우저마다 다르게 적용.
										.appendTo("head")//크롬
								$(
										"<style>input::-moz-input-placeholder{color:red;opacity:1}</style>")
										.appendTo("head")//파이어 폭스
								$(
										"<style>input::-ms-input-placeholder{color:red}</style>")
										.appendTo("head")//IE
							} else {
								$("style").remove(); //style 엘리먼트를 삭제합니다.																			//값이 입력되면 값이 없어서 적용됐던 스타일을 다없애준다.
								var data_name = "name=" + $("#name").val();																				//get방식으로 넘어간다.
								var data_age = "age=" + $("#age").val();
								var data_address = "address="
										+ $("#address").val();
								var data = data_name + "&" + data_age + "&"
										+ data_address;

								//쿼리 스트링 형식으로 파라미터의 이름과 값의 형태로 전달합니다.
								// $(div).load("process.jsp","name=love&age=21&address=서울시")
								$("div").load("process.jsp", data);													//get 방식으로 넘어간다 주소 뒤에 보낼 데이터 ?name=?&age=? 이런식으로
										
																														
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