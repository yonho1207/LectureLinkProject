package dao;

import java.util.List;

import model.Notice;

public interface NoticeDAO {

	Notice noticeInsert(Notice notice);//�������� ����
	
	List<Notice> selectAll();//��������  ����Ʈ
	
	void update(Notice notice);//��������  ����
	
	void delete(int notice_no);//��������  ����
	
}
