/**
 * @author marcony.souza
 */
package br.netfound.controller;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Statement;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.mashape.unirest.http.HttpResponse;
import com.mashape.unirest.http.Unirest;
import com.mashape.unirest.http.exceptions.UnirestException;

import br.netfound.database.DBConnection;
import br.netfound.model.CrewRequest;
import br.netfound.model.GenresRequest;
import br.netfound.model.Movies;
import br.netfound.model.TVShows;
import br.netfound.persistence.GenreDAO;
import br.netfound.persistence.MoviesDAO;
import br.netfound.persistence.TVShowDAO;

/**
 * @author marcony.souza
 *
 */
public class Consumption {

	static String apiKey = "73f8742e7eae9af2fcd6ac7768261fbe";
	static String language = "pt-BR";

	/**
	 * @author marcony.souza
	 * @param args
	 * @throws Exception
	 */
	public static void main(String[] args) throws Exception {

		/*
		JSONArray array = (JSONArray) new JSONParser()
				.parse(new FileReader("C:/Users/Login/Desktop/tv_series_ids_11_16_2020.json"));
		JSONObject obj;
		for (int k = 0; k < array.size(); k++) {
			obj = (JSONObject) array.get(k);
			getTVShowsJSON((Long) obj.get("id"));
			System.out.println("Serie: " + obj.get("id") + " - " + obj.get("original_name"));
		}*/
		/*
		JSONArray array = (JSONArray) new JSONParser()
				.parse(new FileReader("C:/Users/Login/Desktop/movie_ids_11_16_2020.json"));
		JSONObject obj;
		Connection con = DBConnection.getConnection();
		Statement stm = con.createStatement();
		String query = "";
		
		for (int k = 0; k < array.size(); k++) {
			obj = (JSONObject) array.get(k);
			query = "UPDATE MOVIES SET POPULARITY = "+ obj.get("popularity") + "WHERE ID_MOVIE = " + obj.get("id");
			stm.execute(query);
			System.out.println("filme: " + obj.get("id") + " - " + obj.get("original_name"));
		}
*/
		/*
		 * UserDAO dao = new UserDAO();
		 * 
		 * List<Movies> list = (List<Movies>) dao.getMyList("1").get("MOVIES");
		 * System.out.println(list);
		 */// dao.authenticateUser("ADMIN", "ADMIN");

		// getGenreJSON();
		// getDirectorJSON(2);
		// getMoviesJSON(2);
		// getTVShowsJSON(10);

	}

	public static void getGenreJSON() throws Exception {

		Unirest.setTimeouts(0, 0);
		HttpResponse<String> response = Unirest
				.get("https://api.themoviedb.org/3/genre/movie/list?api_key=" + apiKey + "&language=" + language)
				.asString();

		ObjectMapper mapper = new ObjectMapper();
		mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);

		GenresRequest genre = mapper.readValue(response.getBody(), GenresRequest.class);
		GenreDAO dao = new GenreDAO();
		for (int i = 0; i < genre.getListGenres().size(); i++) {
			dao.addGenres(genre.getListGenres().get(i));
		}

	}

	public static void getMoviesJSON(Long movieNumber) throws Exception {

		Movies result;
		ObjectMapper mapper = new ObjectMapper();
		HttpResponse<String> response;

		Unirest.setTimeouts(0, 0);
		response = Unirest.get(
				"https://api.themoviedb.org/3/movie/" + movieNumber + "?api_key=" + apiKey + "&language=" + language)
				.asString();

		mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);

		result = mapper.readValue(response.getBody(), Movies.class);

		if (result.getIdMovie() != null) {
			if (result.getReleaseDate() != null) {
				result.setDirector(getDirectorJSON(result.getIdMovie()));
				MoviesDAO dao = new MoviesDAO();
				result.setUriBackImage("https://image.tmdb.org/t/p/original/" + result.getUriBackImage());
				result.setUriFrontImage("https://image.tmdb.org/t/p/original/" + result.getUriFrontImage());
				dao.addMovie(result);
			} else {
				return;
			}

		} else {
			System.out.println("Filme n�o encontrado");
		}

	}

	public static void getTVShowsJSON(Long tvNumber) throws Exception {
		TVShows result;
		ObjectMapper mapper = new ObjectMapper();
		HttpResponse<String> response;

		Unirest.setTimeouts(0, 0);
		response = Unirest.get("https://api.themoviedb.org/3/tv/" + tvNumber
				+ "?api_key=73f8742e7eae9af2fcd6ac7768261fbe&language=" + language).asString();

		mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);

		result = mapper.readValue(response.getBody(), TVShows.class);

		if (result.getIdTvShow() != null) {
			if (result.getReleaseDate() != null) {

				TVShowDAO dao = new TVShowDAO();
				result.setUriFrontImage("https://image.tmdb.org/t/p/original/" + result.getUriFrontImage());
				dao.addTvShow(result);
			}
		}
	}

	public static String getDirectorJSON(Integer idMovie)
			throws UnirestException, JsonParseException, JsonMappingException, IOException {

		Unirest.setTimeouts(0, 0);
		HttpResponse<String> response = Unirest
				.get("https://api.themoviedb.org/3/movie/" + idMovie + "/credits?api_key=" + apiKey).asString();

		ObjectMapper mapper = new ObjectMapper();
		mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);

		CrewRequest crew = mapper.readValue(response.getBody(), CrewRequest.class);

		if (crew.getCrewList() != null) {
			for (int i = 0; i < crew.getCrewList().size(); i++) {
				if (crew.getCrewList().get(i).getJob().equalsIgnoreCase("director")) {
					return crew.getCrewList().get(i).getName();
				}
			}
		}

		return null;
	}

}
