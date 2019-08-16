package dao;

import java.util.List;

import model.Qna;


public interface QnaDAO {
	
	Qna QnaInsert(Qna qna);//����
	
	Qna QnaComment(Qna qna);//���
	
	List<Qna> selectAll();//����Ʈ
	
	Qna seleteByNo(int qna_no);//�˻�
	
	List<Qna> seleteBylvl(int lvl); //�����Խ��� �̿���,������ �� ������
	
	void update(Qna qna);//����
	
	void delete(int qna_no);//����
	
	void updateVisited(int qna_no);//��ȸ��
	
	List<Qna> selectAllPage(int setRowStartNumber, int setRowEndNumber);//����¡ ó��
	
	
}
