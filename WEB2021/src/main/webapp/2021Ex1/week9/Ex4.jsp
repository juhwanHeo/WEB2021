<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Ex4.jsp</title>
</head>
<body>

	<% 
		request.setCharacterEncoding("euc-kr"); 
	%>
	<%
		String name = request.getParameter("name");
		String id = request.getParameter("id");
		String sex = request.getParameter("sex");
		String country = request.getParameter("country");
	%>
	<h3> �л� ���� �Է� ��� </h3>
	���� : <%= name %> <br>
	�й� : <%= id %> <br>
	���� : <%= sex %> <br>
	���� : <%= country %> <br>
</body>
</html>