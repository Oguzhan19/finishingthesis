<%@ page import="java.sql.*"%>

<%
	int approval = Integer.parseInt(request.getParameter("approval"));
	String id = request.getParameter("id").toString();
	Class.forName("com.mysql.jdbc.Driver");

	try {
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/users", "root", "gunslinger");
		String sql = "Update players set approval=? where id=" + id;
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, approval);

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