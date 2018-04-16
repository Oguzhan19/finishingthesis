<%@ page import="java.sql.*"%>

<%
	String heading = request.getParameter("heading");
	String text = request.getParameter("paragraph_text");
	Object Uname = session.getAttribute("username");
	Class.forName("com.mysql.jdbc.Driver");

	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/users", "root", "gunslinger");
	Statement st = con.createStatement();
	//ResultSet rs;
	int i = st.executeUpdate("insert into entries(heading, text,username) values ('" + heading + "','" + text
			+ "','" + Uname + "')");
	if (i > 0) {
response.sendRedirect("profile.jsp");
} else {
		//response.sendRedirect("index.jsp");
	}
%>