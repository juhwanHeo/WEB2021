<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<% 
	request.setCharacterEncoding("euc-kr"); 
%>
<%
	String ko = request.getParameter("ko");
	String am = request.getParameter("am");
	out.println("������ ó�� ����Դϴ�.<br>");
	
	out.println("���۵� ko��" + ko + "�Դϴ�. <br>");
	out.println("���۵� am��" + am + "�Դϴ�. <br>");
	
%>

	
