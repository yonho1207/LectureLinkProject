package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Lecture;

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
				lecture_List.add(lecture);
				
			}
			
			for(Lecture list : lecture_List) {
				System.out.println(list);
			}
		}catch(SQLException ex01) {
			ex01.printStackTrace();
		}finally {
			closeDBObjects(resultSet, preparedStatement, connection);
		}
		
		
		return lecture_List;
	}

	@Override
	public List<Lecture> select_Lecture_Name(String lecture_name) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Lecture select_Lecture_Teacher(String lecture_teacher) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean insert_Lecture(Lecture lecture) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean update_Lecture(Lecture lecture) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean delete_Lecture(int lecture_no) {
		// TODO Auto-generated method stub
		return false;
	}

}
