<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Registration</title>
<link
	href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700|Lato:400,100,300,700,900'
	rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="css/animate.css">
<!-- Custom Stylesheet -->
<link rel="stylesheet" href="css/style.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<div id="tabs">
	<ul>
		<li><a href="index.jsp"><span>Main Page</span></a></li>
		<li><a href="ShowAllPlayers.jsp"><span>Players</span></a></li>
		<li><a href="ShowAllCoaches.jsp"><span>Coaches</span></a></li>
		<li><a href="teams.jsp"><span>Teams</span></a></li>
		<li><a href="login.jsp"><span>Log In</span></a></li>
	</ul>
</div>
</head>
<body>
	<form method="post" action="registrationDatabase.jsp">
		<div class="container">
			<div class="top">
				<h1 id="title" class="hidden">
					<span id="logo">NBA <span>Blog and Information
							Website</span></span>
				</h1>
			</div>
			<div class="login-box animated fadeInUp">
				<div class="box-header">
					<h2>Register</h2>
				</div>
				<label for="first_name">First name</label> <br /> <input
					type="text" name="first_name" value="" required
					pattern="^[a-zA-Z]+$" /> <br /> <label for="last_name">Last
					Name</label> <br /> <input type="text" name="last_name" value="" required
					pattern="^[a-zA-Z]+$" /> <br /> <label for="email">Email</label>
				<br /> <input type="text" name="email" value="" required
					pattern="[^@]+@[^@]+\.[a-zA-Z]{0,9}"> <br /> <label
					for="uname">Username</label> <br /> <input type="text"
					name="uname" value="" required/> <br /> <label for="pass">Password</label>
				<br /> <input type="password" name="pass" value="" required
					pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
					title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" />
				<br />
				<button type="submit" value="register">register</button>
				<button type="reset" value="Reset">Reset</button>
				<br />
			</div>
		</div>

		<script>
			$(document).ready(function() {
				$('#logo').addClass('animated fadeInDown');
				$("input:text:visible:first").focus();
			});
			$('#uname').focus(function() {
				$('label[for="uname"]').addClass('selected');
			});
			$('#uname').blur(function() {
				$('label[for="uname"]').removeClass('selected');
			});
			$('#pass').focus(function() {
				$('label[for="pass"]').addClass('selected');
			});
			$('#pass').blur(function() {
				$('label[for="pass"]').removeClass('selected');
			});
		</script>
	</form>
</body>
</html>