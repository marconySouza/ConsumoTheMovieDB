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
public class TVShows extends Entertainment{

	@JsonProperty("id")
	private Integer idTvShow;
	
	@JsonProperty("name")
	private String title;
	
	@JsonProperty("number_of_seasons")
	private Integer seasonsQuantity;
	
	@JsonProperty("number_of_episodes")
	private Integer episodesQuantity;
	
	@JsonProperty("first_air_date")
	private Date releaseDate;
	
	@JsonProperty("genres")
	private List<Genres> genres;
	
	@JsonProperty("popularity")
	private double popularity;

	public Integer getIdTvShow() {
		return idTvShow;
	}

	public void setIdTvShow(Integer idTvShow) {
		this.idTvShow = idTvShow;
	}

	public Integer getSeasonsQuantity() {
		return seasonsQuantity;
	}

	public void setSeasonsQuantity(Integer seasonsQuantity) {
		this.seasonsQuantity = seasonsQuantity;
	}

	public Integer getEpisodesQuantity() {
		return episodesQuantity;
	}

	public void setEpisodesQuantity(Integer episodesQuantity) {
		this.episodesQuantity = episodesQuantity;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public List<Genres> getGenres() {
		return genres;
	}

	public void setGenres(List<Genres> genres) {
		this.genres = genres;
	}

	public Date getReleaseDate() {
		return releaseDate;
	}

	public void setReleaseDate(Date releaseDate) {
		this.releaseDate = releaseDate;
	}

	public double getPopularity() {
		return popularity;
	}

	public void setPopularity(double popularity) {
		this.popularity = popularity;
	}
	
}
