<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Ex2hader.jsp</title>
</head>
<body>

	<% 
		request.setCharacterEncoding("euc-kr"); 
		String admin = request.getParameter("admin");
	%>
	1) ������ : <%= admin %> <br>
	2) ���� ���ӽð� : <%= new Date() %>
</body>
</html>