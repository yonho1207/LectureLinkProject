package dao;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class Time_Set_Helper {
	
	public static String get_Today() {
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		Calendar cal = Calendar.getInstance();
		cal.setTime(new Date());
		Date get_payment_Day = cal.getTime();
		String payment_Day= transFormat.format(get_payment_Day);
		return payment_Day;
	}

	public static String get_OneMonth_Later() {
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		Calendar cal = Calendar.getInstance();
		cal.setTime(new Date()); 
		cal.add(Calendar.MONTH, 1);
		Date get_After_1month = cal.getTime();
		String one_Month_Later= transFormat.format(get_After_1month);
		return one_Month_Later;
	}

	public static String get_period_date(int select_Price) {
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		Calendar cal = Calendar.getInstance();
		cal.setTime(new Date()); 
		cal.add(Calendar.MONTH, select_Price);
		Date get_After_1month = cal.getTime();
		String selected_Period= transFormat.format(get_After_1month);
		return selected_Period;
		
	}



}
