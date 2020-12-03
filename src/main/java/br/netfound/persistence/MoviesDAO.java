/**
 * 
 */
package br.netfound.persistence;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import br.netfound.database.DBConnection;
import br.netfound.model.Answers;
import br.netfound.model.Movies;

/**
 * @author marcony.souza
 *
 */
public class MoviesDAO {

	public void addMovie(Movies movie) throws Exception {
		Connection con = DBConnection.getConnection();
		Statement stm = con.createStatement();
		GenreDAO dao = new GenreDAO();
		try {
			String director = "";
			String title = movie.getTitle().replaceAll("'", "");
			if (movie.getDirector() != null)
				director = movie.getDirector().replaceAll("'", "");

			String overview = movie.getOverview().replaceAll("'", "");

			String query = "INSERT INTO MOVIES (ID_MOVIE, URI_FRONT_IMAGE, URI_BACK_IMAGE, TITLE, RELEASE_DATE, OVERVIEW, ORIGINAL_LANGUAGE, DIRECTOR) values ("
					+ movie.getIdMovie() + ", '" + movie.getUriFrontImage() + "', '" + movie.getUriBackImage() + "', '"
					+ title + "', '" + movie.getReleaseDate() + "', '" + overview + "', '" + movie.getOriginalLanguage()
					+ "', '" + director + "')";
			stm.execute(query);
			dao.addMoviesGenres(movie);

		} catch (SQLException e) {
			con.rollback();
			e.printStackTrace();
		}
	}

	public List<String> getDirectors() throws SQLException {
		List<String> listDirectors = new ArrayList<String>();
		Connection con = DBConnection.getConnection();
		Statement stm = con.createStatement();
		try {

			String query = "select distinct(director) from movies where director <> 'null'";

			ResultSet rs = stm.executeQuery(query);
			while (rs.next()) {
				String director = rs.getString("director");
				listDirectors.add(director);
			}
			return listDirectors;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public List<Movies> getInterestingMovies(Answers answers) throws Exception {
		List<Movies> listMovies = new ArrayList<Movies>();
		Connection con = DBConnection.getConnection();
		Statement stm = con.createStatement();
		GenreDAO dao = new GenreDAO();
		try {
			String query = "select distinct(MOVIE.ID_MOVIE), MOVIE.POPULARITY, MOVIE.URI_FRONT_IMAGE, MOVIE.URI_BACK_IMAGE, MOVIE.TITLE, MOVIE.OVERVIEW, MOVIE.ORIGINAL_LANGUAGE, MOVIE.RELEASE_DATE, MOVIE.DIRECTOR from MOVIES as MOVIE "
					+ "inner join movie_genre as movie_genre on (movie_genre.id_movie = movie.id_movie) "
					+ "where 1 = 1 and movie.release_date between '" + answers.getBeginDateInterval() + "' and '"
					+ answers.getEndDateInterval() + "' ";
			if (answers.getIdGenre() != 0)
				query += "and movie_genre.id_genre = " + answers.getIdGenre();

			if (!answers.getDirector().isBlank())
				query += " and movie.director = '" + answers.getDirector() + "'";

			query += " order by popularity desc";
			ResultSet rs = stm.executeQuery(query);

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
			return listMovies;

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return null;
	}
}
