<%@ page language="java" contentType="text/html; charset=ISO-8859-1"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%!public int nullIntconv(String str) {
		int conv = 0;
		if (str == null) {
			str = "0";
		} else if ((str.trim()).equals("null")) {
			str = "0";
		} else if (str.equals("")) {
			str = "0";
		}
		try {
			conv = Integer.parseInt(str);
		} catch (Exception e) {
		}
		return conv;
	}%>
<%
	Connection conn = null;
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/users", "root", "gunslinger");

	ResultSet rsPagination = null;
	ResultSet rsRowCnt = null;

	PreparedStatement psPagination = null;
	PreparedStatement psRowCnt = null;

	int iShowRows = 5; // Number of records show on per page
	int iTotalSearchRecords = 10; // Number of pages index shown

	int iTotalRows = nullIntconv(request.getParameter("iTotalRows"));
	int iTotalPages = nullIntconv(request.getParameter("iTotalPages"));
	int iPageNo = nullIntconv(request.getParameter("iPageNo"));
	int cPageNo = nullIntconv(request.getParameter("cPageNo"));

	int iStartResultNo = 0;
	int iEndResultNo = 0;

	if (iPageNo == 0) {
		iPageNo = 0;
	} else {
		iPageNo = Math.abs((iPageNo - 1) * iShowRows);
	}

	String sqlPagination = "SELECT SQL_CALC_FOUND_ROWS * FROM entries limit " + iPageNo + "," + iShowRows + "";

	psPagination = conn.prepareStatement(sqlPagination);
	rsPagination = psPagination.executeQuery();

	//// this will count total number of rows
	String sqlRowCnt = "SELECT FOUND_ROWS() as cnt";
	psRowCnt = conn.prepareStatement(sqlRowCnt);
	rsRowCnt = psRowCnt.executeQuery();

	if (rsRowCnt.next()) {
		iTotalRows = rsRowCnt.getInt("cnt");
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome to main page</title>
<link rel="stylesheet" href="css/styleeditArticles.css">
<link rel="stylesheet" href="css/pagination.css">
</head>
<div id="tabs">
	<ul>
		<li><a href="teams.jsp"><span>Teams</span></a></li>
		<li><a href="ShowAllPlayers.jsp"><span>Players</span></a></li>
		<li><a href="ShowAllCoaches.jsp"><span>Coaches</span></a></li>
		<%
			if ((session.getAttribute("username") == null) || (session.getAttribute("username") == "")) {
		%>
		<li><a href="login.jsp"><span>Login</span></a></li>
		<li><a href="registration.jsp"><span>Registration</span></a></li>
		<%
			} else {
		%>
		<li><a href="profile.jsp"><span>Profile</span></a></li>
		<li><a href="createArticles.jsp"><span>Create an Article</span></a></li>
		<li><a href="createPlayer.jsp"><span>Create Player</span></a></li>
		<li><a href="createCoaches.jsp"><span>Create Coach</span></a></li>
		<li><a href="logout.jsp"><span>Log Out</span></a></li>
		<%
			}
		%>

	</ul>
</div>

<body>
	<br />
	<br />
	<form name="frm">
		<input type="hidden" name="iPageNo" value="<%=iPageNo%>"> <input
			type="hidden" name="cPageNo" value="<%=cPageNo%>"> <input
			type="hidden" name="iShowRows" value="<%=iShowRows%>">
		<form method="post" action="read.jsp">
			<table border="1" width="40%" cellpadding="3" bgcolor="#61ad75"
				align="center">
				<tr>
					<td><b>Welcome to the nba blog and
							stats website!! In this website you can read and write freely
							about nba if you have an account!! If you don't want to write
							anything, you can get some information about teams, players,
							coaches and more. See the navigation bar for stats.</b></td>
				</tr>
			</table>
			<br />
			<%
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/users", "root", "gunslinger");
				//PreparedStatement ps = (PreparedStatement) con.prepareStatement("SELECT * from entries ");
				//ResultSet rs = ps.executeQuery("SELECT * from entries");

				while (rsPagination.next()) {
					Object usrname = rsPagination.getObject("username");
					String id = rsPagination.getString("entryId");
					String heading = rsPagination.getString("heading");
					String text = rsPagination.getString("text");
			%>
			<br /> <br />
			<table border="1" width="30%" cellpadding="5" bgcolor="#61ad75"
				align="center">
				<tbody>
					<tr>
						<td><a
							href="readArticles.jsp?id=<%=rsPagination.getString("entryId")%>&?username=<%=rsPagination.getString("username")%>">
								<form method="post" action="readArticles.jsp">
									<%
										out.println("Entry Id : " + id);
									%>
								</form>
						</a></td>
					</tr>
					<tr>
						<td>
							<%
								out.println("Username : " + usrname);
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
								if ((session.getAttribute("username") == null) || (session.getAttribute("username") == "")) {
										out.println("text: *****");
									} else {
										out.println("text: " + text);
									}
							%> <br />
						</td>
					</tr>
				</tbody>
			</table>
			<%
				}
				//// calculate next record start record and end record
				try {
					if (iTotalRows < (iPageNo + iShowRows)) {
						iEndResultNo = iTotalRows;
					} else {
						iEndResultNo = (iPageNo + iShowRows);
					}

					iStartResultNo = (iPageNo + 1);
					iTotalPages = ((int) (Math.ceil((double) iTotalRows / iShowRows)));

				} catch (Exception e) {
					e.printStackTrace();
				}
			%>
			<tr>
				<td colspan="3">
					<div>
						<%
							//// index of pages
						%>
						<div class="container">
							<nav class="pagination"> <%
 	int i = 0;
 	int cPage = 0;
 	if (iTotalRows != 0) {
 		cPage = ((int) (Math.ceil((double) iEndResultNo / (iTotalSearchRecords * iShowRows))));

 		int prePageNo = (cPage * iTotalSearchRecords) - ((iTotalSearchRecords - 1) + iTotalSearchRecords);
 		if ((cPage * iTotalSearchRecords) - (iTotalSearchRecords) > 0) {
 %> <a href="index.jsp?iPageNo=<%=prePageNo%>&cPageNo=<%=prePageNo%>">
								<< Previous</a> <%
 	}

 		for (i = ((cPage * iTotalSearchRecords) - (iTotalSearchRecords - 1)); i <= (cPage
 				* iTotalSearchRecords); i++) {
 			if (i == ((iPageNo / iShowRows) + 1)) {
 %> <a href="index.jsp?iPageNo=<%=i%>"
								style="cursor: pointer; color: red"><b><%=i%></b></a> <%
 	} else if (i <= iTotalPages) {
 %> <a href="index.jsp?iPageNo=<%=i%>"><%=i%></a> <%
 	}
 		}
 		if (iTotalPages > iTotalSearchRecords && i < iTotalPages) {
 %> <a href="index.jsp?iPageNo=<%=i%>&cPageNo=<%=i%>"> >> Next</a> </nav>
						</div>
						<%
							}
							}
						%>
						<b>Rows <%=iStartResultNo%> - <%=iEndResultNo%> Total Result <%=iTotalRows%>
						</b>
					</div>
				</td>
			</tr>
		</form>
	</form>
</body>
</html>
