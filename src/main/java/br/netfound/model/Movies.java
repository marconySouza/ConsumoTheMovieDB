/**
 * @author marcony.souza
 */
package br.netfound.model;

import java.sql.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonProperty;

/**
 * @author marcony.souza
 *
 */
public class Movies extends Entertainment {

	@JsonProperty("id")
	private Integer idMovie;
	
	@JsonProperty("title")
	private String title;

	private String director;

	@JsonProperty("backdrop_path")
	private String uriBackImage;

	@JsonProperty("release_date")
	private Date releaseDate;
	
	@JsonProperty("genres")
	private List<Genres> genres;

	public Integer getIdMovie() {
		return idMovie;
	}

	public void setIdMovie(Integer idMovie) {
		this.idMovie = idMovie;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDirector() {
		return director;
	}

	public void setDirector(String director) {
		this.director = director;
	}

	public Date getReleaseDate() {
		return releaseDate;
	}

	public void setReleaseDate(Date releaseDate) {
		this.releaseDate = releaseDate;
	}

	@Override
	public String toString() {
		return "Movies [idMovie=" + idMovie + ", title=" + title + ",  director=" + director
				+ ", UriBackImage=" + uriBackImage + ", releaseDate=" + releaseDate + "]";
	}

	public List<Genres> getGenres() {
		return genres;
	}

	public void setGenres(List<Genres> genres) {
		this.genres = genres;
	}

	public String getUriBackImage() {
		return uriBackImage;
	}

	public void setUriBackImage(String uriBackImage) {
		this.uriBackImage =  uriBackImage;
	}

}