package sql;

public class NoticeSQL {
	
	public static final String NOTICE_INSERT_SQL // 공지사항 게시판 글등록
	="INSERT INTO notice VALUES(seq_notice_no.nextval,?,?,sysdate)";
	
	public static final String NOTICE_SELETE_ALL_SQL // 공지사항 게시판 리스트
	="SELECT * from notice";
	
	public static final String NOTICE_SELETE_BY_NOTICE_NO_SQL  // 공지사항 게시판 검색
	="SELECT * FROM notice WHERE notice_no=?";
	
	public static final String NOTICE_UPDATE_SQL // 공지사항 게시판 업데이트
	="UPDATE notice SET notice_title = ? ,notice_con = ? WHERE notice_no = ?";
	
	public static final String NOTICE_DELETE_SQL // 공지사항 게시판 삭제
	="DELETE FROM notice WHERE notice_no=?";
}
