package always.awake.studyplus.admin.common;

import java.util.UUID;

public class CommonUtils {
	public static String getRandomString() {
		
		
		//32비트의 랜덤한 문자를 생성해주는 클래스
		return UUID.randomUUID().toString().replaceAll("-", ""); //-라는 기호가 있으면 뺴라			
	}
}
