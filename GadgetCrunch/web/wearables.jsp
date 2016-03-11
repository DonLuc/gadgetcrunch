<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.Vector, za.ac.tut.gadget.Gadget,za.ac.tut.gadget.gadgetextend.GadgetExtend, za.ac.tut.login.Login"%>


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
                            <a href="client_site.jsp">Home</a>
                        </li>
                                            <li>
                            <a href="stock.do?select=View Cellphones">Cellphones</a>
                        </li>
                        <li>
                            <a href="stock.do?select=View Laptops">Laptops</a>
                        </li>
                        <li>
                            <a href="stock.do?select=View Laptops">Wearables</a>
                        </li>
                                            <li>
                            <a href="stock.do?select=IndexLogin">Contact Us</a>
                        </li>
                                            <li>
                                                <a href="login.do?select=Sign Out">Sign out</a>
                                                <span class="glyphicon glyphicon-log-out"></span>
                                            </li>
                        <li>
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
                            <a href="order.do?action=View Cart" >
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
            <header class="jumbotron hero-spacer">
                <h1 align="center" style="font-family:Arial Rounded MT Bold; text-shadow:2px 2px 4px grey;" >Wearables</h1>  
                            
        </header>
	</div>
		<div class ="container">
			
			<!--
			<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
				<ol class="carousel-indicators">
					<li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
					<li data-target="#carousel-example-generic" data-slide-to="1"></li>
					<li data-target="#carousel-example-generic" data-slide-to="2"></li>
				</ol>
				<div class="carousel-inner">
					<div class="item active">
						<img class="slide-image" src="images/iphone6.png" alt="">
					</div>
					<div class="item">
						<img class="slide-image" src="images/s5.jpg" alt="">
					</div>
					<div class="item">
						<img class="slide-image" src="images/s51.jpg" alt="">
					</div>
				</div>
				<a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
					<span class="glyphicon glyphicon-chevron-left"></span>
				</a>
				<a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
					<span class="glyphicon glyphicon-chevron-right"></span>
				</a>
			</div>
			-->
			<form action="stock.do" method="POST">
				
				<div class="table-responsive">
					<table class="table table-striped table-hover table-border" align="center" style="background-color: #89bdff">
						<tr>	
							<th>Add To Cart</th>
							<th>Model Code</th>
							<th>Brand</th>
							<th>Description</th>
							<th>Category</th>
							<th>Price (R)</th>
							<th>Place order</th>
						</tr>
						<%
							Vector<GadgetExtend> phones = (Vector<GadgetExtend>)session.getAttribute("cellphones");
							int starter = Integer.parseInt(request.getParameter("start"));
							int ender = Integer.parseInt(request.getParameter("end"));
							
							if(phones.size() > 0)
							{
								for(int x = starter; x < ender && x < phones.size();++x)
								{
						%>
									<tr>
										
										<td><%=phones.get(x).getGadget().getmodelCode()%></td>
										<td><%=phones.get(x).getGadget().getBrand()%></td>
										<td><%=phones.get(x).getGadget().getDescription()%></td>
										<td><%=phones.get(x).getGadget().getCategory()%></td>
										<td><%=phones.get(x).getGadget().getPrice()%></td>
										<td><%=phones.get(x).getGadget().getQuantity()%></td>
                                                                               
                                                                                <td>
                                                                                    <a class="btn btn-default" href="order.do?id=<%=phones.get(x).getID()%>&action=OrderNowWear">Order Now</a>
                                                                                </td>
									</tr>
						<%
								}
									starter +=5;
									ender +=5;
							}
						%>
					</table>
				</div>
				<div class="btn-group btn-group-justified" role="group" arial-label="Action">
					<div class="btn-group" role="group">
						
						<!--<span class="glyphicon glyphicon-chevron-right">-->
						<input class="btn btn-primary" type="submit" name="select" value="Previous"/>
					</div>
					<div class="btn-group" role="group">
					
						<a class="btn btn-primary" href="cellphones.jsp?start=<%=starter%>&end=<%=ender%>">Next</a>
					</div>
				</div>
			</form>
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
			
	
	</body>
        <%@include file="footer.html"%>
</html>
