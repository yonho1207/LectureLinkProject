package dao;

import java.util.List;

import model.Cmt;


public interface CmtDAO {

	Cmt QnaInsert(Cmt cmt);//새글
	Cmt QnaComment(Cmt cmt);//답글
	
	List<Cmt> selectAll();//리스트
	Cmt seleteByNo(int no);//검색
	
	void update(Cmt cmt);//수정
	void delete(int cmt_no);//삭제
	
	void updateVisited(int cmt_no);//조회수
	
	List<Cmt> selectAllPage(int rowStartNumber, int rowEndNumber);//페이징 처리
}
