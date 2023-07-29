<%@page import="jsp.sjh.enp.DeptDao"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="jsp_sjh_nvc.dto.DeptDto"%>
<%@page import="java.util.List"%>
<%@page import="jsp_sjh_nvc.dto.DeptDto"%>
<%@page import="jsp.sjh.enp.DeptCPDao"%>
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
   /* DeptCPDao dao = new DeptCPDao(); */
   DeptDao dao = new DeptDao();
	/* dao.insertDept(50, "SALES", "SEOUL"); */
	// dao.deleteDept(50);
	/* dao.deleteDept(66); */


   List<DeptDto> dtos = dao.getDepts();

   for(DeptDto dto : dtos){
      out.print("부서번호 : " + dto.getDeptno() +
              " 직종이름 : " + dto.getDname() + 
              " 지역 : " + dto.getLoc() + "<br>");
   }
%>
</body>
</html>
