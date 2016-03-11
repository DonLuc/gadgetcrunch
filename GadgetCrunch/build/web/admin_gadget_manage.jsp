<!DOCTYPE html>
<%@page import="java.util.Vector, za.ac.tut.gadget.Gadget,za.ac.tut.gadget.gadgetextend.GadgetExtend"%>
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
	
	<body style="background:url('images/bgLight.jpg')">
		<%@ include file ="admin_gm_nav.html"%>
		<div class ="container">
			
			<div>
			<form action="admin.do" method= "POST">
				<div class="table-responsive">
					<table class="table table-striped table-hover table-border" align="center" style="background-color: #2aabd2;">
						<tr>
							<th>Select For Update</th>
							<th>Model Code</th>
							<th>Brand</th>
							<th>Description</th>
							<th>Category</th>
							<th>Price (R)</th>
							<th>Quantity</th>
						</tr>
						<%
							Vector<GadgetExtend> gadgets = (Vector<GadgetExtend>) request.getAttribute("gadgets");
							
							if(gadgets.size() > 0)
							{
								for(GadgetExtend gadget:gadgets)
								{
						%>
									<tr>
										
										<td><input align="left" type="radio" name="gadgetID" value=<%=gadget.getID()%>></td>
										<td><%=gadget.getGadget().getmodelCode()%></td>
										<td><%=gadget.getGadget().getBrand()%></td>
										<td><%=gadget.getGadget().getDescription()%></td>
										<td><%=gadget.getGadget().getCategory()%></td>
										<td><%=gadget.getGadget().getPrice()%></td>
										<td><%=gadget.getGadget().getQuantity()%></td>
										
									</tr>
						
						<%
								}
							}
						%>
					</table>
					
					</br>
				</div>
				
				<div class="btn-group btn-group-justified" role="group" arial-label="Action">
					<div class="btn-group" role="group">
						<a href="admin.do?select=Add Gadget" class="btn btn-primary">Add</a>
					</div>
					<div class="btn-group" role="group">
						<input class="btn btn-primary" type="submit" name="select" value="Update"/>
					</div>
					<div class="btn-group" role="group">
						<input class="btn btn-primary" type="submit" name="select" value="Delete"/>
					</div>
				</div>
				
				
				<!--
				<input class="btn btn-primary" style="position: float-right; margin-left: 550px; width: 100px;" align="left" type="submit" name="select" value="Delete"/>
				<input class="btn btn-primary" style="position: float-right; margin-left: 500px; width: 100px;" align="left" type="submit" name="select" value="Update"/>		
				<a href="admin.do?select=Add Gadget" class="btn btn-primary">Add Gadget</a>
				-->
				</br>
			</form>
		
		
		
		
			<!-- jQuery -->
			<script src="js/jquery.js"></script>
			<!--================== Bootstrap Core JavaScript ======================-->
			<script src="js/bootstrap.min.js"></script>
			<script src="js/jquery-1.9.1.min.js"></script>
			<script src="js/bootstrap.min.js"></script>
			<script src="js/docs.min.js"></script>
			<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
			<script src="js/ie10-viewport-bug-workaround.js"></script>
			<%@include file="footer.html"%>
		</div>
	</body>
	
</html>