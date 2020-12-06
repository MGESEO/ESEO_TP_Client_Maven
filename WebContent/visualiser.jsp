<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.eseo.i3.Ville"%>

<!DOCTYPE html>
<html>
	<head>
		<title>Visualiser itinéraire</title>
		<meta charset="ISO-8859-1">
		<link href="inc/css/index.css" rel="stylesheet">
	</head>
	
	<body style="background-color: steelblue;">
		<br>
		<div class="container">
			<div class="card border-0 shadow my-5">
				<div class="card-body p-5">
					<h1 class="font-weight-light">S'informer d'un trajet</h1>
					<p class="lead">Merci d'utiliser notre service de calcul,
						veuillez choisir les villes :</p>
					<div style="height: 400px">
						<br> <br>
						<div class="row vertical-offset-100">
							<div class="col-sm-5 mx-auto">
								<div class="panel panel-default">
									<div class="panel-heading">
										<br>
									</div>
									<div class="panel-body">
										<FORM method="post" action="calculDistance">
											<fieldset>
												<div class="form-group">
	
													<SELECT name="ville1" size="1">
														<%
															ArrayList<Ville> liste1 = (ArrayList) session.getAttribute("villes");
														for (Ville ville : liste1) {
														%>
														<OPTION>
															<%=ville.getNomCommune()%>
															<%
																}
															%>
														
													</SELECT> <SELECT name="ville2" size="1">
														<%
															ArrayList<Ville> liste2 = (ArrayList) session.getAttribute("villes");
														for (Ville ville : liste2) {
														%>
														<OPTION>
															<%=ville.getNomCommune()%>
															<%
																}
															%>
														
													</SELECT> <br> <br> <input
														class="btn btn-lg btn-primary btn-block" type="submit"
														value="Calculer la distance" name="action">
												</div>
											</fieldset>
											<input class="btn btn-lg btn-primary btn-block" type="submit"
												value="Voir la météo" name="action">
										</FORM>
										<br>
										<a class="btn btn-sm btn-info float-right" href="afficheVille">Afficher les villes</a>
										<br>
									</div>
								</div>
							</div>
						</div>
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