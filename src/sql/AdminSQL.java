package sql;

public class AdminSQL {

	public static final String ADMIN_UPDATE_SQL = "update members Set password=?,lastname=?"
			+ " ,firstname=?, phone=?, email=?, question=?, answer=? where id=?";
}
