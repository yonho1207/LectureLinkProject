package sql;

public class AdminSQL {

	public static final String ADMIN_UPDATE_SQL 
			= "update members Set password=?,lastname=?,firstname=?,"
				+ " phone=?, email=?, question=?, answer=? where id=?";
	
	public static final String ADMIN_SEARCH_BY_ID 
			= "select * from members where id like ?";
	
	public static final String GET_FEMALERATING =
			"select \r\n" + 
			"(select cast(count(*) as FLOAT) from (select * from members where gender='female'))/\r\n" + 
			"(select cast(count(*) as FLOAT) from (select * from members))*100 as ratio \r\n" + 
			"from dual";
	
	public static final String GET_MALERATING =
			"select \r\n" + 
			"(select cast(count(*) as FLOAT) from (select * from members where gender='male'))/\r\n" + 
			"(select cast(count(*) as FLOAT) from (select * from members))*100 as ratio \r\n" + 
			"from dual";
	
	public static final String GET_AGE_GROUP =
			"select  age ,count(*) as cnt \r\n" + 
			"from (select floor((to_char(sysdate, 'yyyy')-to_char(members.birth, 'yyyy')) / 10) \r\n" + 
			"* 10 as age from members) info\r\n" + 
			"group by age order by age";
}
