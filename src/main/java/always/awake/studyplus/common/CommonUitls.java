package always.awake.studyplus.common;

import java.util.UUID;

public class CommonUitls {
	public static String getRandomString(){
		return UUID.randomUUID().toString().replaceAll("-", "");
	}
}