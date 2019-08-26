package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import model.AgeGroup;
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
	
	public List<Members> searchById(String id) {
		
		List<Members> memberList = new ArrayList<Members>();
		Members members = null;
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(AdminSQL.ADMIN_SEARCH_BY_ID);
			preparedStatement.setString(1, "%" + id + "%");
			resultSet = preparedStatement.executeQuery();
			
			while(resultSet.next()) {
				
				members=new Members();
				
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
			
			
		}catch (SQLException e) {
			e.printStackTrace();

		} finally {

			closeDBObjects(resultSet, preparedStatement, connection);
		}
		
		
		
		
		return memberList;
		
		
	}

	@Override
	public List<Double> get_GenderRating() {
		List<Double> genderRating = new ArrayList();
		Double female_Raiting =0.0;
		Double male_RAiting = 0.0;
		ResultSet resultSet = null;
		Connection connection = null;
		PreparedStatement preparedStatement = null; 
		
		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(sql.AdminSQL.GET_FEMALERATING);
			resultSet = preparedStatement.executeQuery();
			
			if(resultSet.next()) {
				female_Raiting = resultSet.getDouble("ratio");			
			}
			
			preparedStatement = connection.prepareStatement(sql.AdminSQL.GET_MALERATING);
			resultSet = preparedStatement.executeQuery();
			if(resultSet.next()) {
				male_RAiting = resultSet.getDouble("ratio");	
			}
			
			
		}catch(SQLException ex01) {
			ex01.printStackTrace();
		}finally {
			closeDBObjects(resultSet, preparedStatement, connection);
		}
		genderRating.add(female_Raiting);
		genderRating.add(male_RAiting);
		return genderRating;
	}

	@Override
	public List<AgeGroup> get_AgeGroup() {
		ResultSet resultSet = null;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		List<AgeGroup> ageGroup = new ArrayList<AgeGroup>();
		
		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(sql.AdminSQL.GET_AGE_GROUP);
			resultSet = preparedStatement.executeQuery();

			while(resultSet.next()) {
				AgeGroup getAge = new AgeGroup();
				getAge.setAgeGroup(resultSet.getInt("age"));
				getAge.setAgeGroupCount(resultSet.getInt("cnt"));
				ageGroup.add(getAge);
				}		
			
		}catch(SQLException ex01) {
			ex01.printStackTrace();
		}finally {
			closeDBObjects(resultSet,preparedStatement, connection);
		}
		return ageGroup;
	}
	
	
}
	


