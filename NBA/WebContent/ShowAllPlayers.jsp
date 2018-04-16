<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Players</title>
</head>
<body>
	<%
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/users", "root", "gunslinger");
		PreparedStatement ps = (PreparedStatement) con.prepareStatement("SELECT * from players");
		ResultSet rs = ps.executeQuery("select * from players ");
		while (rs.next()) {
			String playername = rs.getString("name");
			String playerid = rs.getString("id");
	%>
	<table border="1">
		<tr>
			<td><a href="addDataForPlayer.jsp?id=<%=playerid%>">
					<form method="post" action="addDataForPlayer.jsp">
						<%
							out.println(playername);
						%>
					</form>
			</a></td>
			<%
				}
			%>
		</tr>
	</table>
</body>
</html>