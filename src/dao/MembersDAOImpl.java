package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import model.Members;
import sql.MembersSQL;

public class MembersDAOImpl extends BaseDAO implements MembersDAO {

	
	@Override
	public List<Members> selectAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean insert(Members members) {
		boolean result = false;
		Connection connection =null;
		PreparedStatement preparedStatement = null;
		
		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(MembersSQL.MEMBERS_INSERT_SQL);
			
			
			preparedStatement.setString(1,members.getId());
			preparedStatement.setString(2,members.getPassword());
			preparedStatement.setString(3,members.getLastname());
			preparedStatement.setString(4,members.getFirstname());
			preparedStatement.setString(5,members.getGender());
			preparedStatement.setString(6,members.getPhone());
			preparedStatement.setString(7,members.getBirth());
			preparedStatement.setString(8,members.getEmail());
			preparedStatement.setString(9,members.getQuestion());
			preparedStatement.setString(10,members.getAnswer());
			
			
			
			
			int rowCount = preparedStatement.executeUpdate();
			
			if(rowCount>0) {
				result = true;
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			
			closeDBObjects(null,preparedStatement,connection);
			
		}
		return result;
		
	}
	

	@Override
	public Members selectByid(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean update(Members members) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean delete(String id) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<Members> selectByName(String firstname, String lastname) {
		// TODO Auto-generated method stub
		return null;
	}
	
	public int idcheck(String id) {

		int cnt=0;

		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;

		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(MembersSQL.MEMBERS_ID_CHECK);
			preparedStatement.setString(1, id);
			resultSet = preparedStatement.executeQuery();

			if (resultSet.next()) {

				

				cnt = resultSet.getInt("cnt");
				

			}

		} catch (SQLException e) {
			e.printStackTrace();

		} finally {

			closeDBObjects(resultSet, preparedStatement, connection);
		}

		return cnt;

	}

}
