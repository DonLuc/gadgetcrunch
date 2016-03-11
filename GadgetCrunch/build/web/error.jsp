<!DOCTYPE html>
<html lang="en">

	<head>

		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta name="description" content="">
		<meta name="author" content="">

		<title>GadgetCrunch Home</title>

		<!-- Bootstrap Core CSS -->
		<link href="css/bootstrap.min.css" rel="stylesheet">

		<!-- Custom CSS -->
		<link href="css/shop-homepage.css" rel="stylesheet">
		<link href="css/heroic-features.css" rel="stylesheet">
		<link href="css/style.css" rel="stylesheet">
		
		
		<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
		<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
		<!--[if lt IE 9]>
			<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
			<script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
		<![endif]-->

	</head>
	<body style="background-color: red;">
		<div class="container">
			<h1 align center>Login Error</h1>
			<%
				String error = (String)request.getAttribute("error");
			%>
			<h3 align="center"><%=error%></h3>
			
			<footer class="site-footer">
				<div class="container">
					<div class="row">
						<div class="col-md-5">
						<h4>Business Location</h4>
							<address>
								369 Block L</br>
								Soshanguve</br>
								Pretoria</br>
								South Africa
							</address>
						</div>
					</div>
					<div class="bottom-footer">
						<div class="col-md-5"> &#169 Copyright Lucas Nkoana 2015</div>
						<div class="col-md-7">
							<ul class="footer-nav">
								<li><a href="#">Home</a></li>
								<li><a href="#">Cellphones</a></li>
								<li><a href="#">Tablets/Laptops</a></li>
								<li><a href="#">Contact</a></li>
								
							</ul>
						
						</div>
						
					
					</div>
				</div>
			</footer>
		</div>
	</body>
	
	
	
</html>
