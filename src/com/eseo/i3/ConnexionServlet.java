package com.eseo.i3;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Locale;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.codehaus.jettison.json.JSONArray;
import org.codehaus.jettison.json.JSONException;
import org.codehaus.jettison.json.JSONObject;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;
import com.mashape.unirest.http.HttpResponse;
import com.mashape.unirest.http.JsonNode;
import com.mashape.unirest.http.Unirest;
import com.mashape.unirest.http.exceptions.UnirestException;

/**
 * Servlet implementation class connexionServlet
 */
@WebServlet("/connexionServlet")
public class ConnexionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * Default constructor.
	 */
	public ConnexionServlet() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		HttpResponse<JsonNode> reponse;
		ArrayList<Ville> villes = null;
		ArrayList<Ville> villesNonTriees = null;
		try {
			reponse = Unirest.get("http://localhost:8181/ville").asJson();
			JsonArray jArray = JsonParser.parseString(reponse.getBody().toString()).getAsJsonArray();
			villes = this.tabToVille(jArray);
			villes.sort(new Comparator<Ville>() {
				@Override
				public int compare(Ville v1, Ville v2) {
					return v1.getNomCommune().compareToIgnoreCase(v2.getNomCommune());
				}
			});
			villesNonTriees = this.tabToVille(jArray);
		} catch (UnirestException e) {
			e.printStackTrace();
		}
		session.setAttribute("villes", villes);
		session.setAttribute("villesNonTriees", villesNonTriees);
		RequestDispatcher req = request.getRequestDispatcher("visualiser.jsp");
		req.forward(request, response);
	}

	private ArrayList<Ville> tabToVille(JsonArray tab) {
		final Gson gson = new GsonBuilder().create();
		ArrayList<Ville> villes = new ArrayList<>();

		// Itération autour du tableau de données
		for (JsonElement element : tab) {
			villes.add(gson.fromJson(element, Ville.class));
		}
		return villes;
	}

}
