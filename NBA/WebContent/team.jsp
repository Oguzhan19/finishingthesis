<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Team Page</title>
<link rel="stylesheet" href="css/stylereadArticles.css">
</head>
<body>
	<form method="post" action="read.jsp">

		<%
			if ((session.getAttribute("username") == null) || (session.getAttribute("username") == "")) {
		%>
		Click <a href="home.jsp"> here</a> to go back to main page
		<%
			} else {
		%>

		<%
			
		%>
		You can crate some players and discuss about the topic <a
			href="createPlayer.jsp">here!</a>

		<%
			}
		%>

		<%
			String Id = request.getParameter("id").toString();
			int idd = Integer.parseInt(Id);
			out.println(idd);

			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/users", "root", "gunslinger");
			PreparedStatement ps = (PreparedStatement) con.prepareStatement("SELECT * from teams");
			ResultSet rs = ps.executeQuery("select * from teams where id = '" + idd + "'");
		%>

		<table border="1" width="30%" cellpadding="5">
			<tbody>
				<%
					while (rs.next()) {
						String teamName = rs.getString("teamName");
						String city = rs.getString("city");
						String homeArena = rs.getString("homeArena");
						String foundedAt = rs.getString("foundedAt");
						String owners = rs.getString("owners");
				%>
				<tr>
					<td>
						<%
							out.println("Team Name : " + teamName);
						%>

					</td>
				</tr>
				<tr>
					<td>
						<%
							out.println("City : " + city);
						%>
					</td>
				</tr>
				<tr>
					<td>
						<%
							out.println("Home Arena : " + homeArena);
						%>
					</td>
				</tr>

				<tr>
					<td>
						<%
							out.println("Founded in: " + foundedAt);
						%>
					</td>
				</tr>
				<tr>
					<td>
						<%
							out.println("Owners : " + owners);
						%>
					</td>
				</tr>


				<%
					if ((session.getAttribute("username") == null) || (session.getAttribute("username") == "")) {
				%>

				<tr>
					<td>go back to <a href="index.jsp"> main </a> page
				</tr>
				</td>
				<%
					} else {
				%>
				<tr>
					<td><a
						href="deleteArticles.jsp?id=<%=rs.getString("entryId")%>"
						align="right">
							<form method="post" action="delete.jsp"></form>delete
					</a> <a href="editArticles.jsp?id=<%=rs.getString("entryId")%>"
						align="left">
							<form method="post" action="edit.jsp"></form>edit
					</a></td>
				</tr>
				<%
					}
					}
				%>
			</tbody>
		</table>
	</form>
</body>
</html>
