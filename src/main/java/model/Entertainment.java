/**
 * @author marcony.souza
 */
package model;

import com.fasterxml.jackson.annotation.JsonProperty;

/**
 * @author marcony.souza
 *
 */
public class Entertainment {

	@JsonProperty("overview")
	private String overview;

	@JsonProperty("poster_path")
	private String uriFrontImage = "https://image.tmdb.org/t/p/original";

	@JsonProperty("original_language")
	private String originalLanguage;

	public String getOverview() {
		return overview;
	}

	public void setOverview(String overview) {
		this.overview = overview;
	}

	public String getUriFrontImage() {
		return uriFrontImage;
	}

	public void setUriFrontImage(String uriFrontImage) {
		this.uriFrontImage += uriFrontImage;
	}

	public String getOriginalLanguage() {
		return originalLanguage;
	}

	public void setOriginalLanguage(String originalLanguage) {
		this.originalLanguage = originalLanguage;
	}

}
