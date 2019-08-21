package dao;

import java.sql.ResultSet;
import java.util.List;

import model.Cmt;


public interface CmtDAO {

	List<Cmt> selectAll(); //CMT 전체 조회
	
	Cmt insert(Cmt cmt); //CMT 추가
	
	List<Cmt> selectByLecture_no(int lecture_no); //CMT 강의별 선택  
	
	boolean deleteByCmt_no(int cmt_no); //CMT 삭제
	
	List<Cmt> selectByLecture_noPage(int setRowStartNumber, int setRowEndNumber,int lecture_no); //CMT 강의별 페이징 처리


}
