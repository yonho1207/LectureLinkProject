package page;

public class PageSQL {
	
	public static final String QNA_SELETE_ALL_COUNT="select count(*) as cnt from qna where lvl=0";
	
	public static final String NOTICE_SELETE_ALL_COUNT="select count(*) as cnt from notice";
	
	public static final String CMT_SELECTE_ALL_COUNT="select count(*) as cnt from cmt";
	
	public static final String  LECTURE_SELECTE_ALL_COUNT=
			"select count(*)as cnt from lecture";
	public static final String LECTURE_SELECT_BY_NAME=
			"select count(*)as cnt from lecture where lecture_name like ?";
}
