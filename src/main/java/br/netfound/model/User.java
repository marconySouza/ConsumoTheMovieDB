/**
 * @author marcony.souza
 */
package br.netfound.model;

/**
 * @author marcony.souza
 *
 */
public class User {

	private Integer idUser;
	
	private String username;
	
	private String password;
	
	private Boolean flagAdmin;

	public Integer getIdUser() {
		return idUser;
	}

	public void setIdUser(Integer idUser) {
		this.idUser = idUser;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Boolean getFlagAdmin() {
		return flagAdmin;
	}

	public void setFlagAdmin(Boolean flagAdmin) {
		this.flagAdmin = flagAdmin;
	}	
	
}
