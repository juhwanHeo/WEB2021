<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Session ����</title>
</head>
<body>
	<h1>���� ����</h1>
	<hr>
	<h2>���� �ֿ� ���� ��ȸ</h2>
	���� ID (������ �ĺ���) : <%=session.getId() %><br>
	���� MaxInactiveInterval (�⺻ ���� ���� �ð�): <%=session.getMaxInactiveInterval() %><br>
	<% 
		long mseconds = session.getCreationTime();
		Date time = new Date(mseconds);
	%>

	���� CreationTime (1970�� 1�� 1�� 0�� ���� ���� �и�������): <%=mseconds %><br>
	���� CreationTime (�ð����� �ٽ� ���) : <%=time.toLocaleString()%> <br>
	
</body>
</html>