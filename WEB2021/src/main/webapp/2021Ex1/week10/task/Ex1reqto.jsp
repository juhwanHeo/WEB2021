<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Ex1reqto.jsp</title>
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
	���� : <%= name %> <br><br>
	�й� : <%= id %> <br><br>
	���� : <%= sex %> <br><br>
	���� : <%= country %> <br>
</body>
</html>