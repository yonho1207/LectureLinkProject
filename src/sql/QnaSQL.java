package sql;

public class QnaSQL {

	public static final String QNA_INSERT_SQL // QNA �߰�
			= "INSERT INTO QNA VALUES(seq_qna_no.nextval,?,?,?,?,sysdate,0,seq_qna_no.currval,0)";
	
	public static final String QNA_SELETE_BY_lvl_SQL // QNA �̿��� ��,������ ��� ������
	="SELECT * FROM qna WHERE lvl=?";
	
	public static final String QNA_CMT_INSERT_SQL //QNA ������ ���
	="INSERT INTO qna VALUES(seq_qna_no.nextval,?,?,?,?,sysdate,0,?,1)";

	public static final String QNA_SELETE_ALL_SQL// QNA ����Ʈ
			= "SELECT * FROM qna order by qna_no desc";

	public static final String QNA_UPDATE_VISITED_SQL // QNA ��ȸ��
			= "UPDATE QNA SET visited = visited+1 WHERE qna_no=?";

	public static final String QNA_SELETE_BY_QNA_NO_SQL  //QNA �Խ��� �ѹ� ����
			= "SELECT * FROM qna WHERE qna_no=?";

	public static final String QNA_SELECT_LVL_PAGE_SQL // QNA ����¡ó��
			= "SELECT * FROM(SELECT ROWNUM as RN, qnas.* FROM (SELECT * FROM(SELECT * from qna where qna.lvl=0) "
					+ "qna ORDER BY qna_no DESC) qnas) "
					+ "WHERE rn BETWEEN ? AND ?";

	public static final String QNA_UPDATE_SQL // QNA ����
			= "UPDATE qna SET QNA_TITLE = ?,QNA_CON = ? where QNA_NO = ?";

	public static final String QNA_DELETE_SQL // QNA ����
			= "DELETE FROM qna WHERE QNA_NO=?";

}
