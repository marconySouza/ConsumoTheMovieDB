/**
 * @author marcony.souza
 */
package br.netfound.model;

import com.fasterxml.jackson.annotation.JsonProperty;

/**
 * @author marcony.souza
 *
 */
public class Crew {

	@JsonProperty("name")
	private String name;

	@JsonProperty("job")
	private String job;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getJob() {
		return job;
	}

	public void setJob(String job) {
		this.job = job;
	}
	
}
