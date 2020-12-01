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
import br.netfound.model.TVShows;

/**
 * @author marcony.souza
 *
 */
public class TVShowDAO {

	public void addTvShow(TVShows tvShow) throws Exception {
		Connection con = DBConnection.getConnection();
		Statement stm = con.createStatement();
		GenreDAO dao = new GenreDAO();
		try {
			String title = tvShow.getTitle().replaceAll("'", "");
			String overview = tvShow.getOverview().replaceAll("'", "");
			
			String query = "INSERT INTO TV_SHOWS (ID_TV_SHOW, TITLE, OVERVIEW, RELEASE_DATE, QUANTITY_SEASONS, QUANTITY_EPISODES, ORIGINAL_LANGUAGE, URI_FRONT_IMAGE, popularity) values ("
					+ tvShow.getIdTvShow() + ", '" + title + "', '" + overview + "', '"
					+ tvShow.getReleaseDate() + "', " + tvShow.getSeasonsQuantity() + ", "
					+ tvShow.getEpisodesQuantity() + ", '" + tvShow.getOriginalLanguage() + "', '"
					+ tvShow.getUriFrontImage() + "', "+tvShow.getPopularity()+")";
			stm.execute(query);
			dao.addTvShowGenres(tvShow);

		} catch (SQLException e) {
		//	con.rollback();
			e.printStackTrace();
		}
	}

	public List<TVShows> getInterestingTvShow(Answers answers) throws Exception {
		List<TVShows> listTvShows = new ArrayList<TVShows>();
		Connection con = DBConnection.getConnection();
		Statement stm = con.createStatement();
		GenreDAO dao = new GenreDAO();
		try {
			String query = "select distinct(TV_SHOW.ID_TV_SHOW), TV_SHOW.URI_FRONT_IMAGE, TV_SHOW.TITLE, TV_SHOW.OVERVIEW, TV_SHOW.ORIGINAL_LANGUAGE, TV_SHOW.RELEASE_DATE, TV_SHOW.QUANTITY_SEASONS, TV_SHOW.QUANTITY_EPISODES  from TV_SHOWS as TV_SHOW "
					+ "inner join tv_show_genre as tv_show_genre on (tv_show_genre.id_tv_show = tv_show.id_tv_show) "
					+ "where 1 = 1 and tv_show.release_date between '" + answers.getBeginDateInterval() + "' and '"
					+ answers.getEndDateInterval() + "' ";
			if (answers.getIdGenre() != 0)
				query += "and tv_show_genre.id_genre = " + answers.getIdGenre();

			query += " order by popularity desc";
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
			return listTvShows;

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return null;
	}

}
