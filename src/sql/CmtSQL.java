package sql;

public class CmtSQL {
	
	public static final String CMT_SELCTE_ALL_SQL //CMT �Խ��� ��ȸ
	="SELECT * FROM cmt";
	
	public static final String CMT_INSERT_SQL //CMT �Խ��� ��� �Է�
	= "INSERT INTO cmt VALUES(seq_cmt_no.nextval,?,?,?,0,sysdate)";
	
	public static final String CMT_SELECT_BY_CMT_NO_SQL //CMT �Խ��� no ��ȸ
	= "SELECT * FROM cmt WHERE cmt_no =?";
	
	public static final String CMT_SELECT_SEQCURRVAL_SQL //CMT �Խ��� ������ ��ȸ  
	= "SELETE seq_cmt_no.currval AS num FROM dual";
	
	public static final String CMT_DELETE_BY_CMT_NO_SQL //CMT �Խ��� ��� ����
	="DELTE FROM cmt WHERE num = ?";
}
