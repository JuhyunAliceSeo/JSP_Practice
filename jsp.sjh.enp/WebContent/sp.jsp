<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

  <% 
      application.setAttribute("application_name", "application_value");
      session.setAttribute("session_name", "session_value");
      pageContext.setAttribute("page_name", "page_value");
      request.setAttribute("request_name", "request_value");
   %>
   
   <jsp:forward page="ok.jsp"/>
   
   applicationScope : ${ applicationScope.application_name }<br />
   sessionScope : ${ sessionScope.session_name }<br />
   pageScope : ${ pageScope.page_name }<br />
   requestScope : ${ requestScope.request_name }

</body>
</html>
