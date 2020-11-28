/**
 * 
 */
package br.netfound.service;

import java.sql.Date;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import br.netfound.model.Answers;
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
	@PostMapping("/sign-in")
	public String signIn(@RequestParam String username, @RequestParam String password) throws Exception {
		String msg = "";

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
	@GetMapping("/my-list")
	public ResponseEntity<Map<String, List<?>>> getMyList(@RequestParam String idUser) throws SQLException {
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

	@PostMapping("/save-my-list")
	public String saveInMyList(@RequestParam String idEntertainment, @RequestParam String idUser,
			@RequestParam String type) throws SQLException {
		String msg = "";

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
	@GetMapping("/sugestion")
	public ResponseEntity<List<?>> getSugestion(@RequestParam String idGenre, @RequestParam String director,
			@RequestParam Date beginDate, @RequestParam Date endDate, @RequestParam String type) throws Exception {

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
	@PostMapping("/create-user")
	public String createUser(@RequestParam String username, @RequestParam String password) throws Exception {
		String msg = "";
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
	@PutMapping("/alter-user")
	public String alterUser(@RequestParam String idUser, @RequestParam String username, @RequestParam String password)
			throws Exception {
		String msg = "";
		if (validString(username, password)) {

			UserDAO dao = new UserDAO();
			boolean authentication = dao.alterUser(idUser, username, password);
			msg += authentication ? "Alterado com sucesso!" : "Erro ao Alterar, tente novamente";
		}
		return msg;
	}

}
