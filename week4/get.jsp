<!DOCTYPE html>
<html lang="ko">
<head>
	<title> Hello, JSP </title>
	<meta charset="utf-8">
    <link rel="stylesheet" href="style.css" type="text/css">
</head>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="java.sql.*" %>

<!-- global var for JSP -->
<%!
	String email="";
	String name="";
%>


<body>
<div id="req"> 
	<h1> 입력받은 데이터: 
<%
	request.setCharacterEncoding("UTF-8");
	name = request.getParameter("name");
	email = request.getParameter("email");
	out.print(name + ", " + email);
%>
	</h1>
</div>
<div id="db">
<%
	String url = "jdbc:mysql://localhost/popidb";
	String user = "popi";
	String pw = "db1004";
	Connection conn;
	Statement stmt;
	PreparedStatement pstmt;
	String insert, select;
	try {
		Class.forName("com.mysql.jdbc.Driver");
	} catch (ClassNotFoundException e) {
	out.println("<h1>500</h1>");
	out.println("<p>Driver Error: " + e.getMessage() +"</p>");
	}
	try {
		conn = DriverManager.getConnection(url, user, pw);
		select = "SELECT name, email FROM user";
		insert = "INSERT INTO user (name, email) VALUES(?,?)";
		stmt = conn.createStatement();
		pstmt = conn.prepareStatement(insert);

		//insert
		pstmt.setString(1, name);
		pstmt.setString(2, email);
		pstmt.execute();

		//select
		ResultSet rs = stmt.executeQuery(select);
		out.println("<div><ul>");
		while (rs.next()) {
			email = rs.getString("email");
			name = rs.getString("name");
			out.println("<li>" + name + ", " + email +"</li>" );
		}
		out.println("</ul></div>");

	} catch (SQLException e) {
		out.println("<h1>500</h1>");
		out.println("<p>SQL Error: " + e.getMessage() +"</p>");
	}
%>
</div>
</body>
</html>
