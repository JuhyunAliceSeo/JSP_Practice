<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	applicationScope : ${ applicationScope.application_name }<br />
   sessionScope : ${ sessionScope.session_name }<br />
   pageScope : ${ pageScope.page_name }<br />
   requestScope : ${ requestScope.request_name }
   
   <!-- 값 입력하면 page부분이 사라짐 ! page content 는 페이지 내에서만 뿌림  -->
   <!-- request는 포워딩 시켜야 나옴 ! -->

</body>
</html>