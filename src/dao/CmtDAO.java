package dao;

import java.util.List;

import model.Cmt;


public interface CmtDAO {

	List<Cmt> selectAll();
	Cmt insert(Cmt cmt);
	Cmt selectByCmt_no(int cmt_no);
	boolean deleteByCmt_no(int cmt_no);
}
