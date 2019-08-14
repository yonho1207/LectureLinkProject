package sql;

public class NoticeSQL {
	
	public static final String NOTICE_INSERT_SQL // 공지사항 게시판 글등록
	="INSERT INTO notice VALUES(seq_notice_no.nextval,?,?,sysdate)";
	
	public static final String QNA_SELETE_ALL_SQL // 공지사항 게시판 리스트
	="SELECT * from notice";

}
