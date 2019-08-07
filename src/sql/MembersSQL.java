package sql;

public class MembersSQL {

	public static final String MEMBERS_INSERT_SQL = "insert into members values"
			+ "(seq_member_no.nextval,?,?,?,?,?,?,?,?,?,?)";
}
