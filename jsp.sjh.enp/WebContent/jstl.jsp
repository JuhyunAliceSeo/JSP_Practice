<%@page import="jsp_sjh_nvc.dto.DeptDto"%>
<%@page import="jsp.sjh.enp.DeptCPDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>	
	<c:set var="today" value="<%=new java.util.Date() %>" />
	<h1><fmt:formatDate value="${today}"/></h1><br>
	<h1><fmt:formatDate value="${today}" type="time"/></h1><br>
	<fmt:formatDate value="${today }" pattern="yyyy년 MM월 DD일 hh시 mm분 ss초"/><br />
    <fmt:formatDate value="${today }" pattern="yyyy년 MM월 DD일 EE요일 hh시 mm분 ss초"/><br />
    
    
    
    
    
	<hr>
	
	<c:set var = "num1" value="123456789123" />
	<pre><fmt:formatNumber value="${num1}" /></pre><br>
	<h1><fmt:formatNumber value="${num1}" type="currency"/></h1><br>
	
	<fmt:setLocale value="en_us"/>
	
	<hr>
	<!-- String name = "홍길동" -->
	<%
	String name = "홍길동";
	 %>
	 
	 <%-- <%=name %>
	 ${name} --%>
	 
	<c:set var ="name" value="홍길동"/>
	<!-- pageContext.setAttribute("name", "홍길동"); -->
	
	이름: <c:out value="${name}"/><br>
	이름: <c:out value="${'홍길동'}"/><br>
	이름: <c:out value="홍길동"/><br>
	${pageScope.name}<br>
	
	<c:remove var="name"/>
	이름(삭제):<c:out value="${name}"/><br>
	<!-- pageContext.removeAttribute("name") -->
	
	<hr />
	
	<!-- var error -->
	<c:catch var="error">
		<%=2/0%>
	</c:catch>
	<br />
	<c:out value="${error}" />
	
	<hr />
	
	<c:if test="${10 > 20}" var="result1">
		10은 20보다 크다.<br>	
	</c:if>
	result1 : ${result1}<br>
	
	<c:if test="${10 < 20}" var="result2">
		10은 20보다 크다.<br>	
	</c:if>
	result2 : ${result2}<br>
	
	<c:set var="userid" value="hello123" />
	<c:choose>
		<c:when test="${userid == 'admin'}">
		관리자페이지
		</c:when>
		<c:otherwise>	
			${userid}님 반갑습니다.
		</c:otherwise>
	</c:choose>	
<% 
	pageContext.setAttribute("numList", new String[]{"1","2","3"});
	List<String> fruits = new ArrayList<>();
	fruits.add("apple");
	fruits.add("kiwi");
	fruits.add("melon");
	
	pageContext.setAttribute("fruitsList", fruits);
	
	DeptCPDao dao = new DeptCPDao();
	List<DeptDto> dtos = dao.getDepts();
	
	pageContext.setAttribute("depts", dtos);
	
%>	
	<%-- <c:url>태그 = url만들때 사용한다.</c:url> --%>

	<c:url var="calcUrl" value="http://localhost:8000/calc">
		<c:param name="v1" value="10" />
		<c:param name="v2" value="20" />
		<c:param name="op" value="+" />
	</c:url>
	${calUrl}
	
	
	<hr>
	<ul>
	<c:forEach var="num" begin="1" end="10">
		<li>forEach 예제 ${num}</li>
	</c:forEach>
	</ul>			
	<hr>
		<table border="1">
			<tr>
				<td>부서번호</td>
				<td>부서이름</td>
				<td>부서위치</td>
			</tr>
			<c:forEach var ="dept" items="${depts}">
			<tr>
				<td>${dept.deptno}</td>
				<td>${dept.dname}</td>
				<td>${dept.loc}</td>
			</tr>
			</c:forEach>
		</table>
	

	<c:forEach var="num" items="${numList}">
	<H1>${num}</H1>
	</c:forEach>
	
	<hr />
	
	<c:forEach var="fruit" items="${fruitsList}">
	${fruit}
	</c:forEach>
	
	


</body>
</html>