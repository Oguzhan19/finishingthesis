<%@ page import="java.sql.*"%>

<%
	String name = request.getParameter("name");
	String team = request.getParameter("team");
	String season = request.getParameter("season");
	String birthDate = request.getParameter("birthDate");
	String points = request.getParameter("points");
	String rebounds = request.getParameter("rebounds");
	String assists = request.getParameter("assists");
	String steals = request.getParameter("steals");
	String blocks = request.getParameter("blocks");
	String turnovers = request.getParameter("turnovers");
	String minutes = request.getParameter("minutes");
	String gamesinTotal = request.getParameter("gamesinTotal");
	int approval = 0;
	Class.forName("com.mysql.jdbc.Driver");

	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/users", "root", "gunslinger");
	Statement st = con.createStatement();
	//ResultSet rs;
	int i = st.executeUpdate(
			"insert into players(name, team, season, birthDate, points, rebounds, assists, steals, blocks, turnovers, minutes, gamesinTotal, approval) values ('"
					+ name + "','" + team + "','" + season + "','" + birthDate + "','" + points + "','"
					+ rebounds + "','" + assists + "','" + steals + "','" + blocks + "','" + turnovers + "','"
					+ minutes + "','" + gamesinTotal + "','" + approval + "')");
	if (i > 0) {
		response.sendRedirect("index.jsp");
	} else {
		//response.sendRedirect("index.jsp");
	}
%>