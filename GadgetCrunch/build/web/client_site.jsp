<%-- 
    Document   : Client_Side
    Created on : May 4, 2015, 2:49:31 PM
    Author     : Don
--%>
<%@page import="za.ac.tut.login.Login, za.ac.tut.user.client.Client" %>
<%
    Login login = (Login)session.getAttribute("loginObj");
    Client client = (Client)session.getAttribute("clientObj");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
    <html>
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
            <link href="css/footer.css" rel="stylesheet">


        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->

        </head> 
    <body  style="background: url('images/bgLight.jpg'); background-repeat: repeat-xy;">

        <!-- Navigation -->
        <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
            <div class="container">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="#">GadgetCrunch</a>
                </div>
                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav">

                                            <li>
                            <a href="#">Home</a>
                        </li>
                                            <li>
                            <a href="stock.do?select=View Cellphones">Cellphones</a>
                        </li>
                        <li>
                            <a href="stock.do?select=View Laptops">Laptops</a>
                        </li>
                        <li>
                            <a href="#">Wearables</a>
                        </li>
                                            <li>
                            <a href="stock.do?select=IndexLogin">Contact Us</a>
                        </li>
                                            <li>
                                                <a href="login.do?select=Sign Out">Sign out</a>
                                            </li>
                        <li>
                            
                            <a href="#">
                                <span class="glyphicon glyphicon-user white"></span>
                                ${sessionScope.clientObj.name}
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <span class="glyphicon glyphicon-shopping-cart white"></span>
                                ${sessionScope.countItems}
                            </a>
                        </li>
                        <li>
                            <a href="#" >
                                <span class="glyphicon glyphicon-inbox white"></span>
                                View Cart
                            </a>
                        </li>
                    </ul>
                </div>
                <!-- /.navbar-collapse -->
            </div>
            <!-- /.container -->
        </nav>
    <div class = "container">
	
		<!-- Jumbotron Header -->
		<div class="container">
					
		</div>
		<div class="container">
			
				<header class="jumbotron hero-spacer">
					<h1 align="center" style="font-family:Arial Rounded MT Bold; text-shadow:2px 2px 4px;">A Warm Welcome!</h1>
					<p align="center">GadgetCrunch is an intermediate between clients and suppliers, offering clients latest and reliable gadgets from 
					a wide range of prominent suppliers at an affordable cost.</p>
					<p align="center"><a class="btn btn-primary btn-large" style="font-family: cambria;" href="sign_up/sign_up.html" data-toggle="modal">Join Us Today</a>
					</p>	
				</header>
		</div>
		
	</div>
	
	<h3 style="border-bottom: 2px solid grey;
	font-family:Agency FB">Trending Gadgets</h3>
	
	<div class="container">
		<!--===============================Thumbnails======================= -->
			<div class="row">
			
			</div>
			<div class="row">
				<div class="col-xs-6 col-md-3">
					<a href="#" class="thumbnail"><img src= "images/thumb1.jpg" id="thumbStyle"></a>
				</div>
				<div class ="col-xs-6 col-md-3">
					<a href="#" class="thumbnail"><img src="images/thumb2.jpg"></a>
				</div>
				<div class ="col-xs-6 col-md-3">
					<a href="#" class="thumbnail"><img src="images/thumb3.jpg"></a>
				</div>
				<div class ="col-xs-6 col-md-3">
					<a href="#" class="thumbnail"><img src="images/thumb4.jpg"></a>
				</div>
			</div>
			<div class="row" id="thumbStyle">
				<div class ="col-xs-6 col-md-3">
					<a href="#" class="thumbnail"><img src="images/thumb5.jpg"></a>
				</div>
				<div class ="col-xs-6 col-md-3">
					<a href="#" class="thumbnail"><img src="images/thumb6.jpg"></a>
				</div>
				<div class ="col-xs-6 col-md-3">
					<a href="#" class="thumbnail"><img src="images/thumb7.jpg"></a>
				</div>
				<div class ="col-xs-6 col-md-3">
					<a href="#" class="thumbnail"><img src="images/thumb8.jpg"></a>
				</div>
			</div>
			<div class="row" id="thumbStyle">
				<div class ="col-xs-6 col-md-3">
					<a href="#" class="thumbnail"><img src="images/thumb9.jpg"></a>
				</div>
				<div class ="col-xs-6 col-md-3">
					<a href="#" class="thumbnail"><img src="images/thumb10.jpg"></a>
				</div>
				<div class ="col-xs-6 col-md-3">
					<a href="#" class="thumbnail"><img src="images/thumb11.jpg"></a>
				</div>
				<div class ="col-xs-6 col-md-3">
					<a href="#" class="thumbnail"><img src="images/thumb12.jpg"></a>
				</div>
			</div>
		<!--=================================================================-->
	</div>
	
	<!--================================ ===================================-->
	<!--Join Us Modal-->
	
	
	<!--
	<form method="POST" action="login.do" class="login" novalidate 
									ng-submit="registration.submit(registrationForm.$valid)">
			<div class="modal fade style-modal" id="login" role="dialog">
				<div class="modal-dialog">
					<div class="modal-context">
						<div class="modal-header">
							<h4 align="center" style="text:#fff;">Login</h4>
						</div>
						<div class="modal-body">
								<p>
									<label for="txtPassword" style="color:#fff;">Username</label>
									<input type="text" placeHolder="Username" name="txtPassword" ng-model="registration.user.username" required>
									<div ng-messages="registrationForm.username.$error" ng-messages-include="messages.html"></div>
								</p>
								<p>
									<label for="txtPassword" style="color:#fff;">Password</label>
									<input type="password" placeHolder="Password" name="txtPassword" required>
									<div ng-messages="registrationForm.password.$error" ng-messages-include="messages.html"></div>
								</p>
						</div>
						<div class="modal-footer">
							<input type="submit" name="select" class="btn btn-primary" data-dismiss="modal" value="Login" style="margin-left:-175px;">
							<input type="submit" name="select" class="btn btn-default" data-dismiss="modal" value="Clear" style="margin-left:-300px;">
						</div>
					</div>
				</div>
			</div>
	</form>
	-->
	
	<!--Footer===============================================================-->
	
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
	<!--===================================================================-->
	
	
	
	<!--===================================================================-->
	
    <!-- jQuery -->
    <script src="js/jquery.js"></script>
    <!--================== Bootstrap Core JavaScript ======================-->
    <script src="js/bootstrap.min.js"></script>
	<script src="js/jquery-1.9.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/docs.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="js/ie10-viewport-bug-workaround.js"></script>

    <!-- jssor slider scripts-->
    <!-- use jssor.js + jssor.slider.js instead for development -->
    <!-- jssor.slider.mini.js = (jssor.js + jssor.slider.js) -->
    <script type="text/javascript" src="js/jssor.slider.mini.js"></script>
	<!--===================================================================-->
	
	
	<!--=======================AngularJS Scripts==========================-->
	<script src="js/angular.js"></script>
	<script src="js/angular-messages.js"></script>
	<script src="js/script.js"></script>
	
	
	
	<!--==================================================================-->
</body>

</html>
