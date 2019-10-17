package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Members;
import sql.AdminSQL;
import sql.MembersSQL;

public class MembersDAOImpl extends BaseDAO implements MembersDAO {

	@Override
	public List<Members> selectAll() {
		List<Members> memberList = new ArrayList<Members>();
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		

		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(MembersSQL.MEMBERS_SELECT_ALL);
			resultSet = preparedStatement.executeQuery();
			
			while (resultSet.next()) {

				Members members = new Members();
				members.setMember_no(resultSet.getInt("member_no"));
				members.setId(resultSet.getString("id"));
				members.setPassword(resultSet.getString("password"));
				members.setLastname(resultSet.getString("lastname"));
				members.setFirstname(resultSet.getString("firstname"));
				members.setGender(resultSet.getString("gender"));
				members.setPhone(resultSet.getString("phone"));
				members.setBirth(resultSet.getString("birth").split("\\s")[0]);
				members.setEmail(resultSet.getString("email"));
				members.setQuestion(resultSet.getString("question"));
				members.setAnswer(resultSet.getString("answer"));

				memberList.add(members);
			}
		} catch (SQLException e) {
			e.printStackTrace();

		} finally {

			closeDBObjects(resultSet, preparedStatement, connection);
		}
		
		
		
		
		return memberList;
		
	}
	
	

	@Override
	public boolean insert(Members members) {
		boolean result = false;
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(MembersSQL.MEMBERS_INSERT_SQL);

			preparedStatement.setString(1, members.getId());
			preparedStatement.setString(2, members.getPassword());
			preparedStatement.setString(3, members.getLastname());
			preparedStatement.setString(4, members.getFirstname());
			preparedStatement.setString(5, members.getGender());
			preparedStatement.setString(6, members.getPhone());
			preparedStatement.setString(7, members.getBirth().split("\\s")[0]);
			preparedStatement.setString(8, members.getEmail());
			preparedStatement.setString(9, members.getQuestion());
			preparedStatement.setString(10, members.getAnswer());

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

	public void update(Members members) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(MembersSQL.MEMBERS_UPDATE_SQL);
			
			preparedStatement.setString(1,members.getPassword());			
			preparedStatement.setInt(2,members.getMember_no());
			
			
			preparedStatement.executeUpdate();
			
		
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			
			closeDBObjects(null,preparedStatement,connection);
			
		}
	}@Override
	public boolean delete(String id) {
		boolean result = false;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(MembersSQL.MEMBERS_DELETE_SQL);
			preparedStatement.setString(1,id);
			
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
	public List<Members> selectByName(String firstname, String lastname) {
		// TODO Auto-generated method stub
		return null;
	}

	public int idcheck(String id) {

		int cnt = 0;

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

	public Members selectById(String id) {

		Members members = null;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;

		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(MembersSQL.MEMBERS_SELECT_BY_ID);
			preparedStatement.setString(1, id);
			resultSet = preparedStatement.executeQuery();

			if (resultSet.next()) {

				members = new Members();

				members.setMember_no(resultSet.getInt("member_no"));
				members.setId(resultSet.getString("id"));
				members.setPassword(resultSet.getString("password"));
				members.setLastname(resultSet.getString("lastname"));
				members.setFirstname(resultSet.getString("firstname"));
				members.setGender(resultSet.getString("gender"));
				members.setPhone(resultSet.getString("phone"));
				members.setBirth(resultSet.getString("birth").split("\\s")[0]);
				members.setEmail(resultSet.getString("email"));
				members.setQuestion(resultSet.getString("question"));
				members.setAnswer(resultSet.getString("answer"));

			}

		} catch (SQLException e) {
			e.printStackTrace();

		} finally {

			closeDBObjects(resultSet, preparedStatement, connection);
		}

		return members;

	}
	public void updateAll(Members members) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
				
		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(MembersSQL.MEMBERS_PROFILE_UPDATE);
			
				
			preparedStatement.setString(1,members.getLastname());
			preparedStatement.setString(2,members.getFirstname());
			preparedStatement.setString(3,members.getGender());
			preparedStatement.setString(4,members.getPhone());
			preparedStatement.setString(5,members.getBirth().split("\\s")[0]);
			preparedStatement.setString(6,members.getEmail());
			preparedStatement.setString(7,members.getQuestion());
			preparedStatement.setString(8,members.getAnswer());
			preparedStatement.setString(9,members.getId());
			
			
			preparedStatement.executeUpdate();
			
		
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			
			closeDBObjects(null,preparedStatement,connection);
			
		}
	}
	
	public void insertMember(Members member,Connection connection, PreparedStatement preparedStatement) {
		


		try {
			
			preparedStatement = connection.prepareStatement(MembersSQL.MEMBERS_INSERT_SQL);

			preparedStatement.setString(1, member.getId());
			preparedStatement.setString(2, member.getPassword());
			preparedStatement.setString(3, member.getLastname());
			preparedStatement.setString(4, member.getFirstname());
			preparedStatement.setString(5, member.getGender());
			preparedStatement.setString(6, member.getPhone());
			preparedStatement.setString(7, member.getBirth());
			preparedStatement.setString(8, member.getEmail());
			preparedStatement.setString(9, member.getQuestion());
			preparedStatement.setString(10, member.getAnswer());
			preparedStatement.execute();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {

			closeDBObjects(null, preparedStatement, null);

		}

	}



	@Override
	public Members selectByMemNo(int member_No,Connection connection, 
			PreparedStatement preparedStatement,ResultSet resultSet) {
		Members members = null;
		
		try {
			preparedStatement = connection.prepareStatement(sql.MembersSQL.SELECET_MEMBERNO);
			preparedStatement.setInt(1, member_No);
			resultSet = preparedStatement.executeQuery();
			
			if(resultSet.next()) {
				members = new Members();
				members.setMember_no(resultSet.getInt("member_no"));
				members.setId(resultSet.getString("id"));
				members.setPassword(resultSet.getString("password"));
				members.setLastname(resultSet.getString("lastname"));
				members.setFirstname(resultSet.getString("firstname"));
				members.setGender(resultSet.getString("gender"));
				members.setPhone(resultSet.getString("phone"));
				members.setBirth(resultSet.getString("birth").split("\\s")[0]);
				members.setEmail(resultSet.getString("email"));
				members.setQuestion(resultSet.getString("question"));
				members.setAnswer(resultSet.getString("answer"));
			}
			
		}catch(SQLException ex01) {
			ex01.printStackTrace();
		}
		return members;
	}

	
}
