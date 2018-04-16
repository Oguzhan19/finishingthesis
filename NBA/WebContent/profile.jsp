<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="css/styleprofile.css">
</head>
<body>
	<form method="post" action="readArticles.jsp">
		<div align="center">
			<%
				if ((session.getAttribute("username") == null) || (session.getAttribute("username") == "")) {
			%>
			You are not logged in! Please log in <a href="index.jsp">here.</a>
			<%
				} else {
			%>
			<h1>
				Welcome
				<%
				Object un = session.getAttribute("username");
					out.println(un);
			%>
				You can crate some titles and discuss about the topic <a
					href="createArticles.jsp">here!</a>
			</h1>
			<%
				}
			%>
		</div>
		<%
			String un1 = (String) session.getAttribute("username");
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/users", "root", "gunslinger");
			PreparedStatement ps = (PreparedStatement) con.prepareStatement("SELECT * from entries");
			ResultSet rs = ps.executeQuery("select * from entries where username = '" + un1 + "'");

			while (rs.next()) {

				Object usrname = rs.getObject("username");
				String id = rs.getString("entryId");
				//out.println(id);
				String heading = rs.getString("heading");
				String text = rs.getString("text");
		%>
		<br />
		<div align="center">
			<table border="1" width="30%" cellpadding="5">
				<tbody>
					<tr>
						<td><a
							href="readArticles.jsp?id=<%=rs.getString("entryId")%>">
								<form method="post" action="readArtiles.jsp">
									<%
										out.println("Entry Id : " + id);
									%>
								</form>
						</a></td>
					</tr>
					<tr>
						<td>
							<%
								out.println("Username : " + un1);
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
		</div>
		<%
			}
		%>
	</form>
</body>
</html>