package sql;

public class QnaSQL {

	public static final String QNA_INSERT_SQL // QNA ï¿½Ô½ï¿½ï¿½ï¿½ ï¿½Ûµï¿½ï¿½
			= "INSERT INTO QNA VALUES(seq_qna_no.nextval,?,?,?,?,sysdate,0,seq_qna_no.currval,0)";

	public static final String QNA_SELETE_ALL_SQL// QNA ï¿½Ô½ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½Æ®
			= "SELECT * FROM qna order by qna_no desc";

	public static final String QNA_UPDATE_VISITED_SQL // QNA ï¿½Ô½ï¿½ï¿½ï¿½ ï¿½ï¿½È¸ï¿½ï¿½
			= "UPDATE QNA SET visited = visited+1 WHERE qna_no=?";

	public static final String QNA_SELETE_BY_QNA_NO_SQL  //QNA °Ô½ÃÆÇ ³Ñ¹ö ¼±ÅÃ
	= "SELECT * FROM qna WHERE qna_no=?";

	public static final String QNA_SELECT_ALL_PAGE_SQL // QNA ï¿½Ô½ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½Â¡Ã³ï¿½ï¿½
			= "SELECT * FROM(SELECT ROWNUM as RN, qnas.* FROM (SELECT * from qna order by qna_no desc) qnas) "
					+ "WHERE rn BETWEEN ? AND ?";

	public static final String QNA_UPDATE_SQL // QNA ï¿½ó¼¼ºï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Æ®
			= "UPDATE qna SET QNA_TITLE = ?,QNA_CON = ? where QNA_NO = ?";

	public static final String QNA_DELETE_SQL // QNA ï¿½ó¼¼ºï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½
			= "DELETE FROM qna WHERE QNA_NO=?";
}
