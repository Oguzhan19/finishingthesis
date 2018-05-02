<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="css/styleeditArticles.css">
<div id="tabs">
	<ul>
		<li><a href="index.jsp"><span>Main Page</span></a></li>
		<li><a href="ShowAllPlayers.jsp"><span>Players</span></a></li>
		<li><a href="ShowAllCoaches.jsp"><span>Coaches</span></a></li>
		<li><a href="createArticles.jsp"><span>Create Artilces</span></a></li>
		<li><a href="logout.jsp"><span>Log Out</span></a></li>
	</ul>
</div>

</head>
<body>
	<form method="post" action="updateArticles-process.jsp">

		<%
			if ((session.getAttribute("username") == null) || (session.getAttribute("username") == "")) {
		%>
		You are not logged in! Please log in <a href="login.jsp">here.</a>
		<%
			} else {
		%>

		<%
			
		%>

		<%
			String un1 = (String) session.getAttribute("username");
				String Id = request.getParameter("id").toString();
				int idd = Integer.parseInt(Id);
				//out.println(idd);

				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/users", "root", "gunslinger");
				PreparedStatement ps = (PreparedStatement) con.prepareStatement("SELECT * from entries");
				ResultSet rs = ps.executeQuery("select * from entries where entryId = '" + idd + "'");

				while (rs.next()) {
					String un = rs.getString("username");
					//out.println(un);
		%>
		<input type="hidden" name="id" value="<%=rs.getString("entryId")%>">
		<input type="hidden" name="username"
			value="<%=rs.getString("username")%>">
		<div align="center">
			<table border="1" width="50%" cellpadding="4" bgcolor="#61ad75">
				<tr>
					<td><div align="center">
							<h2>Update data from database in jsp</h2>
						</div></td>
				</tr>
			</table>
			<br /> <br /> <br /> <br />
		</div>
		<form method="post" action="updateArticles-process.jsp">
			<div align="center">
				<table border="1" width="30%" cellpadding="5" bgcolor="#61ad75">
					<tr>
						<td><b>heading:</b><br> <input type="text"
							name="heading" value="<%=rs.getString("heading")%>"></td>
					</tr>
					<tr>
						<td><b>text:</b><br /> <textarea name="paragraph_text"
								cols="50" rows="10">
			<%=rs.getString("text")%></textarea></td>
					</tr>
					<tr>
						<td><div align="center">
								<input type="submit" value="submit">
							</div></td>
					</tr>
					<%
						}
						}
					%>
				</table>
			</div>
		</form>
	</form>
</body>
</html>
