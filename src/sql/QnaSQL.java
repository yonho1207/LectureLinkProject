package sql;

public class QnaSQL {
	
	public static final String QNA_INSERT_SQL //QNA �Խ��� �۵��
	="INSERT INTO QNA VALUES(seq_qna_no.nextval,?,?,?,?,sysdate,0,seq_qna_no,0)";
	
	public static final String QNA_SELETE_ALL_SQL//QNA �Խ��� ����Ʈ
	="SELECT * FROM qna";
	
	public static final String QNA_UPDATE_VISITED_SQL //QNA �Խ���  ��ȸ��
	="UPDATE QNA SET visited = visited+1 WHERE qna_no=?";

	public static final String QNA_SELETE_BY_QNA_NO_SQL
	="SELECT * FROM qna WHERE qna_no=?";
	
	public static final String QNA_SELECT_ALL_PAGE_SQL //QNA �Խ��� ����¡ó��
	="SELECT * FROM(SELECT ROWNUM as RN, qnas.* FROM (SELECT * from qna order by qna_no desc) qnas) "
	+ "WHERE rn BETWEEN ? AND ?";
}
