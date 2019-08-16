package sql;

public class LectureSQL {

	public static final String LECTURE_SELECT_ALL = 
			" select LECTURE_NO, LECTURE_NAME, LECTURE_TEACHER, PRICE, TEXT_PRICE \r\n"
			+ " from lecture order by LECTURE_NO";
	
	public static final String LECTURE_SELECT_BY_NUM = 
			" select LECTURE_NO,lecture_name,lecture_teacher, price, text_price \r\n" + 
			" from lecture where lecture_no=?";
	public static final String ATTENDING_LECTURE =
			"select PAYMENT_NO, lecture_no, member_no, id, lecture_name, payment_date\r\n" + 
			",price, pay_option, period\r\n" + 
			"from payment where member_no=? order by period desc";
	public static final String INSERT_LECTURE =
			"insert into lecture VALUES (seq_lecture_no.nextval, ?, ?, ?, ?)";
	public static final String UPDATE_LECTURE = 
			"update lecture set LECTURE_NAME=? , \r\n" + 
			"lecture_teacher = ?, PRICE =? ,TEXT_PRICE =? where LECTURE_NO=?";
	public static final String DELETE_LECTURE =
			"delete from lecture where lecture_no=?";
	public static final String ATTENDING_LECTURE_COUNT =
			"select count(*) from payment where member_no=?";
	public static final String SELECT_BY_ROWNUM =
			"select *\r\n" + 
			"from(select rownum as rn, lecture_sel.* \r\n" + 
			"    from (select * from lecture order by LECTURE_NO desc) lecture_sel)\r\n" + 
			"where rn between ? and ?  order by LECTURE_NO";
	
}
