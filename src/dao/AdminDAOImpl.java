package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import model.Members;
import sql.AdminSQL;


public class AdminDAOImpl extends BaseDAO implements AdminDAO {

	@Override
	public void update(Members members) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
				
		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(AdminSQL.ADMIN_UPDATE_SQL);
			
			preparedStatement.setString(1,members.getPassword());	
			preparedStatement.setString(2,members.getLastname());
			preparedStatement.setString(3,members.getFirstname());
			preparedStatement.setString(4,members.getPhone());
			preparedStatement.setString(5,members.getEmail());
			preparedStatement.setString(6,members.getQuestion());
			preparedStatement.setString(7,members.getAnswer());
			preparedStatement.setString(8,members.getId());
			
			
			preparedStatement.executeUpdate();
			
		
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			
			closeDBObjects(null,preparedStatement,connection);
			
		}
	}
	}


