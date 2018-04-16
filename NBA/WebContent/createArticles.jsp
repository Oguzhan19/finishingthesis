<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<div align="center">
	<h1>NBA hakkında bir konu oluşturun</h1>
</div>
<link rel="stylesheet" href="css/styleeditArticles.css">
</head>
<body>
	<form method="post" action="databaseforCreateArticles.jsp">

		<div align="center">


			<%=session.getAttribute("username")%>

			<table border="1" width="35%" cellpadding="5" bgcolor="#61ad75">
				<thead>
					<tr>

						<td><b>Heading:</b> <br /> <input type="text" name="heading"
							value="" /></td>
					</tr>
				</thead>
				<tbody>
					<tr>

						<td><b>Entry:</b> <br /> <textarea name="paragraph_text"
								cols="50" rows="10"></textarea></td>
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

</html>