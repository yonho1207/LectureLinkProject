package sql;

public class NoticeSQL {
	
	public static final String NOTICE_INSERT_SQL // �������� �Խ��� �۵��
	="INSERT INTO notice VALUES(seq_notice_no.nextval,?,?,sysdate)";
	
	public static final String NOTICE_SELETE_ALL_SQL // �������� �Խ��� ����Ʈ
	="SELECT * from notice";
	
	public static final String NOTICE_SELETE_BY_NOTICE_NO_SQL  // �������� �Խ��� �˻�
	="SELECT * FROM notice WHERE notice_no=?";
	
	public static final String NOTICE_UPDATE_SQL // �������� �Խ��� ������Ʈ
	="UPDATE notice SET notice_title = ? ,notice_con = ? WHERE notice_no = ?";
	
	public static final String NOTICE_DELETE_SQL // �������� �Խ��� ����
	="DELETE FROM notice WHERE notice_no=?";
}
