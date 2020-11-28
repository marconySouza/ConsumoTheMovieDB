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
	
	private Date beginDateInterval;
	
	private Date endDateInterval;
	
	private String director;
	
	public Date getBeginDateInterval() {
		return beginDateInterval;
	}

	public void setBeginDateInterval(Date beginDateInterval) {
		this.beginDateInterval = beginDateInterval;
	}

	public Date getEndDateInterval() {
		return endDateInterval;
	}

	public void setEndDateInterval(Date endDateInterval) {
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
