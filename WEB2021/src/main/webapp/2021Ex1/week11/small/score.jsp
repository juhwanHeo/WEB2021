<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>JSP ���� : score.jsp</title>
</head>
<body>
	<h2>JavaBeans�� �̿��� �л��� �̸��� ������ ����� ��ȸ ����</h2>
	<jsp:useBean id="score" class="com.week11.vo.ScoreBean" scope="page"></jsp:useBean>
	
	<hr>
	<h3>�̸��� ������ JavaBeans ScoreBean�� ����</h3><p>
	�̸� : <%= "ȫ�浿" %>,
	���� : <%= "78" %>
	<jsp:setProperty name="score" property="name"  value="ȫ�浿"/>
	<jsp:setProperty name="score" property="point" value="78"/>
	
	<hr>
	<h3>JavaBeans ScoreBean�� ����� ������ ��ȸ ���</h3><p>
	�̸� : <jsp:getProperty name="score" property="name" /> <br>
	���� : <jsp:getProperty name="score" property="point" /> <br>
	
</body>
</html>