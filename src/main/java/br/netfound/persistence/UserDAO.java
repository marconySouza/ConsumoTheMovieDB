/**
 * 
 */
package br.netfound.persistence;

import java.lang.reflect.GenericArrayType;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.web.bind.annotation.ModelAttribute;

import br.netfound.database.DBConnection;
import br.netfound.model.Movies;
import br.netfound.model.TVShows;

/**
 * @author marcony.souza
 *
 */
public class UserDAO {

	public boolean alterUser(String idUser, String username, String password) {

		if (idUser == null)
			return false;

		try {
			Connection con = DBConnection.getConnection();
			Statement stm = con.createStatement();

			String query = "UPDATE USERS SET USERNAME = '" + username + "', PASSWORD = '" + password
					+ "' where id_user = " + idUser;

			stm.execute(query);
			return true;

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;

	}

	public boolean createUser(String username, String password) throws Exception {
		Connection con = DBConnection.getConnection();
		Statement stm = con.createStatement();

		try {

			String query = "SELECT COUNT(id_user) as qtd FROM USERS WHERE USERNAME = '" + username + "'";
			ResultSet rs = stm.executeQuery(query);
			rs.next();
			int count = rs.getInt("qtd");
			if (count > 0)
				throw new Exception("Já existe um usuário com esse username");

			String queryInsert = "INSERT INTO USERS (ID_USER, USERNAME, PASSWORD, FLAG_ADMIN) VALUES (DEFAULT, '"
					+ username + "', '" + password + "', 0)";
			stm.execute(queryInsert);
			return true;
		} catch (SQLException e) {
			con.rollback();
			e.printStackTrace();
		}
		return false;
	}

	public boolean authenticateUser(String username, String password) throws Exception {
		Connection con = DBConnection.getConnection();
		Statement stm = con.createStatement();
		try {

			String query = "SELECT COUNT(id_user) as qtd FROM USERS WHERE USERNAME = '" + username
					+ "' and PASSWORD = '" + password + "'";
			ResultSet rs = stm.executeQuery(query);
			rs.next();
			int qtd = rs.getInt("qtd");
			if (qtd == 1)
				return true;
			else
				throw new Exception("Verifique se o login ou senha estão corretos");

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	/**
	 * marcony.souza
	 * 
	 * @throws SQLException
	 * 
	 */
	public boolean saveInMyList(String idEntertainment, String idUser, String type) throws SQLException {
		Connection con = DBConnection.getConnection();
		Statement stm = con.createStatement();
		try {
			String query = "";
			if (type.equalsIgnoreCase("filme")) {
				query += "INSERT INTO SAVED_MOVIES (ID_SAVED_MOVIES, ID_MOVIE, ID_USER) VALUES (DEFAULT, "
						+ idEntertainment + ", " + idUser + ")";
			} else {
				query += "INSERT INTO SAVED_TV_SHOWS (ID_TV_SHOW_SAVED, ID_TV_SHOW, ID_USER) VALUES (DEFAULT, "
						+ idEntertainment + ", " + idUser + ")";
			}
			stm.execute(query);
			return true;
		} catch (Exception e) {
			con.rollback();
			e.printStackTrace();
		}
		return false;
	}

	public Map<String, List<?>> getMyList(String idUser) throws SQLException {
		Connection con = DBConnection.getConnection();
		Statement stm = con.createStatement();
		List<Movies> listMovies = new ArrayList<>();
		List<TVShows> listTvShows = new ArrayList<>();
		Map<String, List<?>> myList = new HashMap<String, List<?>>();
		GenreDAO dao = new GenreDAO();

		try {
			String query = "SELECT TV_SHOW.ID_TV_SHOW, TV_SHOW.URI_FRONT_IMAGE, TV_SHOW.TITLE, TV_SHOW.OVERVIEW, TV_SHOW.ORIGINAL_LANGUAGE, TV_SHOW.RELEASE_DATE, TV_SHOW.QUANTITY_SEASONS, TV_SHOW.QUANTITY_EPISODES from TV_SHOWS as TV_SHOW "
					+ "inner join saved_tv_shows as saved_tv on (saved_tv.id_tv_show = tv_show.id_tv_show) "
					+ "where saved_tv.id_user = " + idUser;

			ResultSet rs = stm.executeQuery(query);
			while (rs.next()) {
				TVShows tvShow = new TVShows();
				tvShow.setIdTvShow(rs.getInt("ID_TV_SHOW"));
				tvShow.setOriginalLanguage(rs.getString("ORIGINAL_LANGUAGE"));
				tvShow.setUriFrontImage(rs.getString("URI_FRONT_IMAGE") == null ? "" : rs.getString("URI_FRONT_IMAGE"));
				tvShow.setTitle(rs.getString("TITLE"));
				tvShow.setOverview(rs.getString("OVERVIEW") == null ? "" : rs.getString("OVERVIEW"));
				tvShow.setReleaseDate(rs.getDate("RELEASE_DATE"));
				tvShow.setGenres(dao.listTvShowsGenre(tvShow.getIdTvShow()));
				listTvShows.add(tvShow);
			}
			query = "select MOVIE.ID_MOVIE, MOVIE.URI_FRONT_IMAGE, MOVIE.URI_BACK_IMAGE, MOVIE.OVERVIEW, MOVIE.TITLE, MOVIE.ORIGINAL_LANGUAGE, MOVIE.RELEASE_DATE, MOVIE.DIRECTOR from MOVIES as MOVIE "
					+ "inner join saved_movies on (saved_movies.id_movie = movie.id_movie) "
					+ "where saved_movies.id_user = " + idUser;
			rs = stm.executeQuery(query);

			while (rs.next()) {
				Movies movie = new Movies();
				movie.setIdMovie(rs.getInt("ID_MOVIE"));
				movie.setOriginalLanguage(rs.getString("ORIGINAL_LANGUAGE"));
				movie.setUriFrontImage(rs.getString("URI_FRONT_IMAGE") == null ? "" : rs.getString("URI_FRONT_IMAGE"));
				movie.setUriBackImage(rs.getString("URI_BACK_IMAGE") == null ? "" : rs.getString("URI_BACK_IMAGE"));
				movie.setTitle(rs.getString("TITLE"));
				movie.setOverview(rs.getString("OVERVIEW") == null ? "" : rs.getString("OVERVIEW"));
				movie.setReleaseDate(rs.getDate("RELEASE_DATE"));
				movie.setDirector(rs.getString("DIRECTOR") == null ? "" : rs.getString("DIRECTOR"));
				movie.setGenres(dao.listMovieGenres(movie.getIdMovie()));
				listMovies.add(movie);
			}
			myList.put("MOVIES", listMovies);
			myList.put("TVSHOWS", listTvShows);
			return myList;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
