<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Session ����</title>
</head>
<body>
	<p><h4>---- ������ �����ϱ� �� ----</h4>
	
	<%
		String id = (String) session.getAttribute("userID");
		String pw = (String) session.getAttribute("userPW");
		out.println("������ ���� �̸� userID : " + id + "<br>");
		out.println("������ ���� �� userPW : " + pw + "<br>");
		
		session.removeAttribute("userID");
	%>
	
	<p><h4>---- ������ ������ �� ----</h4>
	
	<%
		id = (String) session.getAttribute("userID");
		pw = (String) session.getAttribute("userPW");
		out.println("������ ���� �̸� userID : " + id + "<br>");
		out.println("������ ���� �� userPW : " + pw + "<br>");
	%>
	
</body>
</html>