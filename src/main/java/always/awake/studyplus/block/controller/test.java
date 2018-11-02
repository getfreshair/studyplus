package always.awake.studyplus.block.controller;

import java.text.ParseException;
import java.util.HashMap;

public class test {
	public static void main(String[] args) throws ParseException {
		

		HashMap<String,Integer> a = new HashMap<String,Integer>();
		System.out.println(a.get("1"));
		a.put("1",20);
		if(a.get("1") != null ) {
			a.put("1", a.get("1") + 1);
		} else {
			a.put("1",20);
		}
		System.out.println(a.get("1"));
	}
}
