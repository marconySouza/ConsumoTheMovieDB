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
import br.netfound.model.Genres;
import br.netfound.model.Movies;
import br.netfound.model.TVShows;

/**
 * @author marcony.souza
 *
 */
public class GenreDAO {

	public List<Genres> listMovieGenres(Integer idMovie) throws Exception {
		List<Genres> list = new ArrayList<Genres>();
		Connection con = DBConnection.getConnection();
		Statement stm = con.createStatement();
		try {
			String query = "SELECT movie_genre.ID_GENRE, GENRE.GENRE_NAME FROM movie_genre "
					+ "inner join genre on (genre.id_genre = movie_genre.id_genre) "
					+ "inner join movies as movie on (movie.id_movie = movie_genre.id_movie) where movie_genre.id_movie = "
					+ idMovie;
			ResultSet rs = stm.executeQuery(query);
			while (rs.next()) {
				Genres g = new Genres();
				g.setGenreName(rs.getString("GENRE_NAME"));
				g.setIdGenre(rs.getInt("ID_GENRE"));
				list.add(g);
			}
			return list;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public List<Genres> listTvShowsGenre(Integer idTvShow) throws Exception {
		List<Genres> list = new ArrayList<Genres>();
		Connection con = DBConnection.getConnection();
		Statement stm = con.createStatement();
		try {
			String query = "SELECT tv_show_genre.id_genre, GENRE.GENRE_NAME FROM tv_show_genre "
					+ "inner join genre on (genre.id_genre = tv_show_genre.id_genre) "
					+ "inner join tv_shows as tv_shows on (tv_shows.id_tv_show = tv_show_genre.id_tv_show) where tv_show_genre.id_tv_show = "
					+ idTvShow;
			ResultSet rs = stm.executeQuery(query);
			while (rs.next()) {
				Genres g = new Genres();
				g.setGenreName(rs.getString("GENRE_NAME"));
				g.setIdGenre(rs.getInt("ID_GENRE"));
				list.add(g);
			}
			return list;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public List<Genres> listGenres() throws Exception {
		List<Genres> list = new ArrayList<Genres>();
		Connection con = DBConnection.getConnection();
		Statement stm = con.createStatement();
		try {
			String query = "SELECT GENRE.ID_GENRE, GENRE.GENRE_NAME FROM GENRE";
			ResultSet rs = stm.executeQuery(query);
			while (rs.next()) {
				Genres g = new Genres();
				g.setGenreName(rs.getString("GENRE_NAME"));
				g.setIdGenre(rs.getInt("ID_GENRE"));
				list.add(g);
			}
			return list;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public void addGenres(Genres genre) throws Exception {
		Connection con = DBConnection.getConnection();
		Statement stm = con.createStatement();
		try {

			String query = "SELECT COUNT(id_genre) as qtd FROM GENRE WHERE GENRE_NAME = '" + genre.getGenreName() + "'";
			ResultSet rs = stm.executeQuery(query);
			rs.next();
			int count = rs.getInt("qtd");
			if (count > 0)
				throw new Exception("J� existe um Genero com esse nome");

			String queryInsert = "INSERT INTO GENRE (ID_GENRE, GENRE_NAME) VALUES (" + genre.getIdGenre() + ", '"
					+ genre.getGenreName() + "')";
			stm.execute(queryInsert);
		} catch (SQLException e) {
			con.rollback();
			e.printStackTrace();
		}
	}

	public void addMoviesGenres(Movies movie) throws Exception {
		Connection con = DBConnection.getConnection();
		Statement stm = con.createStatement();
		try {
			String query;
			for (int i = 0; i < movie.getGenres().size(); i++) {
				query = "INSERT INTO MOVIE_GENRE (ID_MOVIE_GENRE, ID_MOVIE, ID_GENRE) VALUES (DEFAULT, "
						+ movie.getIdMovie() + ", " + movie.getGenres().get(i).getIdGenre() + ")";
				stm.execute(query);
			}

		} catch (SQLException e) {
			con.rollback();
			e.printStackTrace();
		}
	}

	public void addTvShowGenres(TVShows tvShows) throws Exception {
		Connection con = DBConnection.getConnection();
		Statement stm = con.createStatement();
		try {
			String query;
			for (int i = 0; i < tvShows.getGenres().size(); i++) {
				query = "INSERT INTO TV_SHOW_GENRE (ID_TV_SHOW_GENRE, ID_TV_SHOW, ID_GENRE) VALUES (DEFAULT, "
						+ tvShows.getIdTvShow() + ", " + tvShows.getGenres().get(i).getIdGenre() + ")";
				stm.execute(query);
			}

		} catch (SQLException e) {
			con.rollback();
			e.printStackTrace();
		}
	}

}
