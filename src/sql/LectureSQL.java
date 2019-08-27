package sql;

public class LectureSQL {

	public static final String LECTURE_SELECT_ALL = 
			" select LECTURE_NO, LECTURE_NAME, LECTURE_TEACHER, PRICE, BOOK_PRICE, LECTURE_URL,description,lecture_Url \r\n"
			+ " from lecture order by LECTURE_NO";
	
	public static final String LECTURE_SELECT_BY_NUM = 
			" select LECTURE_NO,lecture_name,lecture_teacher, price, BOOK_price, LECTURE_URL,description, lecture_Url \r\n" + 
			" from lecture where lecture_no=?";
	public static final String ATTENDING_LECTURE =
			"select PAYMENT_NO, lecture_no, member_no, id, lecture_name, payment_date\r\n" + 
			",price, pay_option, period\r\n" + 
			"from payment where member_no=? order by period desc";
	public static final String INSERT_LECTURE =
			"insert into lecture VALUES (seq_lecture_no.nextval, ?, ?, ?, ?, ?,?)";
	public static final String UPDATE_LECTURE = 
			"update lecture set LECTURE_NAME=? , \r\n" + 
			"lecture_teacher = ?, PRICE =? ,BOOK_PRICE =? where LECTURE_NO=?,lecture_Url=? ,description=?";
	public static final String DELETE_LECTURE =
			"delete from lecture where lecture_no=?";
	public static final String ATTENDING_LECTURE_COUNT =
			"select count(*) from payment where member_no=?";
	public static final String SELECT_BY_ROWNUM =
			"select *\r\n" + 
			"from(select rownum as rn, lecture_sel.* \r\n" + 
			"    from (select * from lecture order by LECTURE_NO desc) lecture_sel)\r\n" + 
			"where rn between ? and ?  order by LECTURE_NO";
	public static final String SELECT_BY_LECTURE_NAME = 
			"select  LECTURE_NO,lecture_name,lecture_teacher, price, BOOK_price, description, lecture_Url from \r\n" + 
			"lecture where upper(lecture_name) like upper(?)";
	public static final String SELECT_BY_LECTURE_TEACHER = 
			"select  LECTURE_NO,lecture_name,lecture_teacher, price, BOOK_price, description, lecture_Url from \r\n" + 
			"lecture where lecture_teacher like ?";
	public static final String SELECT_BY_ROWNUM_IN_SERACH_BY_LECTURE =
			"select *\r\n" + 
			"from(select rownum as rn, lecture_sel.* \r\n" + 
			"    from (select * from lecture where LECTURE_NAME like ? order by LECTURE_NO desc) lecture_sel)\r\n" + 
			"where rn between ? and ?  order by LECTURE_NO";
	
	public static final String GET_LECTURE_ATTEND_COUNT =
			"select lecture_no, count(*) as cnt from payment where lecture_no = ? group by lecture_no";
	
	public static final String GET_ATTENDMEMBER_AGEGROUP =
			"select  age ,count(*) as cnt \r\n" + 
			"from (select floor((to_char(sysdate, 'yyyy')-to_char(members.birth, 'yyyy')) / 10) \r\n" + 
			"* 10 as age from members natural join payment p where p.lecture_no=?)\r\n" + 
			"group by age order by age";
}
