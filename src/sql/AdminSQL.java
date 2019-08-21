package sql;

public class AdminSQL {

	public static final String ADMIN_UPDATE_SQL 
			= "update members Set password=?,lastname=?,firstname=?,"
				+ " phone=?, email=?, question=?, answer=? where id=?";
	
	public static final String ADMIN_SEARCH_BY_ID 
			= "select * from members where id like ?";
	
	
	
}
