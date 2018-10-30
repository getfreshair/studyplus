package always.awake.studyplus.studyPlanner.model.service;

import java.util.HashMap;

import always.awake.studyplus.studyPlanner.model.vo.StudyTime;

public interface StudyPlannerService {

	//일간 공부량 차트
	HashMap<String, Object> selectTodayChart(HashMap<String, Object> hmap);

}
