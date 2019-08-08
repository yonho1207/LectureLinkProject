package dao;

import java.util.List;

import model.Members;



public interface MembersDAO {
	
	List<Members> selectAll();
	boolean insert(Members members);
	Members selectByid(String id);
	boolean update(Members members);
	boolean delete(String id);
	List<Members> selectByName(String firstname, String lastname);
	int idcheck(String id);
}
