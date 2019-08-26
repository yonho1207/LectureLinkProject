package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Lecture;
import model.Payment;

public class LectureDAOImpl extends BaseDAO implements LectureDAO {
 
	@Override
	public List<Lecture> select_All_Lecture() {
		List<Lecture> lecture_List = new ArrayList<Lecture>();
		Connection connection = null;  
		PreparedStatement preparedStatement =null;
		ResultSet resultSet = null;
		
		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(sql.LectureSQL.LECTURE_SELECT_ALL);
			resultSet = preparedStatement.executeQuery();
			
			while(resultSet.next()) {
				Lecture lecture = new Lecture();
				lecture.setLecture_no(resultSet.getInt("lecture_no"));
				lecture.setLecture_name(resultSet.getString("lecture_name"));
				lecture.setLecture_teacher(resultSet.getString("lecture_teacher"));
				lecture.setPrice(resultSet.getInt("price"));
				lecture.setText_price(resultSet.getInt("text_price"));
				lecture.setLecture_Url(resultSet.getString("lecture_Url"));
				lecture.setDescription(resultSet.getString("description"));
				lecture_List.add(lecture);
				
			}
			
/*			for(Lecture list : lecture_List) {
				System.out.println(list);
			}*/
		}catch(SQLException ex01) {
			ex01.printStackTrace();
		}finally {
			closeDBObjects(resultSet, preparedStatement, connection);
		}
		
		
		return lecture_List;
	}

	@Override
	public List<Lecture> select_Lecture_Name(String lecture_name) {
		List<Lecture> lecture_List = new ArrayList<Lecture>();
		Connection connection = null;  
		PreparedStatement preparedStatement =null;
		ResultSet resultSet = null;
		
		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(sql.LectureSQL.SELECT_BY_LECTURE_NAME);
			preparedStatement.setString(1, "%"+lecture_name+"%");
			resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				Lecture lecture = new Lecture();
				lecture.setLecture_no(resultSet.getInt("lecture_no"));
				lecture.setLecture_name(resultSet.getString("lecture_name"));
				lecture.setLecture_teacher(resultSet.getString("lecture_teacher"));
				lecture.setPrice(resultSet.getInt("price"));
				lecture.setText_price(resultSet.getInt("text_price"));
				lecture.setLecture_Url(resultSet.getString("lecture_Url"));
				lecture.setDescription(resultSet.getString("description"));
				lecture_List.add(lecture);				
			}
			
		}catch(SQLException ex01) {
			ex01.printStackTrace();
		}finally {
			closeDBObjects(resultSet, preparedStatement, connection);
		}
		return lecture_List;
	}

	@Override
	public List<Lecture> select_Lecture_Teacher(String lecture_teacher) {
		List<Lecture> lecture_List = new ArrayList<Lecture>();
		Connection connection = null;  
		PreparedStatement preparedStatement =null;
		ResultSet resultSet = null;
		
		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(sql.LectureSQL.SELECT_BY_LECTURE_TEACHER);
			preparedStatement.setString(1, "%"+lecture_teacher+"%");
			resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				Lecture lecture = new Lecture();
				lecture.setLecture_no(resultSet.getInt("lecture_no"));
				lecture.setLecture_name(resultSet.getString("lecture_name"));
				lecture.setLecture_teacher(resultSet.getString("lecture_teacher"));
				lecture.setPrice(resultSet.getInt("price"));
				lecture.setText_price(resultSet.getInt("text_price"));
				lecture.setLecture_Url(resultSet.getString("lecture_Url"));
				lecture.setDescription(resultSet.getString("description"));
				lecture_List.add(lecture);				
			}
			
		}catch(SQLException ex01) {
			ex01.printStackTrace();
		}finally {
			closeDBObjects(resultSet, preparedStatement, connection);
		}
		return lecture_List;
	}

	@Override
	public boolean insert_Lecture(Lecture lecture) {
		boolean result = false;
		Connection connection = null;
		PreparedStatement preparedStatement =null;
		
		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(sql.LectureSQL.INSERT_LECTURE);
			preparedStatement.setString(1, lecture.getLecture_name());
			preparedStatement.setString(2, lecture.getLecture_teacher());
			preparedStatement.setInt(3, lecture.getPrice());
			preparedStatement.setInt(4, lecture.getText_price());
			preparedStatement.setString(5, lecture.getLecture_Url());
			preparedStatement.setString(6, lecture.getDescription());
			int lowCount = preparedStatement.executeUpdate();
			
			if(lowCount>0) {
				result = true;
			}
			
		}catch(SQLException ex01) {
			ex01.printStackTrace();
		}finally {
			closeDBObjects(null, preparedStatement, connection);
		}
		return result;
	}

	@Override
	public boolean update_Lecture(Lecture lecture) {
		boolean result = false;
		Connection connection = null;
		PreparedStatement preparedStatement =null;
		
		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(sql.LectureSQL.UPDATE_LECTURE);
			preparedStatement.setString(1, lecture.getLecture_name());
			preparedStatement.setString(2, lecture.getLecture_teacher());
			preparedStatement.setInt(3, lecture.getPrice());
			preparedStatement.setInt(4, lecture.getText_price());
			preparedStatement.setInt(5, lecture.getLecture_no());
			preparedStatement.setString(6, lecture.getLecture_Url());
			preparedStatement.setString(7, lecture.getDescription());
			int lowCount = preparedStatement.executeUpdate();
			
			if(lowCount>0) {
				result = true;
			}
			
		}catch(SQLException ex01) {
			ex01.printStackTrace();
		}finally {
			closeDBObjects(null, preparedStatement, connection);
		}
		return result;
	}

	@Override
	public boolean delete_Lecture(int lecture_no) {
		Connection connection = null; 
		PreparedStatement preparedStatement =null;
		boolean Result = false;
		
		try {
			connection = getConnection();
			preparedStatement = connection.prepareCall(sql.LectureSQL.DELETE_LECTURE);
			preparedStatement.setInt(1, lecture_no);
			int rowCount = preparedStatement.executeUpdate();
			
			if(rowCount > 0) {
				Result = true;
			}
			
		}catch(SQLException ex01) {
			ex01.printStackTrace();
		}finally {
			closeDBObjects(null, preparedStatement, connection);
			
		}
		
		return Result;
	}

	@Override
	public Lecture select_Lecture_No(int lecture_no) {
		
		Lecture lecture = null;
		Connection connection = null; 
		PreparedStatement preparedStatement =null;
		ResultSet resultSet = null;
		
		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(sql.LectureSQL.LECTURE_SELECT_BY_NUM);
			preparedStatement.setInt(1, lecture_no);
			resultSet = preparedStatement.executeQuery();
			
			if(resultSet.next()) {
				lecture = new Lecture();
				lecture.setLecture_no(resultSet.getInt("lecture_no"));
				lecture.setLecture_name(resultSet.getString("lecture_name"));
				lecture.setLecture_teacher(resultSet.getString("lecture_teacher"));
				lecture.setPrice(resultSet.getInt("price"));
				lecture.setText_price(resultSet.getInt("text_price"));
				lecture.setLecture_Url(resultSet.getString("lecture_Url"));
				lecture.setDescription(resultSet.getString("description"));
			}
		}catch(SQLException ex01) {
			ex01.printStackTrace();
		}finally {
			closeDBObjects(resultSet, preparedStatement, connection);
		}
		
		return lecture;
	}

	@Override
	public List<Lecture> lecture_List_Get_RowNum(int rowStartNumber, int rowEndNumber) {
		List<Lecture> lecture_List = new ArrayList<Lecture>();
		Connection connection = null;
		PreparedStatement preparedStatement =null;
		ResultSet resultSet = null;
		
		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(sql.LectureSQL.SELECT_BY_ROWNUM);
			preparedStatement.setInt(1, rowStartNumber);
			preparedStatement.setInt(2, rowEndNumber);
			resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				Lecture lecture = new Lecture();
				lecture.setLecture_no(resultSet.getInt("lecture_no"));
				lecture.setLecture_name(resultSet.getString("lecture_name"));
				lecture.setLecture_teacher(resultSet.getString("lecture_teacher"));
				lecture.setPrice(resultSet.getInt("price"));
				lecture.setText_price(resultSet.getInt("text_price"));
				lecture.setLecture_Url(resultSet.getString("lecture_Url"));
				lecture.setDescription(resultSet.getString("description"));
				lecture_List.add(lecture);
			}
		}catch(SQLException ex01) {
			ex01.printStackTrace();
		}finally {
			closeDBObjects(resultSet, preparedStatement, connection);		
		}
		return lecture_List;
	}
	
	


	
}
