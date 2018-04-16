<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP Example</title>
<link
	href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700|Lato:400,100,300,700,900'
	rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="css/animate.css">
<!-- Custom Stylesheet -->
<link rel="stylesheet" href="css/style.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
</head>

<body>
	<form method="post" action="loginDatabase.jsp">
		<div class="container">
			<div class="top">
				<h1 id="title" class="hidden">
					<span id="logo">NBA <span>Blog and Information
							Website</span></span>
				</h1>
			</div>
			<div class="login-box animated fadeInUp">
				<div class="box-header">
					<h2>Log In</h2>
				</div>
				<label for="uname">Username</label> <br /> <input type="text"
					name="uname" value=""> <br /> <label for="pass">Password</label>
				<br /> <input type="password" name="pass" value=""> <br />
				<button type="submit" value="Login">Login </button>    
				<button type="reset" value="Reset">Reset</button>
				<br />
                <a href="registration.jsp">Register here!</a>
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