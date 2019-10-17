package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.List;

import model.Payment;

public interface PaymentDAO {

	boolean insert_Payment(List<Payment> purchase_Basket);
	boolean update_Payment(Payment payment);
	boolean delete_Payment(int payment_no);
	List<Payment> attending_Lecture(int member_no);
	List<Payment> attended_Lecture(int members_No);
	String select_Attending_Lecture(int member_no, int lecture_no);
	List<Payment> select_PaymentList(int member_no);
	List<String> list_Period();
	void insert_Payment(List<Payment> purchase_Basket, Connection connection, PreparedStatement preparedStatement);
	void insert_Payment(Payment purchase_Basket, Connection connection, PreparedStatement preparedStatement);
	
	
}
