package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Notice;
import model.Qna;
import sql.NoticeSQL;
import sql.QnaSQL;

public class NoticeDAOImpl extends BaseDAO implements NoticeDAO {

	@Override
	public Notice noticeInsert(Notice notice) {

		Connection connection = null;
		PreparedStatement preparedStatement = null;

		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(NoticeSQL.NOTICE_INSERT_SQL);

			preparedStatement.setString(1, notice.getNotice_title());
			preparedStatement.setString(2, notice.getNotice_con());

			preparedStatement.executeQuery();

		} catch (SQLException e) {

			e.printStackTrace();

		} finally {
			closeDBObjects(null, preparedStatement, connection);
		}
		return notice;

	}

	@Override
	public List<Notice> selectAll() {

		List<Notice> noticeList = new ArrayList<Notice>();

		Connection connection = null;
		ResultSet resultSet = null;
		PreparedStatement preparedStatement = null;

		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(NoticeSQL.NOTICE_SELETE_ALL_SQL);
			resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {

				Notice notice = new Notice();

				notice.setNotice_no(resultSet.getInt("notice_no"));
				notice.setNotice_title(resultSet.getString("notice_title"));
				notice.setNotice_con(resultSet.getString("notice_con"));
				notice.setNotice_date(resultSet.getString("notice_date").split("\\s")[0]);

				noticeList.add(notice);
			}

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			closeDBObjects(resultSet, preparedStatement, connection);
		}

		return noticeList;
	}

	@Override
	public void update(Notice notice) {

		Connection connection = null;
		PreparedStatement preparedStatement = null;

		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(NoticeSQL.NOTICE_UPDATE_SQL);

			preparedStatement.setString(1, notice.getNotice_title());
			preparedStatement.setString(2, notice.getNotice_con());
			preparedStatement.setInt(3, notice.getNotice_no());

			preparedStatement.executeQuery();

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			closeDBObjects(null, preparedStatement, connection);
		}

	}

	@Override
	public void delete(int notice_no) {

		Connection connection = null;
		PreparedStatement preparedStatement = null;

		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(NoticeSQL.NOTICE_DELETE_SQL);
			preparedStatement.setInt(1, notice_no);

			preparedStatement.executeQuery();

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {

			closeDBObjects(null, preparedStatement, connection);
		}

	}

	@Override
	public Notice seleteByNo(int notice_no) {

		Notice notice = new Notice();
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;

		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(NoticeSQL.NOTICE_SELETE_BY_NOTICE_NO_SQL);
			preparedStatement.setInt(1, notice_no);
			resultSet = preparedStatement.executeQuery();

			if (resultSet.next()) {
				
				notice.setNotice_no(resultSet.getInt("notice_no"));
				notice.setNotice_title(resultSet.getString("notice_title"));
				notice.setNotice_con(resultSet.getString("notice_con"));
				notice.setNotice_date(resultSet.getString("notice_date").split("\\s")[0]);
				
			}

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			closeDBObjects(resultSet, preparedStatement, connection);
		}
		return notice;
	
	}

	@Override
	public List<Notice> selectAllPage(int setRowStartNumber, int setRowEndNumber) {

		List<Notice> noticelist = new ArrayList<Notice>();

		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;

		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(NoticeSQL.NOTICE_SELECT_ALL_PAGE_SQL);

			preparedStatement.setInt(1, setRowStartNumber);
			preparedStatement.setInt(2, setRowEndNumber);

			resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				Notice notice = new Notice();
				
				notice.setNotice_no(resultSet.getInt("notice_no"));
				notice.setNotice_title(resultSet.getString("notice_title"));
				notice.setNotice_con(resultSet.getString("notice_con"));
				notice.setNotice_date(resultSet.getString("notice_date").split("\\s")[0]);

				noticelist.add(notice);
			}

		} catch (SQLException e) {
			e.printStackTrace();

		} finally {

			closeDBObjects(resultSet, preparedStatement, connection);
		}
		return noticelist;

	
	}

}
