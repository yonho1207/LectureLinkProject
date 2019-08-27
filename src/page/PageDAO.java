package page;

public interface PageDAO {
	
	int getCount(String sql);
	int getCount(String sql, String searchName);
	int getCount(String sql, int searchNumber);
}
