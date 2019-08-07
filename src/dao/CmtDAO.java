package dao;

import java.util.List;

import model.Cmt;


public interface CmtDAO {

	Cmt QnaInsert(Cmt cmt);//����
	Cmt QnaComment(Cmt cmt);//���
	
	List<Cmt> selectAll();//����Ʈ
	Cmt seleteByNo(int no);//�˻�
	
	void update(Cmt cmt);//����
	void delete(int cmt_no);//����
	
	void updateVisited(int cmt_no);//��ȸ��
	
	List<Cmt> selectAllPage(int rowStartNumber, int rowEndNumber);//����¡ ó��
}
