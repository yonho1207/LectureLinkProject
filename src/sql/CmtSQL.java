package sql;

public class CmtSQL {

	public static final String CMT_SELCTE_ALL_SQL // CMT 게시판 조회
			= "SELECT * FROM cmt ORDER BY cmt_no ASC ";

	public static final String CMT_INSERT_SQL // CMT 게시판 댓글 입력
			= "INSERT INTO cmt VALUES(seq_cmt_no.nextval,?,?,?,?,?,sysdate)";

	public static final String CMT_SELECT_BY_LECTURE_NO_SQL // CMT 게시판 no 조회
			= "SELECT * FROM cmt WHERE lecture_no = ?";

	public static final String CMT_SELECT_SEQCURRVAL_SQL // CMT 게시판 시퀀스 조회
			= "SELECT seq_cmt_no.currval AS num FROM dual";

	public static final String CMT_DELETE_BY_CMT_NO_SQL // CMT 게시판 댓글 삭제
			= "DELTE FROM cmt WHERE num = ?";

	public static final String CMT_SELECT_LECTURE_NO_PAGE_SQL 
			= "SELECT * FROM(SELECT ROWNUM as RN, cmts.* "
			+ "FROM (SELECT * FROM(SELECT * from cmt where cmt.lecture_no=?) cmt ORDER BY cmt_no DESC) cmts)"
			+ "WHERE rn BETWEEN ? AND ?";

}
