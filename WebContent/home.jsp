<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Home</title>
</head>
<body>
<html>
<%
Class.forName("org.postgresql.Driver");
Connection conn = null;
String name = request.getParameter("name");
String age = request.getParameter("age");

try{
	String url = "jdbc:postgresql:cse135";
	String username = "moojin";
	String password = "pwd";
	conn = DriverManager.getConnection(url, username, password);
	
	Statement stmt = conn.createStatement();
	String sql = "INSERT INTO USERS (NAME, AGE) VALUES (" + name +", " + age + ")";
	stmt.executeUpdate(sql);
	stmt.close();
	conn.close();
	
}catch(Exception e){
	e.printStackTrace();
}
%>

<body>
	<div>Request Type : <%= request.getMethod() %></div>
	<div>My name : <%= name %></div>
	<div>My age : <%= Integer.parseInt(age) %></div>
</body>
</html>