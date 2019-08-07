package model;

public class Cmt {
	
	private int cmt_no;
	private int member_no;
	private String id;
	private String cmt_title;
	private String cmt_con;
	private int rating;
	private String cmt_date;
	
	public int getCmt_no() {
		return cmt_no;
	}
	public void setCmt_no(int cmt_no) {
		this.cmt_no = cmt_no;
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
	public String getCmt_title() {
		return cmt_title;
	}
	public void setCmt_title(String cmt_title) {
		this.cmt_title = cmt_title;
	}
	public String getCmt_con() {
		return cmt_con;
	}
	public void setCmt_con(String cmt_con) {
		this.cmt_con = cmt_con;
	}
	public int getRating() {
		return rating;
	}
	public void setRating(int rating) {
		this.rating = rating;
	}
	public String getCmt_date() {
		return cmt_date;
	}
	public void setCmt_date(String cmt_date) {
		this.cmt_date = cmt_date;
	}
	@Override
	public String toString() {
		return "Cmt [cmt_no=" + cmt_no + ", member_no=" + member_no + ", id=" + id + ", cmt_title=" + cmt_title
				+ ", cmt_con=" + cmt_con + ", rating=" + rating + ", cmt_date=" + cmt_date + "]";
	}
	
	
}
