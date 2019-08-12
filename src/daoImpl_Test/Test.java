package daoImpl_Test;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import dao.PaymentDAOImpl;
import model.Payment;

public class Test {

	public static void main(String[] args) {
		PaymentDAOImpl pdao = new PaymentDAOImpl();
		Payment payment = new Payment();
		payment.setLecture_no(1);
		payment.setMember_no(1);
		payment.setId("temp");
		payment.setLecture_name("Python");
		payment.setPrice(75000);
		payment.setPay_option(2);
		
		pdao.select_PaymentList(1);	

		

	}

}
