<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Cookie</title>
</head>
<body>
	
	<% 
		request.setCharacterEncoding("euc-kr"); 
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		if(id.equals("admin") && pw.equals("1234")){
			Cookie cookie_id = new Cookie("userID", id);
			Cookie cookie_pw = new Cookie("userPW", pw);
			
			response.addCookie(cookie_id);
			response.addCookie(cookie_pw);
			out.println("��Ű ������ �����߽��ϴ� <br>");
			out.println(id + "�� ȯ���մϴ�");
		}
		else {
			out.println("��Ű ������ �����߽��ϴ� ");
		}
	%>


</body>
</html>