package daoImpl_Test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Time;
import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.TreeMap;

import dao.AdminDAOImpl;
import dao.BaseDAO;
import dao.CmtDAO;
import dao.CmtDAOImpl;
import dao.LectureDAOImpl;
import dao.MembersDAOImpl;
import dao.PaymentDAOImpl;
import dao.Time_Set_Helper;
import javafx.print.Collation;
import model.AgeGroup;
import model.Members;
import model.Payment;
import sun.text.resources.sk.CollationData_sk;

public class Test {

	public static void main(String[] args) {
		AdminDAOImpl adao = new AdminDAOImpl();
		MembersDAOImpl mdao = new MembersDAOImpl();
		LectureDAOImpl ldao = new LectureDAOImpl();
		BaseDAO  bdao = new BaseDAO();
		PaymentDAOImpl pdao = new PaymentDAOImpl();
		List<AgeGroup> ageGroup = adao.get_AgeGroup();
		String a = "2019-12-12 12:50:03";
		String c = "2019-08-12 12:42:04";
		String b = a.replaceAll("[^0-9]", "");
		String d = c.replaceAll("[^0-9]", "");
		Long aa = Long.parseLong(b);
		Long cc = Long.parseLong(d);
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String day = "2019-12-01 13:43:22";
		ParsePosition pos = new ParsePosition(0);
		Date xa = transFormat.parse(day, pos);
		String xx = transFormat.format(xa);
		
		
		List<String> list1 = pdao.list_Period();
	/*		TreeMap<Integer, Integer> tm = new TreeMap<>(adao.get_AgeGroup());
		Iterator<Integer> ik = tm.keySet().iterator();
		System.out.println(ik);
		while(ik.hasNext()) {
			Integer aged = ik.next();
			System.out.println(tm.get());
		}*/
		int cnt =0;
		for(int i=0; i<34278; i++) {
			if(i%99==0) {
				cnt++;
			}
		}
		System.out.println(cnt);
	}

}
