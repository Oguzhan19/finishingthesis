<%@ page import="java.sql.*"%>

<%
	String Id = request.getParameter("id").toString();
	String heading = request.getParameter("heading");
	if (heading == null)
		heading = "";
	String text = request.getParameter("paragraph_text");
	if (text == null)
		text = "";
	Object Uname = session.getAttribute("username");
	Class.forName("com.mysql.jdbc.Driver");

	try {
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/users", "root", "gunslinger");
		String sql = "Update entries set heading=?,text=?,username=? where entryId=" + Id;
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, heading);
		ps.setString(2, text);
		ps.setObject(3, Uname);
		int i = ps.executeUpdate();
		if (i > 0) {
			response.sendRedirect("profile.jsp");
		} else {
			out.print("There is a problem in updating Record.");
		}
	} catch (SQLException sql) {
		request.setAttribute("error", sql);
		out.println(sql);
	}
%>