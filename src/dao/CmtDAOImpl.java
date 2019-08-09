package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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
			preparedStatement = connection.prepareStatement(CmtSQL.CMT_SELECTALL_SQL);
			resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {

				Cmt cmt = new Cmt();
				cmt.setNum(resultSet.getInt("num"));
				cmt.setWriter(resultSet.getString("writer"));
				cmt.setContent(resultSet.getString("content"));
				cmt.setDatetime(resultSet.getString("datetime"));

				cmtList.add(cmt);
			}

		} catch (SQLException e) {
			e.printStackTrace();

		} finally {

			closeDBObjects(resultSet, preparedStatement, connection);
		}
		return cmtList;
	}

}
