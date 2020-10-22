/**
 * @author marcony.souza
 */
package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.mashape.unirest.http.HttpResponse;
import com.mashape.unirest.http.Unirest;
import com.mashape.unirest.http.exceptions.UnirestException;

import model.Genres;

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
	public static void main(String[] args) throws JsonParseException, JsonMappingException, UnirestException, IOException {
		
		getGenreJSON();
		
	}

	public static void getGenreJSON() throws UnirestException, JsonParseException, JsonMappingException, IOException {
		
		Unirest.setTimeouts(0, 0);
		HttpResponse<String> response = Unirest.get("https://api.themoviedb.org/3/genre/movie/list?api_key=73f8742e7eae9af2fcd6ac7768261fbe&language=pt-BR").asString();

		ObjectMapper mapper = new ObjectMapper();
		mapper.configure(DeserializationFeature.UNWRAP_ROOT_VALUE, true);
		
		List<Genres> listGenres = mapper.readValue(response.getBody(), new TypeReference<List<Genres>>(){});

		for (int i = 0; i < listGenres.size(); i++) {
			System.out.println("id: " + listGenres.get(i).getIdGenre() + "\n Name: " + listGenres.get(i).getGenreName());	
			}			

		
	}

	public void getMoviesJSON() {
		
	}

	public void getTVShowsJSON() {

	}
	
	public void getCrewJSON() {
		
	}

}
