/**
 * @author marcony.souza
 */
package br.netfound.model;

import java.sql.Date;

/**
 * @author marcony.souza
 *
 */
public class Answers {
	
	private Integer idGenre;
	
	private String beginDateInterval;
	
	private String endDateInterval;
	
	private String director;
	
	public String getBeginDateInterval() {
		return beginDateInterval;
	}

	public void setBeginDateInterval(String beginDateInterval) {
		this.beginDateInterval = beginDateInterval;
	}

	public String getEndDateInterval() {
		return endDateInterval;
	}

	public void setEndDateInterval(String endDateInterval) {
		this.endDateInterval = endDateInterval;
	}

	public String getDirector() {
		return director;
	}

	public void setDirector(String director) {
		this.director = director;
	}

	public Integer getIdGenre() {
		return idGenre;
	}

	public void setIdGenre(Integer idGenre) {
		this.idGenre = idGenre;
	}

}
