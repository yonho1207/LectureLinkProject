package model;

public class Qna {
	
	private int qna_no; 
	private int member_no;
	private String id;
	private String qna_title;
	private String qna_con;
	private String qna_date;
	private int visited;
	private int grp; 
	private int lvl;
	
	public int getQna_no() {
		return qna_no;
	}
	public void setQna_no(int qna_no) {
		this.qna_no = qna_no;
	}
	public int getMember_no() {
		return member_no;
	}
	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getQna_title() {
		return qna_title;
	}
	public void setQna_title(String qna_title) {
		this.qna_title = qna_title;
	}
	public String getQna_con() {
		return qna_con;
	}
	public void setQna_con(String qna_con) {
		this.qna_con = qna_con;
	}
	public String getQna_date() {
		return qna_date;
	}
	public void setQna_date(String qna_date) {
		this.qna_date = qna_date;
	}
	public int getVisited() {
		return visited;
	}
	public void setVisited(int visited) {
		this.visited = visited;
	}
	public int getGrp() {
		return grp;
	}
	public void setGrp(int grp) {
		this.grp = grp;
	}
	public int getLvl() {
		return lvl;
	}
	public void setLvl(int lvl) {
		this.lvl = lvl;
	}
	
	@Override
	public String toString() {
		return "Qna [qna_no=" + qna_no + ", member_no=" + member_no + ", id=" + id + ", qna_title=" + qna_title
				+ ", qna_con=" + qna_con + ", qna_date=" + qna_date + ", visited=" + visited + ", grp=" + grp + ", lvl="
				+ lvl + "]";
	} 
	
	
}
