<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<div align="center">
	<head>
<b>Enter Information for a player </b>
<link rel="stylesheet" href="css/styleprofile.css">
	</head>
</div>
<body>
	<%
		if ((session.getAttribute("username") == null) || (session.getAttribute("username") == "")) {
	%>
	You are not logged in! Please log in
	<a href="login.jsp">here.</a>
	<%
		} else {
	%>
	<form method="post" action="databaseforCreatePlayer.jsp">

		<div align="center">

			<table border="1" width="70%" cellpadding="5">
				<thead>
					<tr>
						<td>Player's name</td>
						<td><input type="text" name="name" value="" required /></td>
					</tr>
					<tr>
						<td>Player's team</td>
						<td><select name="team">
								<option>Atlanta Hawks</option>
								<option>Boston Celtics</option>
								<option>Brooklyn Nets</option>
								<option>Charlotte Hornets</option>
								<option>Chicago Bulls</option>
								<option>Cleveland Cavaliers</option>
								<option>Dallas Mavericks</option>
								<option>Denver Nuggets</option>
								<option>Detroit Pistons</option>
								<option>Golden State Warriors</option>
								<option>Houston Rockets</option>
								<option>Indiana Pacers</option>
								<option>Los Angeles Clippers</option>
								<option>Los Angeles Lakers</option>
								<option>Memphis Grizzlies</option>
								<option>Miami Heat</option>
								<option>Milwaukee Bucks</option>
								<option>Minnesota Timberwolves</option>
								<option>New Orleans Pelicans</option>
								<option>New York Knicks</option>
								<option>Oklahoma City Thunder</option>
								<option>Orlando Magic</option>
								<option>Philadelphia 76ers</option>
								<option>Phoenix Suns</option>
								<option>Portland Trail Blazers</option>
								<option>Sacramento Kings</option>
								<option>San Antonio Spurs</option>
								<option>Toronto Raptors</option>
								<option>Utah Jazz</option>
								<option>Washington Wizards</option>


						</select></td>
					</tr>
				</thead>
				<tbody>

					<tr>
						<td>Choose the Season</td>

						<td><select name="season" required>
								<option>2017-2018</option>
								<option>2016-2017</option>
								<option>2015-2016</option>
								<option>2014-2015</option>
								<option>2013-2014</option>
								<option>2012-2013</option>
								<option>2011-2012</option>
								<option>2010-2011</option>
								<option>2009-2010</option>
								<option>2008-2009</option>
								<option>2007-2008</option>
								<option>2006-2007</option>
								<option>2005-2006</option>
								<option>2004-2005</option>
								<option>2003-2004</option>
								<option>2002-2003</option>
								<option>2001-2002</option>
								<option>2000-2001</option>
								<option>1999-2000</option>
								<option>1998-1999</option>
								<option>1997-1998</option>
								<option>1996-1997</option>
								<option>1995-1996</option>
								<option>1994-1995</option>
								<option>1993-1994</option>
								<option>1992-1993</option>
								<option>1991-1992</option>
								<option>1990-1991</option>
								<option>1989-1990</option>
								<option>1988-1989</option>
								<option>1987-1988</option>
								<option>1986-1987</option>
								<option>1985-1986</option>
								<option>1984-1985</option>
								<option>1983-1984</option>
								<option>1982-1983</option>
								<option>1981-1982</option>
								<option>1980-1981</option>

						</select></td>
					</tr>
					<tr>
						<td>BirthDate</td>
						<td><input type="date" name="birthDate" value="" required></td>
					</tr>
					<tr>
						<td> Average of points in the selected season</td>
						<td><input type="number" step="any" name="points" value=""
							required min="0" max="100" /></td>
					</tr>
					<tr>
						<td>Average of rebounds in the selected season</td>
						<td><input type="number" step="any" name="rebounds" value=""
							required min="0" max="50" /></td>
					</tr>
					<tr>
						<td>Average of assists in the selected season</td>
						<td><input type="number" step="any" name="assists" value=""
							required min="0" max="50" /></td>
					</tr>
					<tr>
						<td>Average of steals in the selected season</td>
						<td><input type="number" step="any" name="steals" value=""
							required min="0" max="40" /></td>
					</tr>
					<tr>
						<td>Average of blocks in the selected season</td>
						<td><input type="number" step="any" name="blocks" value=""
							required min="0" max="30" /></td>
					</tr>
					<tr>
						<td>Average of turnovers in the selected season</td>
						<td><input type="number" step="any" name="turnovers" value=""
							required min="0" max="20" /></td>
					</tr>
					<tr>
						<td>Average of minutes played in the selected season</td>
						<td><input type="number" step="any" name="minutes" value=""
							required min="0" max="50" /></td>
					</tr>
					<tr>
						<td>Total games played in the selected season</td>
						<td><input type="number" name="gamesinTotal" value=""
							required pattern="" min="0" max="82" /></td>
					</tr>


					<tr>
						<td><input type="submit" value="Submit" /></td>
						<td><input type="reset" value="Reset" /></td>
					</tr>
				</tbody>
			</table>
		</div>

	</form>
	<%
		}
	%>
</body>

</html>