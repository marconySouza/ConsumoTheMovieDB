/**
 * @author marcony.souza
 */
package controller;

import java.io.IOException;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.mashape.unirest.http.HttpResponse;
import com.mashape.unirest.http.Unirest;
import com.mashape.unirest.http.exceptions.UnirestException;

import model.CrewRequest;
import model.GenresRequest;
import model.Movies;
import model.TVShows;

/**
 * @author marcony.souza
 *
 */
public class Consumption {

	static String apiKey = "73f8742e7eae9af2fcd6ac7768261fbe";

	/**
	 * @author marcony.souza
	 * @param args
	 * @throws IOException
	 * @throws UnirestException
	 * @throws JsonMappingException
	 * @throws JsonParseException
	 */
	public static void main(String[] args)
			throws JsonParseException, JsonMappingException, UnirestException, IOException {

		// getGenreJSON();
		// getDirectorJSON(2);
		//getMoviesJSON();
		getTVShowsJSON();
	}

	public static void getGenreJSON() throws UnirestException, JsonParseException, JsonMappingException, IOException {

		Unirest.setTimeouts(0, 0);
		HttpResponse<String> response = Unirest
				.get("https://api.themoviedb.org/3/genre/movie/list?api_key=" + apiKey + "&language=pt-BR").asString();

		ObjectMapper mapper = new ObjectMapper();
		mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);

		GenresRequest genre = mapper.readValue(response.getBody(), GenresRequest.class);

		for (int i = 0; i < genre.getListGenres().size(); i++) {
			System.out.println("id: " + genre.getListGenres().get(i).getIdGenre() + "\n Name: "
					+ genre.getListGenres().get(i).getGenreName());
		}

	}

	public static void getMoviesJSON() throws UnirestException, JsonParseException, JsonMappingException, IOException {

		int movieNumber = 2;
		Movies result;
		ObjectMapper mapper = new ObjectMapper();
		HttpResponse<String> response;
		for (int i = 0; i < 100; i++) {

			Unirest.setTimeouts(0, 0);
			response = Unirest
					.get("https://api.themoviedb.org/3/movie/" + movieNumber + "?api_key=" + apiKey + "&language=pt-BR")
					.asString();
			
			mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);

			result = mapper.readValue(response.getBody(), Movies.class);

			if (result.getIdMovie() != null) {
	
				result.setDirector(getDirectorJSON(result.getIdMovie()));
				
				System.out.println("idMovie: " + result.getIdMovie() + "\nOriginalLanguage: " + result. getOriginalLanguage()
				+ "\nOverview: " + result.getOverview() + "\nReleaseDate: " + result.getReleaseDate() 
				+ "\nTitle: " + result.getTitle() + "\nUriBack: " + result.getUriBackImage() + "\nUriFront: " + result.getUriFrontImage() + "\nDirector: " + result.getDirector() +"\n ========== END ==============");
			}
			
			movieNumber++;
		}
	}

	public static void getTVShowsJSON() throws UnirestException, JsonParseException, JsonMappingException, IOException {
		int tvNumber = 1;
		TVShows result;
		ObjectMapper mapper = new ObjectMapper();
		HttpResponse<String> response;
		for (int i = 0; i < 100; i++) {

			Unirest.setTimeouts(0, 0);
			response = Unirest
					.get("https://api.themoviedb.org/3/tv/"+tvNumber+"?api_key=73f8742e7eae9af2fcd6ac7768261fbe&language=pt-BR")
					.asString();
			
			mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);

			result = mapper.readValue(response.getBody(), TVShows.class);

			if (result.getIdTvShow() != null) {
		
				System.out.println("idTVShow: " + result.getIdTvShow() + "\nOriginalLanguage: " + result. getOriginalLanguage()
				+ "\nOverview: " + result.getOverview() +  "\nTitle: " + result.getTitle() + "\nUriFront: " + result.getUriFrontImage()+ "\n ========== END ==============");
			}
			
			tvNumber++;
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

		if(crew.getCrewList() != null) {
		for (int i = 0; i < crew.getCrewList().size(); i++) {
			if (crew.getCrewList().get(i).getJob().equalsIgnoreCase("director")) {
			return crew.getCrewList().get(i).getName();
			}
		}
		}

		return null;
	}

}
