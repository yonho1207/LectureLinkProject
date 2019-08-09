package sql;

public class LectureSQL {

	public static final String LECTURE_SELECT_ALL = 
			" select LECTURE_NO, LECTURE_NAME, LECTURE_TEACHER, PRICE, TEXT_PRICE from lecture";
	
	public static final String LECTURE_SELECT_BY_NUM = 
			" select LECTURE_NO,lecture_name,lecture_teacher, price, text_price \r\n" + 
			" from lecture where lecture_no=?";
}
