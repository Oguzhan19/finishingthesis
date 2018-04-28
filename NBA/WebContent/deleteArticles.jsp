<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<form method="post" action="readArticles.jsp">

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
				out.println(idd);

				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/users", "root", "gunslinger");
				Statement st = con.createStatement();
				int i = st.executeUpdate("delete from entries where entryId=" + idd);
				if (i != 0) {
					response.sendRedirect("profile.jsp");
				} else {
					out.print("Data not deleted successfully");
				}
			}
		%>


	</form>
</body>
</html>
