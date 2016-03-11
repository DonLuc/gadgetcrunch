<!DOCTYPE html>

<%@page import="za.ac.tut.login.Login"%>

<%
	Login login = (Login)session.getAttribute("loginObj");
	if(login.getRole().equalsIgnoreCase("Admin"))
	{
%>
<html lang="en">
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Admin Panel Home</title>

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

<body ng-controller="RegistrationController as Registration" style="background: url('images/bgLight.jpg');">

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
                        <a href="admin.do?select=Gadget Management">Gadgets Management</a>
                    </li>
					<li>
                        <a href="#">Clients Management</a>
                    </li>
                    <li>
                        <a href="#">Sales Statistics</a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>

    <div class = "container">
		<!-- Jumbotron Header -->
        <header class="jumbotron hero-spacer">
            <h1 align="center" style="font-family:Arial Rounded MT Bold; text-shadow:2px 2px 4px grey;" >Admin Panel</h1>
            
			</p>
        </header>
	</div>
	
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
<%
	}else
	{
%>
	<h1>You do not have admin privileges to access this site<h1>
	<h4>Try <a href="index.html">Logging in</a> again!</h4>
<%
	}
%>