<!DOCTYPE html>
<html lang="ko">
<head>
<title> Hello, JSP </title>
<meta charset="utf-8">
</head>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="java.sql.*" %>

<body>
<div>
<%
	boolean success=true;
	String url = "jdbc:mysql://localhost/popidb";
	String user = "popi";
	String pw = "db1004";
	Connection conn;
	Statement stmt;
	String sql;
	try {
		Class.forName("com.mysql.jdbc.Driver");
	} catch (ClassNotFoundException e) {
	success =false;
	out.println("<h1>500</h1>");
	out.println("<p>Driver Error: " + e.getMessage() +"</p>");
	}
	if(success)
		out.println("Driver OK");
	try {
		conn = DriverManager.getConnection(url, user, pw);
		sql = "SELECT * FROM stu";
		stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		out.println("<div><ul>");
		while (rs.next()) {
			int id = rs.getInt(1);
			String name = rs.getString("name");
			out.println("<li>" + id + ":" + name +"</li>" );
		}
		out.println("</li></div>");

	} catch (SQLException e) {
		out.println("<h1>500</h1>");
		out.println("<p>SQL Error: " + e.getMessage() +"</p>");
	}
%>
</div>
</body>
</html>
