package always.awake.studyplus.block.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

public class test {
	public static void main(String[] args) {
		
		SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss");
		long test = 3700 * 1000;
		try {
			Date date1 = sdf.parse("11:00:00");
			Calendar cal1 = new GregorianCalendar();
			cal1.set(Calendar.HOUR_OF_DAY, 11);
			cal1.set(Calendar.MINUTE, 0);
			cal1.set(Calendar.SECOND,0);
			cal1.set(Calendar.MILLISECOND, 0);
			Calendar cal2 = new GregorianCalendar();
			System.out.println(Math.ceil(1.1));
			System.out.println(((cal2.getTimeInMillis()-cal1.getTimeInMillis()
					)/1000)/60);
			
		/*	if(check < test) {
				System.out.println(test-check);
				double test2 = Math.ceil(((test-check)/1000.0)/3600.0);
				System.out.println(test2);
			}*/
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
