<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>login_pro.jsp</title>
</head>
<body>
	<% 
		request.setCharacterEncoding("euc-kr"); 
	%>
	<%
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");

		if(id.equals("kim") && pw.equals("1234")){
			Cookie cookie_id = new Cookie("userID", id);
			Cookie cookie_pw = new Cookie("userPW", pw);
			
			response.addCookie(cookie_id);
			response.addCookie(cookie_pw);
			out.println("[" + id + "]�� �ݰ����ϴ�.<br><br>");
			out.println("<a href='my.jsp'>" + id + "���� ���� �������� �̵��մϴ�.</a> <br>");
			out.println("<a href='logout.jsp'>�α׾ƿ��մϴ�.</a> <br>");
		}
		else {
			out.println("<script>alert('���̵�� �н����尡 �ٸ��ϴ�.'); history.back();</script>");
		}
	%>
	
</body>
</html>