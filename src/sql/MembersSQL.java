package sql;

public class MembersSQL {

	public static final String MEMBERS_INSERT_SQL = "insert into members values"
			+ "(seq_member_no.nextval,?,?,?,?,?,?,?,?,?,?)";
	public static final String MEMBERS_ID_CHECK = "select count(*) as cnt from members where id = ?";
	public static final String MEMBERS_SELECT_BY_ID = "select * from members where id =?";

}
