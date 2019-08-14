package dao;

import java.util.List;

import model.Cmt;


public interface CmtDAO {

	List<Cmt> selectAll();
	Cmt insert(Cmt cmt);
	List<Cmt> selectByLecture_no(int lecture_no);
	boolean deleteByCmt_no(int cmt_no);
}
