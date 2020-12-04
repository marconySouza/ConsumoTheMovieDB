/**
 * 
 */
package br.netfound.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.json.JSONObject;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import br.netfound.model.Answers;
import br.netfound.model.Genres;
import br.netfound.persistence.GenreDAO;
import br.netfound.persistence.MoviesDAO;
import br.netfound.persistence.TVShowDAO;
import br.netfound.persistence.UserDAO;

/**
 * @author marcony.souza
 *
 */
@RestController
@RequestMapping("/services")
public class NetfoundService {

	/**
	 * marcony.souza
	 * 
	 * @throws Exception
	 * 
	 */
	@PostMapping(value="/sign-in", produces={"application/json","application/xml"}, consumes="application/json")
	public String signIn(@RequestBody String body) throws Exception {
		String msg = "";
		JSONObject json = new JSONObject(body);
		String username = json.getString("username");
		String password = json.getString("password");
		if (validString(username, password)) {
			UserDAO dao = new UserDAO();
			boolean authentication = dao.authenticateUser(username, password);
			msg += authentication ? "Autenticado com sucesso!" : "Não autenticado, tente novamente";
		}

		return msg;
	}

	/**
	 * marcony.souza
	 * 
	 * @throws SQLException
	 * 
	 */
	@GetMapping(value="/my-list", produces={"application/json","application/xml"}, consumes="application/json")
	public ResponseEntity<Map<String, List<?>>> getMyList(@RequestBody String body) throws SQLException {
		JSONObject json = new JSONObject(body);
		String idUser = json.getString("id_user");
		UserDAO dao = new UserDAO();
		return ResponseEntity.ok(dao.getMyList(idUser));
	}

	/**
	 * marcony.souza
	 * 
	 */
	@GetMapping("/directors")
	public ResponseEntity<List<String>> getDirectors() throws SQLException {
		MoviesDAO dao = new MoviesDAO();

		return ResponseEntity.ok(dao.getDirectors());
	}

	/**
	 * marcony.souza
	 * @throws Exception 
	 * 
	 */
	@GetMapping(value="/genres", produces={"application/json","application/xml"}, consumes="application/json")
	public ResponseEntity<List<Genres>> getGenres() throws Exception {
		GenreDAO dao = new GenreDAO();

		return ResponseEntity.ok(dao.listGenres());
	}
	
	@PostMapping("/save-my-list")
	public String saveInMyList(@RequestBody String body) throws SQLException {
		String msg = "";
		JSONObject json = new JSONObject(body);
		String idEntertainment = json.getString("id_entertainment");
		String idUser = json.getString("id_user");
		String type = json.getString("type");
		UserDAO dao = new UserDAO();
		boolean result = dao.saveInMyList(idEntertainment, idUser, type);
		msg = result ? "Salvo com sucesso!" : "Erro ao salvar, tente novamente.";

		return msg;
	}

	/**
	 * marcony.souza
	 * 
	 * @throws Exception
	 * 
	 */
	@GetMapping(value="/sugestion", produces={"application/json","application/xml"})
	public ResponseEntity<List<?>> getSugestion(@RequestParam("id_genre") String idGenre, @RequestParam String director, @RequestParam("begin_date") String beginDate, @RequestParam("end_date") String endDate, @RequestParam String type) throws Exception {

		Answers answers = new Answers();
		answers.setBeginDateInterval(beginDate);
		answers.setEndDateInterval(endDate);
		answers.setDirector(director);
		answers.setIdGenre(Integer.parseInt(idGenre));

		if (type.equalsIgnoreCase("filme")) {
			MoviesDAO dao = new MoviesDAO();
			return ResponseEntity.ok(dao.getInterestingMovies(answers));
		} else {
			TVShowDAO dao = new TVShowDAO();
			return ResponseEntity.ok(dao.getInterestingTvShow(answers));
		}

	}

	/**
	 * marcony.souza
	 * 
	 * @throws Exception
	 * 
	 */
	@PostMapping(value="/create-user", produces={"application/json","application/xml"}, consumes="application/json")
	public String createUser(@RequestBody String body) throws Exception {
		String msg = "";
		JSONObject json = new JSONObject(body);
		String username = json.getString("username");
		String password = json.getString("password");
		if (validString(username, password)) {

			UserDAO dao = new UserDAO();
			boolean authentication = dao.createUser(username, password);
			msg += authentication ? "Criado com sucesso!" : "Erro ao criar, tente novamente";
		}
		return msg;

	}

	private static boolean validString(String username, String password) throws Exception {
		if (username.isBlank()) {
			throw new Exception("Username está vazio, informe um Username para prosseguir");
		} else if (password.isBlank()) {
			throw new Exception("Password está vazio, informe um Password para prosseguir");
		}
		return true;
	}

	/**
	 * marcony.souza
	 * 
	 * @throws Exception
	 * 
	 */
	@PutMapping(value="/alter-user", produces={"application/json","application/xml"}, consumes="application/json")
	
	public String alterUser(@RequestBody String body)
			throws Exception {
		String msg = "";
		JSONObject json = new JSONObject(body);
		String username = json.getString("username");
		String password = json.getString("password");
		String idUser = json.getString("id_user");
		if (validString(username, password)) {

			UserDAO dao = new UserDAO();
			boolean authentication = dao.alterUser(idUser, username, password);
			msg += authentication ? "Alterado com sucesso!" : "Erro ao Alterar, tente novamente";
		}
		return msg;
	}

}
