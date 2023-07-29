<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%-- 	<h1>${10}</h1>></br>

	
	<h1>${99.99}</h></br>
	<h1>${"abc"}</h1></br>
	<h1>${true }</h1></br>
	<hr>
	<h1>${1+2 }</h1></br>
	<h1>${1-2 }</h1></br>
	<h1>${1/2 }</h1></br>
	<h1>${1<2 }</h1></br>
	${ (1>2) ?1 :2 } <br />
	${ (1>2) || (1<2)} <br />
	
	<h1><%=10 %></h1></br>	 --%>
	
<jsp:useBean id="dept" class="jsp_sjh_nvc.dto.DeptDto" />
<jsp:setProperty name="dept" property="deptno" value="88" />
<jsp:setProperty name="dept" property="loc" value="대구" />
<jsp:setProperty name="dept" property="dname" value="세일즈" />

<hr> <!-- 객체접근 -->
${dept.deptno}<br>
${dept.loc}<br>
${dept.dname}<br>

${dept.getDeptno()}<br>
${dept.getLoc()}<br>
${dept.getDname()}<br>

<jsp:setProperty name="dept" property="deptno" />
<jsp:setProperty name="dept" property="loc" />
<jsp:setProperty name="dept" property="dname" />


</body>
</html>
