package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import model.Lecture;
import model.Payment;

public class PaymentDAOImpl extends BaseDAO implements PaymentDAO {

	@Override
	public boolean insert_Payment(List<Payment> purchase_Basket) {
		boolean result = false; 
		Connection connection = null;
		PreparedStatement preparedStatement = null; 
		
		
		try {
			connection = getConnection();
			connection.setAutoCommit(false);
			for(Payment payment : purchase_Basket) {
/*				if(payment.getLecture_no()==3) {
					payment.setPay_option(7);
				} */ //고의적 에러 발생으로 인한 트렌젝션 처리 정상 작동 여부 판별용 코드
				preparedStatement = connection.prepareStatement(sql.PaymentSQL.INSERT_PAYMENT_INFO);
				preparedStatement.setInt(1,payment.getLecture_no());
				preparedStatement.setInt(2,payment.getMember_no());
				preparedStatement.setString(3, payment.getId());
				preparedStatement.setString(4, payment.getPayment_date());
				preparedStatement.setString(5, payment.getLecture_name());
				preparedStatement.setInt(6, payment.getPrice());
				preparedStatement.setInt(7, payment.getPay_option());
				preparedStatement.setString(8, payment.getPeriod());
				preparedStatement.setInt(9, payment.getBuy_Book());
				int rowCount = preparedStatement.executeUpdate();
				if(rowCount>0) {
					
					result=true;
				}
				
			}
			
		
		}catch(SQLException ex01) {
			ex01.printStackTrace();
			if(connection!=null) {
				try {
					connection.rollback();			
		
				}catch(SQLException ex02) {
					ex02.printStackTrace();
				}
			}

		}finally {
			try {
					connection.commit();
					connection.setAutoCommit(true);
				}catch(SQLException ex03) {
					ex03.printStackTrace();
				}
			
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

	@Override
	public List<Payment> attending_Lecture(int member_no) {
		List<Payment> paymentList = new ArrayList<Payment>();
		Connection connection = null; 
		PreparedStatement preparedStatement =null;
		ResultSet resultSet = null;
		
		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(sql.LectureSQL.ATTENDING_LECTURE);
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
		}catch(SQLException ex01) {
			ex01.printStackTrace();
		}finally {
			closeDBObjects(resultSet, preparedStatement, connection);
		}
		return paymentList;
	}

	@Override
	public List<Payment> attended_Lecture(int members_No) {
		List<Payment> paymentList = new ArrayList<Payment>();
		List<Payment> selected_Period_List = new ArrayList<Payment>();
		Payment payment = null;
		Connection connection = null; 
		PreparedStatement preparedStatement =null;
		ResultSet resultSet = null;
		
		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(sql.PaymentSQL.SELECT_MY_PAYMENT);
			preparedStatement.setInt(1, members_No);
			resultSet = preparedStatement.executeQuery();
			
			
			
			while(resultSet.next()) {
				payment = new Payment();
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
			
			for(Payment comparison_List : paymentList) {
				SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
				String get_Period = comparison_List.getPeriod();
				String get_Today = Time_Set_Helper.get_Today();
				Date get_Period_To_Date = transFormat.parse(get_Period);
				Date get_Today_To_Date = transFormat.parse(get_Today);
				
				if(get_Period_To_Date.before(get_Today_To_Date)) {
					selected_Period_List.add(comparison_List);
				}
			}
		}catch(SQLException ex01) {
			ex01.printStackTrace();
		} catch (ParseException ex02) {
			// TODO Auto-generated catch block
			ex02.printStackTrace();
		}finally {
			closeDBObjects(resultSet, preparedStatement, connection);
		}
		System.out.println(selected_Period_List);
		return selected_Period_List;
	}

	@Override
	public String select_Attending_Lecture(int member_no, int lecture_no) {
		String period = null; 
		Connection connection = null;
		PreparedStatement preparedStatement =null;
		ResultSet resultSet = null;
		
		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(sql.LectureSQL.SELECTED_ATTENDING_LECTURE);
			preparedStatement.setInt(1, member_no);
			preparedStatement.setInt(2, lecture_no);
			resultSet = preparedStatement.executeQuery();
			
			if(resultSet.next()) {
				period = resultSet.getString("period");
			}
			
		}catch(SQLException ex01) {
			ex01.printStackTrace();
		}finally {
			closeDBObjects(resultSet, preparedStatement, connection);
		}
		return period;
	}

	@Override
	public List<String> list_Period() {
		List<String> periodList = new ArrayList<String>();
		Connection connection = null;
		PreparedStatement preparedStatement =null;
		ResultSet resultSet = null;
		
		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(sql.PaymentSQL.GET_PERIOD);
			resultSet = preparedStatement.executeQuery();
			
			while(resultSet.next()) {
				String get_period = resultSet.getString("period");
				periodList.add(get_period);
			}
			
		}catch(SQLException ex01) {
			ex01.printStackTrace();
		}finally {
			closeDBObjects(resultSet, preparedStatement, connection);
		}
		
		return periodList;
	}
	
	
	public void insert_Payment(List<Payment> purchase_Basket, Connection connection, PreparedStatement preparedStatement) {

		
		
		try {
			for(Payment payment : purchase_Basket) {
/*				if(payment.getLecture_no()==3) {
					payment.setPay_option(7);
				} */ //고의적 에러 발생으로 인한 트렌젝션 처리 정상 작동 여부 판별용 코드
				preparedStatement = connection.prepareStatement(sql.PaymentSQL.INSERT_PAYMENT_INFO);
				preparedStatement.setInt(1,payment.getLecture_no());
				preparedStatement.setInt(2,payment.getMember_no());
				preparedStatement.setString(3, payment.getId());
				preparedStatement.setString(4, payment.getPayment_date());
				preparedStatement.setString(5, payment.getLecture_name());
				preparedStatement.setInt(6, payment.getPrice());
				preparedStatement.setInt(7, payment.getPay_option());
				preparedStatement.setString(8, payment.getPeriod());
				preparedStatement.setInt(9, payment.getBuy_Book());
				preparedStatement.execute();
				
			}
			
		
		}catch(SQLException ex01) {
			ex01.printStackTrace();
			}

		}

	@Override
	public void insert_Payment(Payment payment, Connection connection, PreparedStatement preparedStatement) {

		
		
		try {
				preparedStatement = connection.prepareStatement(sql.PaymentSQL.INSERT_PAYMENT_INFO);
				preparedStatement.setInt(1,payment.getLecture_no());
				preparedStatement.setInt(2,payment.getMember_no());
				preparedStatement.setString(3, payment.getId());
				preparedStatement.setString(4, payment.getPayment_date());
				preparedStatement.setString(5, payment.getLecture_name());
				preparedStatement.setInt(6, payment.getPrice());
				preparedStatement.setInt(7, payment.getPay_option());
				preparedStatement.setString(8, payment.getPeriod());
				preparedStatement.setInt(9, payment.getBuy_Book());
				preparedStatement.execute();
		}catch(SQLException ex01) {
			ex01.printStackTrace();
		}finally {
	
		}				
	}
	
		
		
	}

