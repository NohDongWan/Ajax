<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix = 'c'
				uri="http://java.sun.com/jsp/jstl/core"
 %>  



<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<%request.setCharacterEncoding("UTF-8"); %>
넘어온 이름은 ${param.name} 입니다<br>
넘어온 나이는 ${param.age} 입니다<br>
넘어온 주소는 ${param.address} 입니다<br>
</body>
</html>