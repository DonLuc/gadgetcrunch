<!DOCTYPE html>
<%@page import="java.util.Vector, za.ac.tut.gadget.Gadget"%>
<html ng-app="validation">

  <head>
    <link rel="stylesheet" href="sign_up/bootstrap.css" />
    <script src="sign_up/angular.js"></script>
    <script src="sign_up/angular-messages.js"></script>
   <link href="css/form-align.css" rel="stylesheet" />
    <link rel="stylesheet" href="css/style.css" />
    <script src="sign_up/script.js"></script>
	
	<!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/shop-homepage.css" rel="stylesheet">
	<link href="css/heroic-features.css" rel="stylesheet">
	<title>Add Gadget</title>
	
	
  </head>
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
                <a class="navbar-brand" href="index.html">GadgetCrunch</a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    
					<li>
                        <a href="admin.do?select=Gadget Management">Gadgets Management</a>
                    </li>
                    <li>
                        <a href="admin.do?select=Sales Management">Sales Management</a>
                    </li>
                    <li>
						<a href="index.html">Sign Out</a>
					</li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>

  <body class="container" ng-controller="RegistrationController as registration"  style="background: url('images/bgLight.jpg');">
	<div class = "container">
		<!-- Jumbotron Header -->
        <header class="jumbotron hero-spacer">
            <h1 align="center" style="font-family:Arial Rounded MT Bold; text-shadow:2px 2px 4px grey;" >Add Gadget To Stock</h1>
            
			</p>
        </header>
	</div>
    
	
		<h3>{{ registration.message }}</h3> 
    <div class = "container">
		<div class="col-md-6">
			
			
			<div class="panel-body" style="border: 2px solid grey; box-shadow: 2px 2px 4px grey;">
				<form name="registrationForm" novalidate 
					  ng-submit="registration.submit(registrationForm.$valid)"
					  action="admin.do"
					  method="POST">
				   
					<div class="form-group">
						
						<label style="text-align:left; width:150px;">Model Code</label>
						<input type="text" name="model_code" class="form-control" ng-model="registration.user.model_code" required autofocus/>
						
					</div>
					<div class="form-group">
						<label style="text-align:left; width:50px;">Brand</label>
						<input type="text" name="brand" class="form-control" ng-model="registration.user.model" required/>
						
					</div>
					<div class="form-group">
						<label style="text-align:left; width:50px;">Description</label>
						<input type="text" name="description" class="form-control" ng-model="registration.user.description" required />
					</div>
					
					<div class="form-group">
						<label style="text-align:left; width:60px;">Category</label>
						<select class="input-sm" name="category">
							<option></option>
							<option></option>
							<option value="Computer">Computer</option>
							<option value="Tablet">Tablet</option>
							<option value="Cellphone">Cellphone</option>
							<option value="Wearable">Wearable</option>
						</select>
					</div>
					
					
					<div class="form-group">
						<label style="text-align:left; width:50px;">Price</label>
						<input type="text" name="price" class="form-control" ng-model="registration.user.price" required />		
					</div>
					<div class="form-group">
						<label style="text-align:left; width:50px;">Quantity</label>
						<input type="number" name="quantity" class="form-control" ng-model="registration.user.quantity" required />		
					</div>
					
					</br>
					<div class="btn-group btn-group-justified" role="group" arial-label="Action">
						<div class="btn-group" role="group">
						
							<input type="submit" class="btn btn-primary btn-md" name="select" value="Add to stock"/>
						</div>
					</div>
					<!--
					<div class="dropdown" >
							<button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1"
								data-toggle="dropdown" aria-expanded="true">Action
								<span class="caret"></span>
							</button>
							<ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
								<li role="presentation"><a role="menuitem" tabindex="-1"
								href="add_gadget.html">Add</a></li>
								<li role="presentation"><a role="menuitem" tabindex="-1"
								href="update_gadget.html">Update</a></li>
								<li role="presentation"><a role="menuitem" tabindex="-1"
								href="#">Delete</a></li>
							</ul>
						</div>
						</br></br></br></br>
						-->
				</form>
			</div>
		</div>
		<div class="col-md-6">
			<!--table-->
		
			<table class="table table-striped table-hover table-border" align="center" style="box-shadow: 2px 2px 4px; background-color: #2aabd2">
						<tr>
							<th>Model Code</th>
							<th>Brand</th>
							<th>Description</th>
							<th>Category</th>
							<th>Price (R)</th>
							<th>Quantity</th>
						</tr>
			<%
				Vector<Gadget> gadgets = (Vector<Gadget>)request.getAttribute("gadgets");
				if(gadgets.size() > 0)
				{
					for(Gadget gadget: gadgets)
					{
				
				
			
			%>
				<tr>
					<td><%=gadget.getmodelCode()%></td>
					<td><%=gadget.getBrand()%></td>
					<td><%=gadget.getDescription()%></td>
					<td><%=gadget.getCategory()%></td>
					<td><%=gadget.getPrice()%></td>
					<td><%=gadget.getQuantity()%></td>
				<tr>
			<%
					}
				}
			%>
			</table>
		
		</div>
		
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
		<!--==================================================================-->
	</body>
	<%@include file="footer.html"%>
	<!--
		<div class="form-group">
            <label>Category</label>
            <select name="category">
				<option></option>
				<option value="Computer">Computer</option>
				<option value="Tablet">Tablet</option>
				<option value="Cellphone">Cellphone</option>
				<option value="Wearable">Wearable</option>
			</select>
        </div>
		-->
<html>