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
			} else {
		%>
		You can crate some players and discuss about the topic <a
			href="createPlayer.jsp">here!</a>
		<%
			}
			String Id = request.getParameter("id").toString();
			int idd = Integer.parseInt(Id);
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
					</td>
				</tr>

				<%
					}
						PreparedStatement ps1 = (PreparedStatement) con.prepareStatement("SELECT distinct name from players");
						ResultSet rs1 = ps1.executeQuery(
								"select distinct name from players where team = '" + teamName + "' and season='2017-2018'");
						PreparedStatement ps2 = (PreparedStatement) con
								.prepareStatement("SELECT distinct coachName from coaches");
						ResultSet rs2 = ps2.executeQuery("select distinct coachName from coaches where team = '" + teamName
								+ "' and season='2017-2018'");
				%>
				<table border="1" width="30%" cellpadding="5">
					<tbody>
						<tr>
							<td>Team Roster</td>
						</tr>
						<%
							while (rs2.next()) {
									String coachname = rs2.getString("coachName");
									%>
						<tr>
							<td>
								The Coach : <a href="showtheCoach.jsp?name=<%=coachname%>">
						<form method="post" action="addDataForPlayer.jsp">
							<%
								out.println(coachname);
							%>
						</form>
				</a>
							</td>
						</tr>
						<% 
								}
						%>
						<%
							while (rs1.next()) {
									String playername = rs1.getString("name");
						%>
						<tr>
							<td>
								<a href="showthePlayer.jsp?name=<%=playername%>">
						<form method="post" action="addDataForPlayer.jsp">
							<%
								out.println(playername);
							%>
						</form>
				</a>
							</td>
						</tr>

						<%
							}
						%>
					</tbody>
				</table>
				<%
					}
				%>
			</tbody>
		</table>
	</form>
</body>
</html>
