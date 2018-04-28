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
				.prepareStatement("SELECT * from coaches where coachName='" + name + "'");
		ResultSet rs = ps.executeQuery("select * from coaches where coachName='" + name + "'");
	%>
	<div class="component">
		<table border="1">
			<thead>
				<tr>
					<th>Name</th>
					<th>Season</th>
					<th>Team</th>
					<th>Games</th>
					<th>Wins</th>
				</tr>
			</thead>
			<%
				while (rs.next()) {
					String coachName = rs.getString("coachName");
					String season = rs.getString("season");
					String team = rs.getString("team");
					String games = rs.getString("games");
					String wins = rs.getString("wins");
			%>

			<tbody>
				<tr>

					<td>
						<%
							out.println(coachName);
						%>

					</td>
					<td>
						<%
							out.println(season);
						%>

					</td>
					<td>
						<%
							out.println(team);
						%>
					</td>
					<td>
						<%
							out.println(games);
						%>
					</td>
					<td>
						<%
							out.println(wins);
						%>
					</td>

				</tr>
				<%
					}
				%>

			</tbody>
		</table>

		click <a href="createCoaches.jsp?name=<%=name%>">
			<form method="post" action="addDataForPlayer.jsp">here</form>
		</a> to add more data for the coach --<a href="index.jsp">Main Page</a>
	</div>
</body>
</html>