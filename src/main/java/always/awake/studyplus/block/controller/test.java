package always.awake.studyplus.block.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

public class test {
	public static void main(String[] args) throws ParseException {
		

		Calendar a = new GregorianCalendar();
		a.set(Calendar.HOUR_OF_DAY, 24);
		a.add(Calendar.DATE, -1);
		a.set(Calendar.MINUTE, 0);
		a.set(Calendar.SECOND, 0);
		a.set(Calendar.MILLISECOND, 0);
		System.out.println(new SimpleDateFormat("yyyy-MM-dd : HH:mm:ss").format(a.getTimeInMillis()));
		
		Calendar b = new GregorianCalendar();
		b.set(Calendar.HOUR_OF_DAY, 23);
		b.add(Calendar.DATE, -1);
		b.set(Calendar.MINUTE, 0);
		b.set(Calendar.SECOND, 0);
		b.set(Calendar.MILLISECOND, 0);
		System.out.println(new SimpleDateFormat("yyyy-MM-dd : HH:mm:ss").format(b.getTimeInMillis()));
		
		System.out.println((a.getTimeInMillis()-b.getTimeInMillis())/1000);
/*	if(check < test) {
			System.out.println(test-check);
			double test2 = Math.ceil(((test-check)/1000.0)/3600.0);
			System.out.println(test2);
		}*/
	}
}
