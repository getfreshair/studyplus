package always.awake.studyplus.block.model.service;

import java.util.ArrayList;
import java.util.HashMap;

public interface BlockService {

	// 그룹,목표 리스트 조회용 메소드
	HashMap<String, Object> selectStudyTimes(int member_Code);

}
