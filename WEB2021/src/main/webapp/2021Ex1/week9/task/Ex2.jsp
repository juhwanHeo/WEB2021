<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Ex2.jsp</title>
</head>
<body>

	<% 
		request.setCharacterEncoding("euc-kr"); 
	%>
	<%
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		if(id.equals("������") && pw.equals("1234")) {
	%>
		�̸� : <%= id %> <br>
		Ŭ���̾�Ʈ IP: <%= request.getRemoteAddr() %> <br>
		��û ���� ����: <%= request.getContentLength() %> <br>
		��û ���� ���۹��: <%= request.getMethod() %> <br>
		��û URI: <%= request.getRequestURI() %> <br>
		���� �̸�: <%= request.getServerName() %> <br>
		���� ��Ʈ: <%= request.getServerPort() %> <br>
	<% 
		} else { 
			out.println("[" + id + "]���� �����ڰ� �ƴմϴ�.");
		}
	%>

</body>
</html>