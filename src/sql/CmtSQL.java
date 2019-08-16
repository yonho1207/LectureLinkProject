package sql;

public class CmtSQL {

	public static final String CMT_SELCTE_ALL_SQL // CMT �Խ��� ��ȸ
			= "SELECT * FROM cmt ORDER BY cmt_no ASC ";

	public static final String CMT_INSERT_SQL // CMT �Խ��� ��� �Է�
			= "INSERT INTO cmt VALUES(seq_cmt_no.nextval,?,?,?,?,?,sysdate)";

	public static final String CMT_SELECT_BY_LECTURE_NO_SQL // CMT �Խ��� no ��ȸ
			= "SELECT * FROM cmt WHERE lecture_no = ?";

	public static final String CMT_SELECT_SEQCURRVAL_SQL // CMT �Խ��� ������ ��ȸ
			= "SELECT seq_cmt_no.currval AS num FROM dual";

	public static final String CMT_DELETE_BY_CMT_NO_SQL // CMT �Խ��� ��� ����
			= "DELTE FROM cmt WHERE num = ?";

	public static final String CMT_SELECT_LECTURE_NO_PAGE_SQL 
			= "SELECT * FROM(SELECT ROWNUM as RN, cmts.* "
			+ "FROM (SELECT * FROM(SELECT * from cmt where cmt.lecture_no=?) cmt ORDER BY cmt_no DESC) cmts)"
			+ "WHERE rn BETWEEN ? AND ?";

}
