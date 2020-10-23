/**
 * @author marcony.souza
 */
package model;

import java.util.ArrayList;

import com.fasterxml.jackson.annotation.JsonProperty;

/**
 * @author marcony.souza
 *
 */
public class GenresRequest {

	@JsonProperty("genres")
	ArrayList<Genres> listGenres;
	
	public ArrayList<Genres> getListGenres() {
		return listGenres;
	}

	public void setListGenres(ArrayList<Genres> listGenres) {
		this.listGenres = listGenres;
	}
	
}
