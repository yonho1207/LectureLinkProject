package model;

public class Payment {


    int payment_no;
    int lecture_no;
    int member_no;
    String id;
    String payment_date;
    String lecture_name;
    int price;
    int pay_option;
    String period;
    
    public int getPayment_no() {
        return payment_no;
    }
    public void setPayment_no(int payment_no) {
        this.payment_no = payment_no;
    }
    public int getLecture_no() {
        return lecture_no;
    }
    public void setLecture_no(int lecture_no) {
        this.lecture_no = lecture_no;
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
    public String getPayment_date() {
        return payment_date;
    }
    public void setPayment_date(String payment_date) {
        this.payment_date = payment_date;
    }
    public String getLecture_name() {
        return lecture_name;
    }
    public void setLecture_name(String lecture_name) {
        this.lecture_name = lecture_name;
    }
    public int getPrice() {
        return price;
    }
    public void setPrice(int price) {
        this.price = price;
    }
    public int getPay_option() {
        return pay_option;
    }
    public void setPay_option(int pay_option) {
        this.pay_option = pay_option;
    }
    public String getPeriod() {
        return period;
    }
    public void setPeriod(String period) {
        this.period = period;
    }
    @Override
    public String toString() {
        return "Payment [payment_no=" + payment_no + ", lecture_no=" + lecture_no + ", member_no=" + member_no + ", id="
                + id + ", payment_date=" + payment_date + ", lecture_name=" + lecture_name + ", price=" + price
                + ", pay_option=" + pay_option + ", period=" + period + "]";
    }
    
    
    
}
