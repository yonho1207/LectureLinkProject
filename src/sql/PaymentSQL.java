package sql;

public class PaymentSQL {

	public static final String INSERT_PAYMENT_INFO =
			"insert into payment VALUES (SEQ_PAYMENT_NO.nextval, ?, ?, ?,\r\n" + 
			" to_date(? ,'yyyy/mm/dd HH24:mi'), ?, ?, ?, \r\n" + 
			" to_date(? ,'yyyy/mm/dd HH24:mi'))";
	
	public static final String SELECT_MY_PAYMENT = 
			"  select payment_no,LECTURE_NO,MEMBER_NO, id,\r\n" + 
			"  payment_date, lecture_name,price,PAY_OPTION, period\r\n" + 
			" from payment where member_no=?";
	
	public static final String UPDATE_PAYMENT_INFO =
			" update  payment set  LECTURE_NO=?,MEMBER_NO=?, ID=?,\r\n" + 
			" PAYMENT_DATE=to_date(? ,'yyyy/mm/dd HH24:mi'), LECTURE_NAME=?, \r\n" + 
			" PRICE=?, PAY_OPTION=?, PERIOD=to_date(? ,'yyyy/mm/dd HH24:mi') \r\n" + 
			" where PAYMENT_NO=?";
	public static final String DELETE_PAYMENT_INFO =
			" delete from payment where PAYMENT_NO = ?";
}
