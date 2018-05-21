
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Teams</title>
<link rel="stylesheet" href="css/styleeditArticles.css">
<link rel="stylesheet" href="css/pagination.css">
</head>
<div id="tabs">
	<ul>
	    <li><a href="index.jsp"><span>Main Page</span></a></li>
		<li><a href="ShowAllPlayers.jsp"><span>Players</span></a></li>
		<li><a href="ShowAllCoaches.jsp"><span>Coaches</span></a></li>
		<li><a href="login.jsp"><span>Login</span></a></li>
		<li><a href="registration.jsp"><span>Registration</span></a></li>
       
	</ul>
</div>

<body>
  <br /> <br />
	<%
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/users", "root", "gunslinger");
		PreparedStatement ps = (PreparedStatement) con.prepareStatement("SELECT * from teams");
		ResultSet rs = ps.executeQuery("select * from teams ");

		while (rs.next()) {
			String tname = rs.getString("teamName");
	%>
	<table border="1" width="40%" cellpadding="3" bgcolor="#61ad75"
		align="center" cellspacing="10">
		<tbody>
			<tr>
				<td><a href="team.jsp?id=<%=rs.getString("id")%>">
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
</body>
</html>