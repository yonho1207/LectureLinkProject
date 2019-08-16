package sql;

public class QnaSQL {

	public static final String QNA_INSERT_SQL // QNA 추가
			= "INSERT INTO QNA VALUES(seq_qna_no.nextval,?,?,?,?,sysdate,0,seq_qna_no.currval,0)";
	
	public static final String QNA_SELETE_BY_lvl_SQL // QNA 이용자 글,관리자 답글 나누기
	="SELECT * FROM qna WHERE lvl=?";
	
	public static final String QNA_CMT_INSERT_SQL //QNA 관리자 답글
	="INSERT INTO qna VALUES(seq_qna_no.nextval,?,?,?,?,sysdate,0,?,1)";

	public static final String QNA_SELETE_ALL_SQL// QNA 리스트
			= "SELECT * FROM qna order by qna_no desc";

	public static final String QNA_UPDATE_VISITED_SQL // QNA 조회수
			= "UPDATE QNA SET visited = visited+1 WHERE qna_no=?";

	public static final String QNA_SELETE_BY_QNA_NO_SQL  //QNA 게시판 넘버 선택
			= "SELECT * FROM qna WHERE qna_no=?";

	public static final String QNA_SELECT_LVL_PAGE_SQL // QNA 페이징처리
			= "SELECT * FROM(SELECT ROWNUM as RN, qnas.* FROM (SELECT * FROM(SELECT * from qna where qna.lvl=0) "
					+ "qna ORDER BY qna_no DESC) qnas) "
					+ "WHERE rn BETWEEN ? AND ?";

	public static final String QNA_UPDATE_SQL // QNA 수정
			= "UPDATE qna SET QNA_TITLE = ?,QNA_CON = ? where QNA_NO = ?";

	public static final String QNA_DELETE_SQL // QNA 삭제
			= "DELETE FROM qna WHERE QNA_NO=?";

}
