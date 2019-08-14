package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import model.Cmt;
import sql.CmtSQL;

public class CmtDAOImpl extends BaseDAO implements CmtDAO {

	@Override
	public List<Cmt> selectAll() {

		List<Cmt> cmtList = new ArrayList<Cmt>();

		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;

		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(CmtSQL.CMT_SELCTE_ALL_SQL);
			resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				Cmt cmt = new Cmt();

				cmt.setCmt_no(resultSet.getInt("cmt_no"));
				cmt.setMember_no(resultSet.getInt("member_no"));
				cmt.setId(resultSet.getString("id"));
				cmt.setCmt_con(resultSet.getString("cmt_con"));
				cmt.setRating(resultSet.getInt("rating"));
				cmt.setCmt_date(resultSet.getString("cmt_date"));
				cmt.setLecture_no(resultSet.getInt("lecture_no"));

				cmtList.add(cmt);

			}
		} catch (SQLException e) {
			e.printStackTrace();

		} finally {

			closeDBObjects(resultSet, preparedStatement, connection);
		}
		return cmtList;
	}

	@Override
	public Cmt insert(Cmt cmt) {

		Cmt selectByComment = null;

		Connection connection = null;
		PreparedStatement preparedStatement = null;

		Statement statement = null;
		ResultSet resultSet = null;

		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(CmtSQL.CMT_INSERT_SQL);

			preparedStatement.setInt(1, cmt.getMember_no());
			preparedStatement.setInt(2, cmt.getLecture_no());
			preparedStatement.setString(3, cmt.getId());
			preparedStatement.setString(4, cmt.getCmt_con());
			preparedStatement.setInt(5, cmt.getRating());

			int rowCount = preparedStatement.executeUpdate();

			if (rowCount > 0) {
				statement = connection.createStatement();
				resultSet = statement.executeQuery(CmtSQL.CMT_SELECT_SEQCURRVAL_SQL);

				if (resultSet.next()) {
					selectByComment = selectByCmt_no(resultSet.getInt("num"));
				}

			}
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			closeDBObjects(resultSet, preparedStatement, null);
			closeDBObjects(null, preparedStatement, connection);
		}
		return selectByComment;

	}

	@Override
	public Cmt selectByCmt_no(int cmt_no) {

		Cmt cmt = new Cmt();
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;

		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(CmtSQL.CMT_SELECT_BY_CMT_NO_SQL);
			preparedStatement.setInt(1, cmt_no);
			resultSet = preparedStatement.executeQuery();

			if (resultSet.next()) {

				cmt.setCmt_no(resultSet.getInt("cmt_no"));
				cmt.setLecture_no(resultSet.getInt("lecture_no"));
				cmt.setMember_no(resultSet.getInt("member_no"));
				cmt.setId(resultSet.getString("id"));
				cmt.setCmt_con(resultSet.getString("cmt_con"));
				cmt.setRating(resultSet.getInt("rating"));
				cmt.setCmt_date(resultSet.getString("cmt_date"));
				
			}

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			closeDBObjects(resultSet, preparedStatement, connection);
		}
		return cmt;

	}

	@Override
	public boolean deleteByCmt_no(int cmt_no) {

		boolean result = false;
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(CmtSQL.CMT_DELETE_BY_CMT_NO_SQL);
			preparedStatement.setInt(1, cmt_no);

			int rowCount = preparedStatement.executeUpdate();

			if (rowCount > 0) {

				result = true;
			}

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {

			closeDBObjects(null, preparedStatement, connection);
		}
		return result;

	}
}
