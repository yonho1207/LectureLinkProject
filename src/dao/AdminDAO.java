package dao;

import java.util.HashMap;
import java.util.List;

import model.Members;

public interface AdminDAO {
	void update(Members members);
	List<Members> searchById(String id);
	List<Double> get_GenderRating();
	List<Integer> get_AgeGroup();
}
