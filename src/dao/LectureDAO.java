package dao;

import java.util.List;

import model.AgeGroup;
import model.Lecture;

public interface LectureDAO {

	List<Lecture> select_All_Lecture();
	List<Lecture> select_Lecture_Name(String lecture_name);
	Lecture select_Lecture_No(int lecture_no);
	List<Lecture> select_Lecture_Teacher(String lecture_teacher);
	List<Lecture> lecture_List_Get_RowNum(int rowStartNumber, int rowEndNumber);
	List<Lecture> Selected_Lecture_List_For_Paging_By_LectureName(String searchName , int rowStartNumber, int rowEndNumber);
	List<Lecture> select_Lecture_By_Name(String lecture_Name);
	int get_Attending_Count(int lecture_No);
	List<AgeGroup> get_Attending_AgeGroup(int lecture_No);
	boolean insert_Lecture(Lecture lecture);
	boolean update_Lecture(Lecture lecture);
	boolean delete_Lecture(int lecture_no);
}
