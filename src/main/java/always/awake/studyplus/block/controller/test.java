package always.awake.studyplus.block.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

public class test {
	public static void main(String[] args) throws ParseException {
		
		SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss");
		long test = 3700 * 1000;
		Calendar cal1 = new GregorianCalendar();
		cal1.set(Calendar.HOUR_OF_DAY, 24);
/*		cal1.set(Calendar.MINUTE, 59);
		cal1.set(Calendar.SECOND,59);*/
/*		cal1.set(Calendar.MILLISECOND, 0);*/
		Calendar cal2 = new GregorianCalendar();
		cal2.set(Calendar.HOUR_OF_DAY,23);
		System.out.println(cal1.getTime());
		System.out.println(((cal1.getTimeInMillis()-cal2.getTimeInMillis()
				)/1000));
		Calendar a = new GregorianCalendar();
		a.add(Calendar.DATE, -0);
		System.out.println(new SimpleDateFormat("yyyy-MM-dd").format(a.getTimeInMillis()));
/*	if(check < test) {
			System.out.println(test-check);
			double test2 = Math.ceil(((test-check)/1000.0)/3600.0);
			System.out.println(test2);
		}*/
	}
}
