/**
 * 
 */
package br.netfound.model;

import java.util.ArrayList;

import com.fasterxml.jackson.annotation.JsonProperty;

/**
 * @author marcony.souza
 *
 */
public class CrewRequest {
	
	@JsonProperty("crew")
	private ArrayList<Crew> crewList;

	public ArrayList<Crew> getCrewList() {
		return crewList;
	}

	public void setCrewList(ArrayList<Crew> crewList) {
		this.crewList = crewList;
	}


}
