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
			"from payment where member_no=?";
	public static final String ATTENDED_LECTURE =  
			"    select PAYMENT_NO, lecture_no, member_no,\r\n" + 
			"    id, lecture_name, payment_date\r\n" + 
			"    ,price, pay_option, period from payment \r\n" + 
			"    where to_date(?, 'yyyy/mm/dd') not between \r\n" + 
			"    to_date(?, 'yyyy/mm/dd')\r\n" + 
			"    and to_date(?, 'yyyy/mm/dd')";
	public static final String INSERT_LECTURE =
			"insert into lecture VALUES (seq_lecture_no.nextval, ?, ?, ?, ?)";
	public static final String UPDATE_LECTURE = 
			"update lecture set LECTURE_NAME=? , \r\n" + 
			"lecture_teacher = ?, PRICE =? ,TEXT_PRICE =? where LECTURE_NO=?";
	
}
