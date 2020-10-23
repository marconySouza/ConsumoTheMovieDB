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

import model.GenresRequest;

/**
 * @author marcony.souza
 *
 */
public class Consumption {

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

		getGenreJSON();

	}

	public static void getGenreJSON() throws UnirestException, JsonParseException, JsonMappingException, IOException {

		Unirest.setTimeouts(0, 0);
		HttpResponse<String> response = Unirest.get(
				"https://api.themoviedb.org/3/genre/movie/list?api_key=73f8742e7eae9af2fcd6ac7768261fbe&language=pt-BR")
				.asString();

		ObjectMapper mapper = new ObjectMapper();
		mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);

		GenresRequest genre = mapper.readValue(response.getBody(), GenresRequest.class);

		for (int i = 0; i < genre.getListGenres().size(); i++) {
			System.out.println("id: " + genre.getListGenres().get(i).getIdGenre()+ "\n Name: "
					+ genre.getListGenres().get(i).getGenreName());
		}

	}

	public void getMoviesJSON() {

	}

	public void getTVShowsJSON() {

	}

	public void getCrewJSON() {

	}

}
