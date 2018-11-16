package always.awake.studyplus.block.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import always.awake.studyplus.block.model.vo.StudyTimeInfo;
import always.awake.studyplus.game.model.vo.PlayGameUsers;

public interface BlockService {

	// 그룹,목표 리스트 조회용 메소드
	HashMap<String, Object> selectStudyTimes(int member_Code);

	// 공부시간 저장용 메소드
	int insertStudyTimes(HashMap<String, ArrayList<StudyTimeInfo>> list, int member_Code);

	// 게임 유저 조회용
	List<Object> selectGamePlayerList(int member_code);

}
