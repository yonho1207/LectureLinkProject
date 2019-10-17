package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;

import model.Members;



public interface MembersDAO {
	
	List<Members> selectAll();
	boolean insert(Members members);
	Members selectById(String id);
	void update(Members members);
	boolean delete(String id);
	List<Members> selectByName(String firstname, String lastname);
	Members selectByMemNo(int member_No, Connection connection,
			PreparedStatement preparedStatement, ResultSet resultSet);
	int idcheck(String id);
	void updateAll(Members members);
	void insertMember(Members member,Connection connection, PreparedStatement preparedStatement);
}
