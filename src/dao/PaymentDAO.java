package dao;

import java.util.List;

import model.Payment;

public interface PaymentDAO {

	boolean insert_Payment(List<Payment> purchase_Basket);
	boolean update_Payment(Payment payment);
	boolean delete_Payment(int payment_no);
	List<Payment> attending_Lecture(int member_no);
	List<Payment> attended_Lecture(int member_no);
	
	List<Payment> select_PaymentList(int member_no);
}
