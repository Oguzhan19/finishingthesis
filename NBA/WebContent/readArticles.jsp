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
		<li><a href="createArticles.jsp"><span>Create Artilces</span></a></li>
	</ul>
</div>
</head>
<body>
	<form method="post" action="read.jsp">

		<%
			if ((session.getAttribute("username") == null) || (session.getAttribute("username") == "")) {
				%>
		Click <a href="index.jsp"> here</a> to go back to main page
		<%
			} else {
		%>

		<%
			
		%>
		You can crate some titles and discuss about the topic <a
			href="create.jsp">here!</a>

		<%
			}
		%>

		<%
			String Id = request.getParameter("id").toString();
			int idd = Integer.parseInt(Id);
			//out.println(idd);

			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/users", "root", "gunslinger");
			PreparedStatement ps = (PreparedStatement) con.prepareStatement("SELECT * from entries");
			ResultSet rs = ps.executeQuery("select * from entries where entryId = '" + idd + "'");
		%>

		<table border="1" width="30%" cellpadding="5">
			<tbody>
				<%
					while (rs.next()) {
						String usrname = rs.getString("username");
						String id = rs.getString("entryId");
						String heading = rs.getString("heading");
						String text = rs.getString("text");
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
