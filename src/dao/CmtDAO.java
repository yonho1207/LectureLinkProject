package dao;

import java.util.List;

import model.Cmt;


public interface CmtDAO {

	List<Cmt> selectAll();
	//Cmt insert(Cmt comments);
	//Cmt selectByNum(int num);
	//void deleteByNum(int num);
}
