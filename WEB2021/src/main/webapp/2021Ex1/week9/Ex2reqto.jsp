<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<% 
	request.setCharacterEncoding("euc-kr"); 
%>
<%
	String pw = request.getParameter("pw");
	out.println("���۵� �н����� : " + pw + "<br>");
%>
