package dao;

import java.util.List;

import model.Notice;

public interface NoticeDAO {

	Notice noticeInsert(Notice notice);//공지사항 새글
	
	List<Notice> selectAll();//공지사항  리스트
	
	void update(Notice notice);//공지사항  수정
	
	void delete(int notice_no);//공지사항  삭제
	
}
