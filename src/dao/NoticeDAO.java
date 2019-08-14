package dao;

import java.util.List;

import model.Notice;
import model.Qna;

public interface NoticeDAO {

	Notice noticeInsert(Notice notice);//�������� ����
	
	List<Notice> selectAll();//��������  ����Ʈ
	
	Notice seleteByNo(int notice_no);//�˻�
	
	void update(Notice notice);//��������  ����
	
	void delete(int notice_no);//��������  ����
	
}
