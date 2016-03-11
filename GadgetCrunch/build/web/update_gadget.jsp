<!DOCTYPE html>
<%@page import="za.ac.tut.gadget.gadgetextend.GadgetExtend"%>
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
                    <li>
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
						
				<form name="registrationForm" novalidate 
										  ng-submit="registration.submit(registrationForm.$valid)"
										  action="admin.do"
										  method="POST">
						<%
							GadgetExtend ge = (GadgetExtend)request.getAttribute("gadget");
						%>
						<div class="form-group">
							
							<label style="text-align:left; width:150px;">Gadget ID</label>
							<input type="text" name="gadgetID_update" value="<%=ge.getID()%>" id="disabledTextInput" class="form-control" disabled/>
	
						</div>
						
						<div class="form-group">
							
							<label style="text-align:left; width:150px;">Model Code</label>
							<input type="text" name="model_code_update" class="form-control" placeholder="<%=ge.getGadget().getmodelCode()%>" ng-model="registration.user.model_code_update" required autofocus/>
							
						</div>
						
						<div class="form-group">
							<label style="text-align:left; width:50px;">Brand</label>
							<input type="text" name="brand_update" class="form-control" placeholder="<%=ge.getGadget().getBrand()%>" ng-model="registration.user.brand_update" required/>
							
						</div>
						<div class="form-group">
							<label style="text-align:left; width:50px;">Description</label>
							<input type="text" name="description_update" class="form-control" placeholder="<%=ge.getGadget().getDescription()%>" ng-model="registration.user.description_update" required />
						</div>
						
						<div class="form-group">
							<label style="text-align:left; width:60px;">Category</label>
							<select name="category_update">
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
							<input type="text" name="price_update" class="form-control" placeholder="<%=ge.getGadget().getPrice()%>" ng-model="registration.user.price_update" required />		
						</div>
						<div class="form-group">
							<label style="text-align:left; width:50px;">Quantity</label>
							<input type="number" name="quantity_update" class="form-control" placeholder="<%=ge.getGadget().getQuantity()%>" ng-model="registration.user.quantity_update" required />		
						</div>
						
						<div class="form-group" align="center">
						</br>
							<input type="submit" class="btn btn-primary btn-md" name="select" value="Update Gadget"/>
						</div>
					
			</div>	
					<div class="col-md-6">
									
								
								<table class="table table-striped table-hover table-border" align="center" style="box-shadow: 2px 2px 4px;">
										<tr>
											<th>Model Code</th>
											<th>Brand</th>
											<th>Description</th>
											<th>Category</th>
											<th>Price (R)</th>
											<th>Quantity</th>
										</tr>
								
										<tr>
											<td><%=ge.getGadget().getmodelCode()%></td>
											<td><%=ge.getGadget().getBrand()%></td>
											<td><%=ge.getGadget().getDescription()%></td>
											<td><%=ge.getGadget().getCategory()%></td>
											<td><%=ge.getGadget().getPrice()%></td>
											<td><%=ge.getGadget().getQuantity()%></td>
										</tr>
								</table>
								
								
							
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