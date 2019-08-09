package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Qna;
import sql.QnaSQL;

public class QnaDAOImpl extends BaseDAO implements QnaDAO {

	@Override
	public Qna QnaInsert(Qna qna) {

		Connection connection = null;
		PreparedStatement preparedStatement = null;

		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(QnaSQL.QNA_INSERT_SQL);

			preparedStatement.setInt(1, qna.getMember_no());
			preparedStatement.setString(2, qna.getId());
			preparedStatement.setString(3, qna.getQna_title());
			preparedStatement.setString(4, qna.getQna_con());

			preparedStatement.executeQuery();

		} catch (SQLException e) {

			e.printStackTrace();

		} finally {
			closeDBObjects(null, preparedStatement, connection);
		}
		return qna;

	}

	@Override
	public List<Qna> selectAll() {

		List<Qna> qnaList = new ArrayList<Qna>();
		Connection connection = null;
		ResultSet resultSet = null;
		PreparedStatement preparedStatement = null;

		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(QnaSQL.QNA_SELETE_ALL_SQL);
			resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {

				Qna qna = new Qna();

				qna.setQna_no(resultSet.getInt("qna_no"));
				qna.setMember_no(resultSet.getInt("member_no"));
				qna.setId(resultSet.getString("id"));
				qna.setQna_title(resultSet.getString("qna_title"));
				qna.setQna_con(resultSet.getString("qna_con"));
				qna.setQna_date(resultSet.getString("qna_date").split("\\s")[0]);
				qna.setVisited(resultSet.getInt("visited"));
				qna.setGrp(resultSet.getInt("grp"));
				qna.setLvl(resultSet.getInt("lvl"));

				qnaList.add(qna);
			}

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			closeDBObjects(resultSet, preparedStatement, connection);
		}

		return qnaList;
	}

	@Override
	public void updateVisited(int qna_no) {

		Connection connection = null;
		PreparedStatement preparedStatement = null;

		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(QnaSQL.QNA_UPDATE_VISITED_SQL);

			preparedStatement.setInt(1, qna_no);

			preparedStatement.executeQuery();

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			closeDBObjects(null, preparedStatement, connection);
		}

	}

	@Override
	public Qna seleteByNo(int qna_no) {

		Qna qna = new Qna();
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;

		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(QnaSQL.QNA_SELETE_BY_QNA_NO_SQL);
			preparedStatement.setInt(1, qna_no);
			resultSet = preparedStatement.executeQuery();

			if (resultSet.next()) {

				qna.setQna_no(resultSet.getInt("qna_no"));
				qna.setMember_no(resultSet.getInt("member_no"));
				qna.setId(resultSet.getString("id"));
				qna.setQna_title(resultSet.getString("qna_title"));
				qna.setQna_con(resultSet.getString("qna_con"));
				qna.setQna_date(resultSet.getString("qna_date").split("\\s")[0]);
				qna.setVisited(resultSet.getInt("visited"));
				qna.setGrp(resultSet.getInt("grp"));
				qna.setLvl(resultSet.getInt("lvl"));
			}

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			closeDBObjects(resultSet, preparedStatement, connection);
		}
		return qna;
	}

	@Override
	public List<Qna> selectAllPage(int setRowStartNumber, int setRowEndNumber) {

		List<Qna> qnalist = new ArrayList<Qna>();

		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;

		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(QnaSQL.QNA_SELECT_ALL_PAGE_SQL);

			preparedStatement.setInt(1, setRowStartNumber);
			preparedStatement.setInt(2, setRowEndNumber);

			resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				Qna qna = new Qna();

				qna.setQna_no(resultSet.getInt("qna_no"));
				qna.setMember_no(resultSet.getInt("member_no"));
				qna.setId(resultSet.getString("id"));
				qna.setQna_title(resultSet.getString("qna_title"));
				qna.setQna_con(resultSet.getString("qna_con"));
				qna.setQna_date(resultSet.getString("qna_date").split("\\s")[0]);
				qna.setVisited(resultSet.getInt("visited"));
				qna.setGrp(resultSet.getInt("grp"));
				qna.setLvl(resultSet.getInt("lvl"));

				qnalist.add(qna);
			}

		} catch (SQLException e) {
			e.printStackTrace();

		} finally {

			closeDBObjects(resultSet, preparedStatement, connection);
		}
		return qnalist;

	}

	@Override
	public void update(Qna qna) {

		Connection connection = null;
		PreparedStatement preparedStatement = null;

		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(QnaSQL.QNA_UPDATE_SQL);

			preparedStatement.setString(1, qna.getQna_title());
			preparedStatement.setString(2, qna.getQna_con());
			preparedStatement.setInt(3, qna.getQna_no());

			preparedStatement.executeQuery();

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			closeDBObjects(null, preparedStatement, connection);
		}

	}

	@Override
	public void delete(int qna_no) {

		Connection connection = null;
		PreparedStatement preparedStatement = null;

		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(QnaSQL.QNA_DELETE_SQL);
			preparedStatement.setInt(1, qna_no);

			preparedStatement.executeQuery();

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {

			closeDBObjects(null, preparedStatement, connection);
		}

	}

}
