<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Ex1.jsp</title>
</head>
<body>

	<% 
		request.setCharacterEncoding("euc-kr"); 
	%>
	<%
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
	%>

���̵� : <%= id %> <p>
��й�ȣ : <%= pw %> <p>

</body>
</html>