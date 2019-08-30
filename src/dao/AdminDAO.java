package dao;

import java.util.HashMap;
import java.util.List;

import model.AgeGroup;
import model.Members;
import model.Payment;

public interface AdminDAO {
	void update(Members members);
	List<Members> searchById(String id);
	List<Double> get_GenderRating();
	List<AgeGroup> get_AgeGroup();
	List<Integer> get_Payoption_CNT();
	List<Integer> get_Payoption_AVG();
	int get_Paymented_Month(Payment payment);
	double get_AVG_period();
	
}
