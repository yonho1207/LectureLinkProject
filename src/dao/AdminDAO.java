package dao;

import java.util.List;

import model.Members;

public interface AdminDAO {
	void update(Members members);
	List<Members> searchById(String id);
}
