<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>my.jsp</title>
</head>
<body>
	<% 
		request.setCharacterEncoding("euc-kr"); 
	%>
	<%
		Cookie[] cookies = request.getCookies();
		String userID = null;
		for(Cookie cookie : cookies){
			if(cookie.getName().equals("userID"))
				userID = cookie.getName();
		}
		
		if(userID != null) {
			out.println("�������� �������� ���Ű� ȯ���մϴ�.<br><br>");
			out.println("<a href='logout.jsp'>�α׾ƿ��մϴ�.</a> <br>");
		}
		else {
			out.println("<script>alert('��Ⱑ �������� �ʽ��ϴ�.'); location.href='login.jsp';</script>");
		}
	%>
	
</body>
</html>

