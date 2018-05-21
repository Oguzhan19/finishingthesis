<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>
	<%
		String name = request.getParameter("name");
		out.println(name);
	%>
</title>
<link rel="shortcut icon" href="../favicon.ico">
<link rel="stylesheet" type="text/css" href="css/normalize.css" />
<link rel="stylesheet" type="text/css" href="css/demo.css" />
<link rel="stylesheet" type="text/css" href="css/component.css" />

</head>
<body>
	<%
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/users", "root", "gunslinger");
		PreparedStatement ps = (PreparedStatement) con
				.prepareStatement("SELECT * from players where name='" + name + "'");
		ResultSet rs = ps.executeQuery("select * from players where name='" + name + "'");
	%>
	<div class="container">
		<table border="1">
			<thead>
				<tr>
					<th>Name</th>
					<th>Team</th>
					<th>Season</th>
					<th>BirtDate</th>
					<th>Points</th>
					<th>Rebounds</th>
					<th>Assists</th>
					<th>Steals</th>
					<th>Blocks</th>
					<th>Turnovers</th>
					<th>Minutes</th>
					<th>Total Games</th>
				</tr>
			</thead>
			<%
				while (rs.next()) {
					String playername = rs.getString("name");
					String team = rs.getString("team");
					String season = rs.getString("season");
					String birthDate = rs.getString("birthDate");
					String points = rs.getString("points");
					String rebounds = rs.getString("rebounds");
					String assists = rs.getString("assists");
					String steals = rs.getString("steals");
					String blocks = rs.getString("blocks");
					String turnovers = rs.getString("turnovers");
					String minutes = rs.getString("minutes");
					String gamesinTotal = rs.getString("gamesinTotal");
					int approval = rs.getInt("approval");
					if (approval == 0) {
			%>
			<b>There are contributions for the selected player which are not
				approved yet!</b>
			<%
				}
					if (approval == 1) {
			%>

			<tbody>
				<tr>

					<td>
						<%
							out.println(playername);
						%>

					</td>
					<td>
						<%
							out.println(team);
						%>

					</td>
					<td>
						<%
							out.println(season);
						%>
					</td>
					<td>
						<%
							out.println(birthDate);
						%>
					</td>
					<td>
						<%
							out.println(points);
						%>
					</td>
					<td>
						<%
							out.println(rebounds);
						%>
					</td>
					<td>
						<%
							out.println(assists);
						%>
					</td>
					<td>
						<%
							out.println(steals);
						%>
					</td>
					<td>
						<%
							out.println(blocks);
						%>
					</td>
					<td>
						<%
							out.println(turnovers);
						%>
					</td>

					<td>
						<%
							out.println(minutes);
						%>
					</td>
					<td>
						<%
							out.println(gamesinTotal);
						%>
					</td>
				</tr>
				<%
					}
				%>

			</tbody>
			<%
				}
			%>
		</table>

		click <a href="createPlayer.jsp?name=<%=name%>">
			<form method="post" action="addDataForPlayer.jsp">here</form>
		</a> to add more data for the player --<a href="index.jsp">Main Page</a>
	</div>
</body>
</html>