package dao;

import java.util.List;

import model.Lecture;

public interface LectureDAO {

	List<Lecture> select_All_Lecture();
	List<Lecture> select_Lecture_Name(String lecture_name);
	Lecture select_Lecture_No(int lecture_no);
	Lecture select_Lecture_Teacher(String lecture_teacher);
	List<Lecture> lecture_List_Get_RowNum(int rowStartNumber, int rowEndNumber);
	
	boolean insert_Lecture(Lecture lecture);
	boolean update_Lecture(Lecture lecture);
	boolean delete_Lecture(int lecture_no);
}
