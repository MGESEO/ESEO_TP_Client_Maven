<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.eseo.i3.Ville"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Listing des villes</title>
		<style type="text/css">
		
			.topnav {
			  overflow: hidden;
			  background-color: white;
			}

			.topnav a {
			  float: left;
			  display: block;
			  color: black;
			  text-align: center;
			  padding: 14px 16px;
			  text-decoration: none;
			  font-size: 17px;
			}
			
			.topnav a:hover {
			  background-color: #ddd;
			  color: black;
			}
			
			.topnav a.active {
			  background-color: #20B2AA;
			  color: white;
			}
			
		</style>
	</head>
	<body style="background-color: steelblue;">
		<div class="container">
			<nav aria-label="Page navigation example">
				<ul class="pagination">
					<li class="page-item"><a class="page-link"
						href="afficheVille?page=
						<%Integer pages = (Integer) request.getAttribute("numPage");
						if (pages <= 1) {
							pages = 2;
						}%>
						<%=pages - 1%>">Précédent</a></li>
					<li class="page-item"><a class="page-link"
						href="afficheVille?page=1">1</a></li>
					<li class="page-item"><a class="page-link"
						href="afficheVille?page=2">2</a></li>
					<li class="page-item"><a class="page-link"
						href="afficheVille?page=3">3</a></li>
					<li class="page-item"><a class="page-link" href="afficheVille?page=
						<%Integer pagesS = (Integer) request.getAttribute("numPage");%>
						<%=pagesS + 1%>">Suivant</a></li>
				</ul>
			</nav>

			<div class="card border-0 shadow my-5">
				<div class="topnav">
					<a class="active" href="connexionServlet">Accueil</a>			
				</div>
				<div class="card-body p-5">
					<h1 class="font-weight-light">Liste des villes</h1>
					<br>
					<div style="height: 2500px">
						<FORM method="post" action="modification">
							<%
								ArrayList<Ville> liste2 = (ArrayList) request.getAttribute("villesPage");
							for (Ville ville : liste2) {
							%>
							<%=ville.getNomCommune()%>
							<a style="color:#20B2AA" href="modification?ville=<%=ville.getNomCommune()%>">modifier</a>
							<a style="color:#20B2AA" href="suppression?ville=<%=ville.getNomCommune()%>">supprimer</a><br>
							<br>
							<%
								}
							%>
						</FORM>
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