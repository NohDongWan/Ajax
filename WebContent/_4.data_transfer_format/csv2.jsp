<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-3.3.1.js"></script>
<title>Insert title here</title>


<script>
	/*
	 jQuery.get() = $.get()
	 - 서버에 데이터를 HTTP GET 방식으로 보내고 서버측 응답을 XML, CSV 형식으로 받습니다.
	 - $.get() 함수를 이용해서 data.csv 파일을 불러옵니다.
	 - $.get() 함수의 첫번재 매개변수에는 서버의 URL 주소를 지정합니다.
	 - $.get() 함수의 두번재 매개변수인 콜백함수를 이용해서 서버에서 보내온 csv 형식의 데이터를 input 으로 받습니다.
	 */
	$(function() {
		$.ajaxSetup({
			cache : false		//값이 안바뀔때 써주면좋다.
		});
		$("button").click(function() {	//버튼을 클릭하면
			//input 에는 data.csv 의 내용이 들어있습니다.
			$.get("data.csv",function(input){							//input 으로 받고
					input = input.split('\n');
					
					$("pre").empty(); //비웁니다.
					var str ="";
					str += "<table border = 1><tr><td>이름</td>"+"<td>지역</td>" + "<td>나이</td>"+"</tr>"
					//쉼표를 기준으로 자릅니다.

					
					for(var i = 0; i < input.length; i++){
					input[i] = input[i].split(',');
					str += "<tr>";
					for(var j=0; j<input[i].length; j++){
						input[i][j]=input[i][j].trim();
						 str += "<td>" + input[i][j]+"</td>"
					}
						str += "</tr>"
					}
					$("pre").append("</table>" + str);
				});
		});
	});
</script>
</head>
<body>
	
	<button>데이터 불러오기</button>
	<pre>변경전</pre>
</body>
</html>