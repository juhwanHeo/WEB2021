<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>


<% 
	request.setCharacterEncoding("euc-kr"); 
String id = request.getParameter("id");
out.println("���۵� ���̵� : " + id + "<br>");
%>

<jsp:include page="Ex2reqto.jsp" flush="false"/>

<%
	String uname = request.getParameter("uname");
	
	out.println("���۵� ���̵� : " + uname + "<br>");
	
%>
