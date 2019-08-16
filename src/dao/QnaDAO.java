package dao;

import java.util.List;

import model.Qna;


public interface QnaDAO {
	
	Qna QnaInsert(Qna qna);//새글
	
	Qna QnaComment(Qna qna);//답글
	
	List<Qna> selectAll();//리스트
	
	Qna seleteByNo(int qna_no);//검색
	
	List<Qna> seleteBylvl(int lvl); //질문게시판 이용자,관리자 글 나누기
	
	void update(Qna qna);//수정
	
	void delete(int qna_no);//삭제
	
	void updateVisited(int qna_no);//조회수
	
	List<Qna> selectAllPage(int setRowStartNumber, int setRowEndNumber);//페이징 처리
	
	
}
