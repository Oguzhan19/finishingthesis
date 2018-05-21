<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Players</title>
<link rel="shortcut icon" href="../favicon.ico">
<link rel="stylesheet" type="text/css" href="css/normalize.css" />
<link rel="stylesheet" type="text/css" href="css/demo.css" />
<link rel="stylesheet" type="text/css" href="css/component.css" />
<%
	/*Navigation Menu*/
%>
<div id="tabs">
	<ul>
		<li><a href="index.jsp"><span>Main Page</span></a></li>
		<li><a href="ShowAllCoaches.jsp"><span>Coaches</span></a></li>
		<li><a href="teams.jsp"><span>Teams</span></a></li>
		<li><a href="login.jsp"><span>Login</span></a></li>
		<li><a href="registration.jsp"><span>Registration</span></a></li>
	</ul>
</div>
<%
	/*Navigation Menu*/
%>
<br />
</head>
<body>
	<%
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/users", "root", "gunslinger");
		PreparedStatement ps = (PreparedStatement) con.prepareStatement("SELECT * from players");
		ResultSet rs = ps.executeQuery("select distinct name from players ");
	%>
	<br />
	<br />
	<%
		/*Search Button*/
	%>
	<div class="container">
		<form class="form-inline" method="post" action="showthePlayer.jsp">
			<input type="text" name="name" class="form-control"
				placeholder="Search name..">
			<button type="submit" name="save" class="btn btn-primary">Search</button>
		</form>
	</div>
	<%
		/*Search Button*/
	%>
	<div class="component">
		<table border="1">
			<%
				while (rs.next()) {
					String playername = rs.getString("name");
			%>

			<tr>
				<td><a href="showthePlayer.jsp?name=<%=playername%>">
						<form method="post" action="addDataForPlayer.jsp">
							<%
								out.println(playername);
							%>
						</form>
				</a></td>
			</tr>

			<%
				}
			%>
		</table>
		<a href="index.jsp">Main Page</a>
	</div>
</body>
</html>