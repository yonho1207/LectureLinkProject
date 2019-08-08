package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import model.Payment;

public class PaymentDAOImpl extends BaseDAO implements PaymentDAO {

	@Override
	public boolean insert_Payment(Payment payment) {
		boolean result = false;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		Calendar cal = Calendar.getInstance();
		cal.setTime(new Date());
		Date get_payment_Day = cal.getTime();
		String payment_Day= transFormat.format(get_payment_Day);
		cal.add(Calendar.MONTH, 1);
		Date get_After_1month = cal.getTime();
		String one_Month_Later= transFormat.format(get_After_1month);
		
		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(sql.PaymentSQL.INSERT_PAYMENT_INFO);
			preparedStatement.setInt(1, payment.getLecture_no());
			preparedStatement.setInt(2, payment.getMember_no());
			preparedStatement.setString(3, payment.getId());
			preparedStatement.setString(4, payment_Day);
			preparedStatement.setString(5, payment.getLecture_name());
			preparedStatement.setInt(6, payment.getPrice());
			preparedStatement.setInt(7, payment.getPay_option());
			preparedStatement.setString(8, one_Month_Later);
			int rowCount = preparedStatement.executeUpdate();
			
			if(rowCount>0) {
				result=true;
			}
			
			
		}catch(SQLException ex01) {
			ex01.printStackTrace();
		}finally {
			closeDBObjects(null, preparedStatement, connection);
		}
		return result;
	}

	@Override
	public boolean update_Payment(Payment payment) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean delete_Payment(int payment_no) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<Payment> select_PaymentList(int member_no) {
		List<Payment> paymentList = new ArrayList<Payment>();
		Connection connection = null;
		ResultSet resultSet = null;
		PreparedStatement preparedStatement = null;
		
		try {
			
			connection = getConnection();
			preparedStatement = connection.prepareStatement(sql.PaymentSQL.SELECT_MY_PAYMENT);
			preparedStatement.setInt(1, member_no);
			resultSet = preparedStatement.executeQuery();
			
			while(resultSet.next()) {
				Payment payment = new Payment();
				payment.setPayment_no(resultSet.getInt("payment_no"));
				payment.setLecture_no(resultSet.getInt("lecture_no"));
				payment.setMember_no(resultSet.getInt("member_no"));
				payment.setId(resultSet.getString("id")); 
				payment.setPayment_date(resultSet.getString("payment_date"));
				payment.setLecture_name(resultSet.getString("lecture_name"));
				payment.setPrice(resultSet.getInt("price"));
				payment.setPay_option(resultSet.getInt("pay_option"));
				payment.setPeriod(resultSet.getString("period"));				
				paymentList.add(payment); 
			}
			
			for(Payment list : paymentList) {
				System.out.println(list);
			}
			
		}catch(SQLException ex01) {
			ex01.printStackTrace();
		}finally {
			closeDBObjects(resultSet, preparedStatement, connection);
		}
		
		return paymentList;
	}

}
