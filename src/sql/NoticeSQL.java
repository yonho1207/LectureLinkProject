package sql;

public class NoticeSQL {
	
	public static final String NOTICE_INSERT_SQL // �������� �Խ��� �۵��
	="INSERT INTO notice VALUES(seq_notice_no.nextval,?,?,sysdate)";
	
	public static final String QNA_SELETE_ALL_SQL // �������� �Խ��� ����Ʈ
	="SELECT * from notice";

}
