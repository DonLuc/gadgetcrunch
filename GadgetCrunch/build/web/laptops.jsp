<%-- 
    Document   : laptops.jsp
    Created on : May 6, 2015, 10:16:53 AM
    Author     : Don
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="en">

	<head>

		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta name="description" content="">
		<meta name="author" content="">

		<title>Laptops</title>

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
	<body style="background:url('images/bgLight.jpg');">
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
                                                <a href="login.do?select=Sign Out">Sign out
                                                <span class="glyphicon glyphicon-log-out"></span>
                                                </a>
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
                    </ul>
                </div>
                <!-- /.navbar-collapse -->
            </div>
            <!-- /.container -->
        </nav>
            
            
            
            <div class = "container">
                    <!-- Jumbotron Header -->
            <header class="jumbotron hero-spacer">
                <h1 align="center" style="font-family:Arial Rounded MT Bold; text-shadow:2px 2px 4px grey;" >Laptops</h1>  

            </header>
            </div>
            <div class="container">
                <h1>${sessionScope.laptops[1].gadget.brand}</h1>
                <div class="table-responsive">
                                        
					<table class="table table-striped table-hover table-border" align="center">
                                            <tr>
                                                <th>Add To Cart</th>
                                                <th>Model Code</th>
                                                <th>Brand</th>
                                                <th>Description</th>
                                                <th>Category</th>
                                                <th>Price (R)</th>
                                                <th>Quantity</th>
                                            </tr>
                                            <c:forEach var="laptop" items="${sessionScope.laptops}" varStatus="count">
                                                <tr>
                                                    <td>${laptop.id}</td>
                                                </tr>
                                            </c:forEach>
                                        </table>
                </div>
                
                
                
                    <div class="btn-group btn-group-justified" role="group" arial-label="Action">
                        <div class="btn-group" role="group">

                                <!--<span class="glyphicon glyphicon-chevron-right">-->
                                <a class="btn btn-primary" href="#">Previous</a>
                        </div>
                        <div class="btn-group" role="group">

                                <a class="btn btn-primary" href="#">Next</a>
                        </div>
                    </div>
                </div>
            
            </div>

        </body>
            <%@include file="footer.html"%>
</html>