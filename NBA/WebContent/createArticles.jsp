<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<div align="center">
	<title>Create Articles</title>
	<h1><b>Create an article about NBA</b></h1>
</div>
<link rel="stylesheet" href="css/styleeditArticles.css">
</head>
<body>
	<form method="post" action="databaseforCreateArticles.jsp">
		<%
			if ((session.getAttribute("username") == null) || (session.getAttribute("username") == "")) {
		%>
		You are not logged in! Please log in <a href="login.jsp">here.</a>
		<%
			} else {
		%>
		<div align="center">
			<table border="1" width="35%" cellpadding="5" bgcolor="#61ad75">
				<thead>
					<tr>

						<td><b>Heading:</b> <br /> <input type="text" name="heading"
							value="" required /></td>
					</tr>
				</thead>
				<tbody>
					<tr>

						<td><b>Entry:</b> <br /> <textarea name="paragraph_text"
								cols="50" rows="10" required></textarea></td>
					</tr>
					<tr>
						<td><div align="center">
								<input type="submit" value="Submit" />
							</div></td>
					</tr>
					<tr>
						<td><div align="center">
								<input type="reset" value="Reset" />
							</div></td>
					</tr>
				</tbody>
			</table>
		</div>
	</form>
</body>
<%
	}
%>
</html>