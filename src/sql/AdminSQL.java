package sql;

public class AdminSQL {

	public static final String ADMIN_UPDATE_SQL 
			= "update members Set password=?,lastname=?,firstname=?,"
				+ " phone=?, email=?, question=?, answer=? where id=?";
	
	public static final String ADMIN_SEARCH_BY_ID 
			= "select * from members where upper(id) like upper(?)";
	
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
	
	public static final String GET_COUNT_PAYOPTION = 
			"select count(*) as cnt from payment group by pay_option";
	
	public static final String GET_AVG_PAYOPTION =
			"select round(avg(price)) as avg from payment group by pay_option";
	
	public static final String GET_PAY_MONTH = 
			"select \r\n" + 
			"round((to_date(?, 'yyyy-mm-dd hh24:mi:ss')- \r\n" + 
			"to_date(?,'yyyy-mm-dd hh24:mi:ss'))/30) as month\r\n" + 
			"from dual";
	
	public static final String GET_MEMBERS_COUNT =
			"select count(*) from members";
	
	public static final String GET_AVG_PERIOD =
			"select round(sum(round((to_date(period, 'yyyy-mm-dd hh24:mi:ss') \r\n" + 
			"- to_date(sysdate,'yyyy-mm-dd hh24:mi:ss'))/30)) / count(*), 2) as avg\r\n" + 
			"from payment";

}
