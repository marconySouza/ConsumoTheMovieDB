/**
 * @author marcony.souza
 */
package model;

import com.fasterxml.jackson.annotation.JsonProperty;

/**
 * @author marcony.souza
 *
 */
public class Genres {
	
	@JsonProperty("id")
	private Integer idGenre;
	
	public Genres() {
		super();
	}

	@JsonProperty("name")
	private String genreName;

	public Integer getIdGenre() {
		return idGenre;
	}

	public void setIdGenre(Integer idGenre) {
		this.idGenre = idGenre;
	}

	public String getGenreName() {
		return genreName;
	}

	public void setGenreName(String genreName) {
		this.genreName = genreName;
	}

}
