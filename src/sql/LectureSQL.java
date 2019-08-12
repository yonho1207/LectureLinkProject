package sql;

public class LectureSQL {

	public static final String LECTURE_SELECT_ALL = 
			" select LECTURE_NO, LECTURE_NAME, LECTURE_TEACHER, PRICE, TEXT_PRICE from lecture";
	
	public static final String LECTURE_SELECT_BY_NUM = 
			" select LECTURE_NO,lecture_name,lecture_teacher, price, text_price \r\n" + 
			" from lecture where lecture_no=?";
	public static final String ATTENDING_LECTURE =
			"select PAYMENT_NO, lecture_no, member_no, id, lecture_name, payment_date\r\n" + 
			",price, pay_option, period\r\n" + 
			"from payment where member_no=?";
	public static final String ATTENDED_LECTURE = 
			"select * from payment where "
			+ " to_date(?, 'yyyy/mm/dd HH24:mi') < to_date(?, 'yyyy/mm/dd HH24:mi')";
}
