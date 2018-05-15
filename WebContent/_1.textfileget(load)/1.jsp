<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src = "http://code.jquery.com/jquery-3.3.1.js"></script>
<title>sample1</title>


</head>
<script>
		$(function(){
			$.ajaxSetup({
				cache : false		//값이 안바뀔때 써주면좋다.
			});
			
			$("button").click(function(){//변경을 클릭하면
				$("button").text('로딩완료').css('color','red');
			
			//<p>태그 영역에 "sample1.txt" 의 내용을 불러옵니다.
			$("p").load("sample1.txt");
			
			$("pre").load("sample1.txt")
			});
		});
</script>
<button>변경</button>
<p>변경전 : 줄이 안바뀌어요</p>
<br>
<pre>변경전 : 줄이 바뀝니다.(입력한 대로 출력됩니다.)</pre>
<body>
</body>
</html>