<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Session</title>
</head>
<body>
	<% 
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		if(id.equals("admin") && pw.equals("1234")){
			session.setAttribute("userID", id);			
			session.setAttribute("userPW", pw);		
			out.println("���� ������ �����߽��ϴ� <br>");
			out.println(id + "�� ȯ���մϴ�");
		}
		else {
			out.println("���� ������ �����߽��ϴ� ");
		}
	%>
</body>
</html>