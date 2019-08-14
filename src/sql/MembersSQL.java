package sql;

public class MembersSQL {

	public static final String MEMBERS_INSERT_SQL = "insert into members values"
			+ "(seq_member_no.nextval,?,?,?,?,?,?,to_date(? ,'yyyy-MM-dd'),?,?,?)";
	public static final String MEMBERS_ID_CHECK = "select count(*) as cnt from members where id = ?";
	public static final String MEMBERS_SELECT_BY_ID = "select * from members where id =?";
	public static final String MEMBERS_UPDATE_SQL = "update members Set password=? where member_no=?";
	public static final String MEMBERS_SELECT_ALL = "select * from members order by member_no";

}
