<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Ex3.jsp</title>
</head>
<body>

	<% 
		request.setCharacterEncoding("euc-kr"); 
	%>
	�� �������� 5�ʸ��� ���ΰ�ħ �˴ϴ�. <br><br> 
	
	<%
		response.setHeader("Refresh","5;URL=Ex3.jsp");
		out.println(new Date());
 	%>

</body>
</html>