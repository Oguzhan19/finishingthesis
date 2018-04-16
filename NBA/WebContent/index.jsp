<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome to main page</title>
<link rel="stylesheet" href="css/styleeditArticles.css">
</head>
<body>
	<form method="post" action="read.jsp">
		<table border="1" width="40%" cellpadding="3" bgcolor="#61ad75"
			align="center">
			<tr>
				<td>Welcome to the nba website!! <a href="reg.jsp">
						register</a> or <a href="login.jsp"> login</a>
				</td>
			</tr>
		</table>
		<br />

		<%
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/users", "root", "gunslinger");
			PreparedStatement ps = (PreparedStatement) con.prepareStatement("SELECT * from entries");
			PreparedStatement ps2 = (PreparedStatement) con.prepareStatement("SELECT * from teams");
			ResultSet rs = ps.executeQuery("select * from entries ");
			ResultSet rs2 = ps2.executeQuery("select * from teams ");

			while (rs2.next()) {
				String tname = rs2.getString("teamName");
		%>
		<table border="1" width="40%" cellpadding="3" bgcolor="#61ad75"
			align="center" cellspacing="10">
			<tbody>
				<tr>
					<td><a href="team.jsp?id=<%=rs2.getString("id")%>">
							<form method="post" action="team.jsp">
								<%
									out.println(tname);
								%>
							</form>
					</a></td>
				</tr>
			</tbody>
		</table>
		
		<%
			}
		%>
		<%
			while (rs.next()) {

				Object usrname = rs.getObject("username");
				String id = rs.getString("entryId");
				//out.println(id);
				String heading = rs.getString("heading");
				String text = rs.getString("text");
		%>

		<br /> <br />
		<table border="1" width="30%" cellpadding="5" bgcolor="#61ad75"
			align="center">
			<tbody>
				<tr>
					<td><a
						href="readArticles.jsp?id=<%=rs.getString("entryId")%>&?username=<%=rs.getString("username")%>">
							<form method="post" action="readArticles.jsp">

								<%
									out.println("Entry Id : " + id);
								%>
							</form>
					</a></td>
				</tr>
				<tr>
					<td>
						<%
							out.println("Username : " + usrname);
						%>
					</td>
				</tr>
				<tr>
					<td>
						<%
							out.println("Heading : " + heading);
						%>
					</td>
				</tr>
				<tr>
					<td>
						<%
							out.println("text: " + text);
						%> <br />
					</td>

				</tr>
			</tbody>
		</table>
		<%
			}
		%>


	</form>
</body>
</html>
