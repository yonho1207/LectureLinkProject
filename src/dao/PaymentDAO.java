package dao;

import java.util.List;

import model.Payment;

public interface PaymentDAO {

	boolean insert_Payment(Payment payment);
	boolean update_Payment(Payment payment);
	boolean delete_Payment(int payment_no);
	boolean Multiple_Insert_Payment(Payment payment);
	
	List<Payment> select_PaymentList(int member_no);
}
