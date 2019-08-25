package daoImpl_Test;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.TreeMap;

import dao.AdminDAOImpl;
import dao.CmtDAO;
import dao.CmtDAOImpl;
import dao.LectureDAOImpl;
import dao.PaymentDAOImpl;
import dao.Time_Set_Helper;
import javafx.print.Collation;
import model.Payment;
import sun.text.resources.sk.CollationData_sk;

public class Test {

	public static void main(String[] args) {
		AdminDAOImpl adao = new AdminDAOImpl();
		adao.get_AgeGroup();
/*		TreeMap<Integer, Integer> tm = new TreeMap<>(adao.get_AgeGroup());
		Iterator<Integer> ik = tm.keySet().iterator();
		System.out.println(ik);
		while(ik.hasNext()) {
			Integer aged = ik.next();
			System.out.println(tm.get());
		}*/

	}

}
