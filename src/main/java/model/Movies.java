/**
 * @author marcony.souza
 */
package model;

import java.sql.Date;
import java.util.ArrayList;

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

	@JsonProperty("crew")
	private ArrayList<Crew> crewList;

	private String director;

	@JsonProperty("backdrop_path")
	private String UriBackImage = "https://image.tmdb.org/t/p/original";

	@JsonProperty("release_date")
	private Date releaseDate;

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

	public String getUriBackImage() {
		return UriBackImage;
	}

	public void setUriBackImage(String uriBackImage) {
		UriBackImage += uriBackImage;
	}

	public ArrayList<Crew> getCrewList() {
		return crewList;
	}

	public void setCrewList(ArrayList<Crew> crewList) {
		this.crewList = crewList;
	}

	public Date getReleaseDate() {
		return releaseDate;
	}

	public void setReleaseDate(Date releaseDate) {
		this.releaseDate = releaseDate;
	}

}
