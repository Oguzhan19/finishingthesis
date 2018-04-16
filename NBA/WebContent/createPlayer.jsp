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
	<form method="post" action="databaseforCreatePlayer.jsp">

		<div align="center">

			<table border="1" width="70%" cellpadding="5">
				<thead>
					<tr>
						<td>Player's name</td>
						<td><input type="text" name="name" value="" /></td>
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
						<td>Rookie Season</td>

						<td><select name="season">
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
						</select></td>
					</tr>
					<tr>
						<td>BirthDate</td>
						<td><input type="date" name="birthDate" value=""></td>
					</tr>
					<tr>
						<td>Points in first year</td>
						<td><input type="text" name="points" value=""></td>
					</tr>
					<tr>
						<td>Rebounds in first year</td>
						<td><input type="text" name="rebounds" value=""></td>
					</tr>
					<tr>
						<td>Assists in first year</td>
						<td><input type="text" name="assists" value=""></td>
					</tr>
					<tr>
						<td>Steals in first year</td>
						<td><input type="text" name="steals" value=""></td>
					</tr>
					<tr>
						<td>Blocks in first year</td>
						<td><input type="text" name="blocks" value=""></td>
					</tr>
					<tr>
						<td>Turnovers in first year</td>
						<td><input type="text" name="turnovers" value=""></td>
					</tr>
					<tr>
						<td>Minutes in first year</td>
						<td><input type="text" name="minutes" value=""></td>
					</tr>
					<tr>
						<td>Games in total in first year</td>
						<td><input type="text" name="gamesinTotal" value=""></td>
					</tr>


					<tr>
						<td><input type="submit" value="Submit" /></td>
						<td><input type="reset" value="Reset" /></td>
					</tr>
				</tbody>
			</table>
		</div>

	</form>
</body>

</html>