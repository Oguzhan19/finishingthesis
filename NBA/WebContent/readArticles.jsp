<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Read the title here</title>
<link rel="stylesheet" href="css/stylereadArticles.css">
<div id="tabs">
	<ul>
		<li><a href="index.jsp"><span>Main Page</span></a></li>
		<li><a href="ShowAllPlayers.jsp"><span>Players</span></a></li>
		<li><a href="ShowAllCoaches.jsp"><span>Coaches</span></a></li>
		<%
			if ((session.getAttribute("username") == null) || (session.getAttribute("username") == "")) {
		%>
		<li><a href="login.jsp"><span>Login</span></a></li>
		<li><a href="registration.jsp"><span>Registration</span></a></li>
		<%
			} else {
		%>
		<li><a href="profile.jsp"><span>Profile</span></a></li>
		<li><a href="createArticles.jsp"><span>Create an
					Article</span></a></li>
		<li><a href="createPlayer.jsp"><span>Create Player</span></a></li>
		<li><a href="createCoaches.jsp"><span>Create Coach</span></a></li>
		<li><a href="logout.jsp"><span>Log Out</span></a></li>
		<%
			}
		%>
	</ul>
</div>
</head>
<body>
	<form method="post" action="read.jsp">

		<br /> <br />
		<%
			String Id = request.getParameter("id").toString();
			//String at = request.getParameter("username");
			int idd = Integer.parseInt(Id);
			//out.println(idd);

			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/users", "root", "gunslinger");
			PreparedStatement ps = (PreparedStatement) con.prepareStatement("SELECT * from entries");
			ResultSet rs = ps.executeQuery("select * from entries where entryId = '" + idd + "'");
		%>
		<br /> <br />
		<table border="1" width="30%" cellpadding="5">
			<tbody>
				<%
					while (rs.next()) {
						String usrname = rs.getString("username");
						String id = rs.getString("entryId");
						String heading = rs.getString("heading");
						String text = rs.getString("text");
						if ((session.getAttribute("username") == null) || (session.getAttribute("username") == ""))
							text = "*****";
				%>
				<tr>
					<td>
						<%
							out.println("Entry Id : " + id);
						%>

					</td>
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
								String at = (String) session.getAttribute("username");
								boolean answer;
								if (at == null) {
									answer = false;
								} else {
									answer = at.equals(usrname);
								}
						%>
					</td>
				</tr>


				<%
					if (answer == true) {
				%>
				<tr>
					<td><a
						href="deleteArticles.jsp?id=<%=rs.getString("entryId")%>">
							<form method="post" action="delete.jsp"></form>delete
					</a> <a href="editArticles.jsp?id=<%=rs.getString("entryId")%>">
							<form method="post" action="edit.jsp"></form>edit
					</a></td>
				</tr>
				<%
					}
						if (answer == false || at == null) {
				%>


				<%
					}
					}
				%>
			</tbody>
		</table>
	</form>
</body>
</html>
