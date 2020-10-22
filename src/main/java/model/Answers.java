/**
 * @author marcony.souza
 */
package model;

import java.sql.Date;

/**
 * @author marcony.souza
 *
 */
public class Answers {
	
	private Genres idGenre;
	
	private Date beginDateInterval;
	
	private Date endDateInterval;
	
	private String director;
	
	private Boolean isFilme;

	public Genres getIdGenre() {
		return idGenre;
	}

	public void setIdGenre(Genres idGenre) {
		this.idGenre = idGenre;
	}

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

	public Boolean getIsFilme() {
		return isFilme;
	}

	public void setIsFilme(Boolean isFilme) {
		this.isFilme = isFilme;
	}

}
