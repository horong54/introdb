<!DOCTYPE html>
<html>
<title> Hello, JSP
</title>
<body>
<div id="star">
<%
for (int i = 0; i < 10; i++) {
	for (int j = 0; j < i; j++) {
		out.print("*");
	}
	out.println("<br>");
}
%>
</div>
</body>
</html>
