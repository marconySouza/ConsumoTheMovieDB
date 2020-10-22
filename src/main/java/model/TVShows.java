/**
 * @author marcony.souza
 */
package model;

import java.sql.Date;

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
	
}
