<%@ page import="java.sql.*"%>

<%
	String coachName = request.getParameter("coachName");
	String team = request.getParameter("team");
	String games = request.getParameter("games");
	String season = request.getParameter("season");
	String wins = request.getParameter("wins");
	Class.forName("com.mysql.jdbc.Driver");

	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/users", "root", "gunslinger");
	Statement st = con.createStatement();
	//ResultSet rs;
	int i = st.executeUpdate("insert into coaches(coachName, team, season,games, wins) values ('" + coachName
			+ "','" + team + "','" + season + "','" + games + "','" + wins + "')");
	if (i > 0) {
		response.sendRedirect("index.jsp");
	} else {
		//response.sendRedirect("index.jsp");
	}
%>