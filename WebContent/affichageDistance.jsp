<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Distance entre les villes</title>
	</head>
	<body style="background-color: steelblue;">
		<div>
			<div class="container">
				<div class="card border-0 shadow my-5">
					<div class="card-body p-5">
						<h1 class="font-weight-light">Résultat du calcul</h1>
						<p class="lead">
							La distance entre
							<%=session.getAttribute("ville1")%>
							et
							<%=session.getAttribute("ville2")%>
							est de
							<%=session.getAttribute("distance")%>
							km. <br> Si vous voulez de nouveau <a href=visualiser.jsp>lancer
								un nouveau calcul, voir la météo ou les villes</a><br>
						</p>
	
					</div>
				</div>
			</div>
		</div>
	</body>
	<!-- Bootstrap core JavaScript -->
	<link rel="stylesheet"
		href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

</html>