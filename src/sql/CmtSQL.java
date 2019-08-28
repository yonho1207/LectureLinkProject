package sql;

public class CmtSQL {

	public static final String CMT_SELCTE_ALL_SQL // CMT 게시판 조회
			= "SELECT * FROM cmt  ";

	public static final String CMT_INSERT_SQL // CMT 게시판 댓글 입력
			= "INSERT INTO cmt VALUES(seq_cmt_no.nextval,?,?,?,?,?,sysdate)";

	public static final String CMT_SELECT_BY_LECTURE_NO_SQL // CMT 게시판 no 조회
			= "SELECT * FROM cmt WHERE lecture_no = ? ORDER BY cmt_no DESC";

	public static final String CMT_SELECT_SEQCURRVAL_SQL // CMT 게시판 시퀀스 조회
			= "SELECT seq_cmt_no.currval AS num FROM dual";

	public static final String CMT_DELETE_BY_CMT_NO_SQL // CMT 게시판 댓글 삭제
			= "DELETE FROM cmt WHERE cmt_no = ?";

	public static final String CMT_SELECT_LECTURE_NO_PAGE_SQL 
			= "SELECT * FROM(SELECT ROWNUM as RN, cmts.* "
			+ "FROM (SELECT * FROM(SELECT * from cmt where cmt.lecture_no=?) cmt ORDER BY cmt_no DESC) cmts)"
			+ "WHERE rn BETWEEN ? AND ? ORDER BY cmt_no DESC";
	
	public static final String CMT_AVG_RATING_SQL //CMT 강의별 평균 별점
			="SELECT avg(rating) as avg FROM cmt WHERE lecture_no=?";
	

}
