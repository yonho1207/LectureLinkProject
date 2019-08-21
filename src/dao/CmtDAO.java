package dao;

import java.sql.ResultSet;
import java.util.List;

import model.Cmt;


public interface CmtDAO {

	List<Cmt> selectAll(); //CMT ��ü ��ȸ
	
	Cmt insert(Cmt cmt); //CMT �߰�
	
	List<Cmt> selectByLecture_no(int lecture_no); //CMT ���Ǻ� ����  
	
	boolean deleteByCmt_no(int cmt_no); //CMT ����
	
	List<Cmt> selectByLecture_noPage(int setRowStartNumber, int setRowEndNumber,int lecture_no); //CMT ���Ǻ� ����¡ ó��


}
