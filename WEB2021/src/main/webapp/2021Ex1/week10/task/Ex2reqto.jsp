<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Ex2reqto.jsp</title>
</head>
<body>

	<% 
		request.setCharacterEncoding("euc-kr"); 
	%>
	<%
		String name = request.getParameter("name");
		String id = request.getParameter("id");
		String sex = request.getParameter("sex");
		String country = request.getParameter("country");
	%>
	
	<jsp:include page="Ex2hader.jsp">
		<jsp:param value="������" name="admin"/>
	</jsp:include>
	<div>-------------------------------</div>
	<div> �л� ���� �Է� ��� </div><br>
	���� : <%= name %> <br>
	�й� : <%= id %> <br>
	���� : <%= sex %> <br>
	���� : <%= country %> <br>
	<div>-------------------------------</div>
	<jsp:include page="Ex2footer.jsp"/>
</body>
</html>